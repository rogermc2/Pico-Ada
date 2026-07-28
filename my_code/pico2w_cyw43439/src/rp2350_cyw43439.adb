
with System;

with Interfaces;

with RP2350; use RP2350;
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0;
with RP2350.SIO;

package body RP2350_CYW43439 is

   type SPI_Command is record
      Write_Mode   : Boolean;  -- True = Write, False = Read
      Auto_Inc     : Boolean;  -- True = Increment address automatically
      Function_Num : uint2;    -- 0: Bus/gSPI, 1: Backplane, 2: WLAN Data
      Address      : uint15;   -- Register address or buffer offset
      Data_Length  : uint13;   -- Number of bytes to transfer
   end record;
   pragma Pack (SPI_Command);

   type SPI_Response is record
      Data_Not_Ready : Boolean;  -- True if the chip needs more time (retry required)
      Cmd_Error      : Boolean;  -- True if the previous command was invalid
      WLAN_Interrupt : Boolean;  -- True if WLAN data is pending
      Reserved       : uint15;   -- Hardware reserved bits
      Bus_Status     : uint24;   -- Internal status flags (e.g., credit availability)
   end record;
   pragma Pack (SPI_Response);

   type Word32_Register is record
      -- Individual bitfields parsed directly from the RP2350 SVD schema
      Data_Payload : UInt32; 
   end record with Volatile_Full_Access, Size => 32;
      --   Bit_Order => System.Low_Order_First;

   -- Bitmasks
   Mask_REG_ON   : constant uint32 := 16#0080_0000#;
   Mask_DATA     : constant uint32 := 16#0100_0000#;
   Mask_CS       : constant uint32 := 16#0200_0000#;  
   Mask_CLK      : constant uint32 := 16#2000_0000#;
   All_Pins_Mask : constant uint32 := 16#2380_0000#;

   function Read_gSPI_Word32 return Unsigned_32;

   function Check_Chip_Communication return Unsigned_32 is  
      use RP2350.SIO;
      --  Shift_Left(16#0014#, 11) = 16#A000#
      Read_FEEDBEAD : constant Unsigned_32 := Shift_Left(16#0014#, 11) or 4;
      Result        : Unsigned_32 := 0;
   begin
      -- Send Read Request
      Write_gSPI_Word32 (Read_FEEDBEAD);
      -- Enforce turnaround delay for hardware line direction swap
      Wait (Milliseconds (5));
      Result := Read_gSPI_Word32;

      return Result;

   end Check_Chip_Communication;

   procedure Configure_Pins is
      use RP2350;
      use RP2350.IO_BANK0;
      use RP2350.SIO;
   begin
      -- Route pins to SIO function (Function 5 on RP2350)
      IO_BANK0_Periph.GPIO23_CTRL.FUNCSEL := IO_BANK0.siob_proc_23;
      IO_BANK0_Periph.GPIO24_CTRL.FUNCSEL := IO_BANK0.siob_proc_24;
      IO_BANK0_Periph.GPIO25_CTRL.FUNCSEL := IO_BANK0.siob_proc_25;
      IO_BANK0_Periph.GPIO29_CTRL.FUNCSEL := IO_BANK0.siob_proc_29;

      --  Configure the Input Enable (IE) using SVD PADS types
      --  Bit 6 = IE, Bit 3 = PUE (Pull-Up), Bits 4-5 = Drive Strength (12mA)
   
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.IE := 1;    --  Input enable
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.PUE := 1;   --  Pull up enable
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.DRIVE := PADS_BANK0.Val_12mA;

      PADS_BANK0.PADS_BANK0_Periph.GPIO25.DRIVE := PADS_BANK0.Val_12mA;
      PADS_BANK0.PADS_BANK0_Periph.GPIO29.DRIVE := PADS_BANK0.Val_12mA;

   end Configure_Pins;

   procedure Reset_CYW is
         use RP2350.SIO;
   begin
      --  Configure SIO_Periph default output directions and isolate bus with CS high
      SIO_Periph.GPIO_OE_SET :=  All_Pins_Mask;    --  0x23800000

      -- Assert Hard Reset: Drive WL_REG_ON Low via SIO Core Registers
      SIO_Periph.GPIO_OUT_CLR := Mask_REG_ON;
      Wait (Milliseconds (20));
      --  Release Reset: Drive WL_REG_ON High
      SIO_Periph.GPIO_OUT_SET := Mask_REG_ON;
      Wait (Milliseconds (50));

   end Reset_CYW;

   procedure Initialize_gSPI is
      use RP2350;
      use RP2350.SIO;
      --  poll with a read command to F0 address 0x14. 
      --  Read F0: 10000000
      --  Address 0x14: 00012000
      --  Address 0x14 contains a predefined bit pattern: 0xFEEDBEAD
      --  Shift_Left 11 bits shift over the Packet length field
      --  into the address field
      --  Shift_Left (16#00A2#, 11) = 16#0005_1000#
      --  16#00A2# = 10100010 = 162
      --  shift 11: 101 0001 0000 0000 0000 = 51000
 
      --  A_Command   : constant Unsigned_32 :=
      --     16#8000_0000# or Shift_Left (16#00A2#, 11) or 1;

      --  Shift_Left (16#0014#, 11) = 16#A000#
      --  Wake_Command packet length : 4 bytes
      Wake_Command   : constant Unsigned_32 := Shift_Left(16#0014#, 11) or 4;
   begin
      Configure_Pins;
      Reset_CYW;

      --  Execute clock wake frame over the bus
      Write_gSPI_Word32 (Wake_Command);
      --  Write_gSPI_Byte (2);  --  Request active HT internal clock

   end Initialize_gSPI;

   --  function Read_gSPI_Byte return Unsigned_8 is
   --     use RP2350.SIO;
   --     Result : Unsigned_8 := 0;
   --  begin
   --     -- Relinquish host drive control so CYW43439 can transmit
   --     SIO_Periph.GPIO_OE_CLR := Mask_DATA;
   --     --  Read eight bits sequentially from channel's GPIO_IN bit
   --     for Bit_Num in 1 .. 8 loop
   --       --  GPIO_OUT is used to clock data into GPIO_IN
   --        SIO_Periph.GPIO_OUT_CLR := Mask_CLK; -- Set Clock Pin Low
   --        Wait (Microseconds (5));             -- 5 uSec clock pulse
   --        SIO_Periph.GPIO_OUT_SET := Mask_CLK; -- Set Clock Pin High
   --        --  Shift tracking register to make room for next incoming bit
   --        Result := Shift_Left (Result, 1);
   --        --  Capture bit value from GPIO pin selected by Mask_DATA
   --        if (SIO_Periph.GPIO_IN and Mask_DATA) /= 0 then
   --           -- Push 1 into LSB of result
   --           Result := Result or 16#01#;
   --        end if;

   --        Wait (Microseconds (5));
   --      SIO_Periph.GPIO_OE_Set := Mask_DATA;

   --     end loop;

   --     return Result;

   --  end Read_gSPI_Byte;

   function Read_gSPI_Word32 return Unsigned_32 is
      use RP2350.SIO;
      Result : Unsigned_32 := 0;
   begin
      --  Result := Shift_Left (Unsigned_32 (Read_gSPI_Byte), 24) or
      --           Shift_Left (Unsigned_32 (Read_gSPI_Byte), 16) or
      --           Shift_Left (Unsigned_32 (Read_gSPI_Byte), 8)  or
      --           Unsigned_32 (Read_gSPI_Byte);

-- Relinquish host drive control so CYW43439 can transmit
      SIO_Periph.GPIO_OE_CLR := Mask_DATA;
      --  Read eight bits sequentially from channel's GPIO_IN bit
      for Bit_Num in 1 .. 32 loop
        --  GPIO_OUT is used to clock data into GPIO_IN
         SIO_Periph.GPIO_OUT_CLR := Mask_CLK; -- Set Clock Pin Low
         Wait (Microseconds (5));             -- 5 uSec clock pulse
         SIO_Periph.GPIO_OUT_SET := Mask_CLK; -- Set Clock Pin High

         --  Shift Result left to make room for next incoming bit
         Result := Shift_Left (Result, 1);
         --  Capture bit value from GPIO pin selected by Mask_DATA
         if (SIO_Periph.GPIO_IN and Mask_DATA) /= 0 then
            -- Push 1 into LSB of result
            Result := Result or 16#01#;
         end if;

         Wait (Microseconds (5));
       SIO_Periph.GPIO_OE_Set := Mask_DATA;

      end loop;

      return Result;

   end Read_gSPI_Word32;

   --  procedure Write_gSPI_Byte (Data : Unsigned_8) is
   --     use RP2350.SIO;
   --     Temp  : Unsigned_8 := Data;
   --  begin
   --     SIO_Periph.GPIO_OUT_CLR := Mask_CS;
   --     -- Send MSB First
   --     for Bit in 1 .. 8 loop
   --        SIO_Periph.GPIO_OUT_CLR := Mask_CLK; -- Clock Low
   --        if (Temp and 16#80#) /= 0 then
   --           SIO_Periph.GPIO_OUT_SET := Mask_DATA;
   --        else
   --           SIO_Periph.GPIO_OUT_CLR := Mask_DATA;
   --        end if;

   --        -- Brief delay matching CYW43439 timing constraints (up to 33MHz limit)
   --        Wait (Microseconds (5));
   --        -- Clock High (CYW43439 samples on rising edge)
   --        SIO_Periph.GPIO_OUT_SET := Mask_CLK;
   --        Temp := Shift_Left (Temp, 1);
   --        Wait (Microseconds (5));
   --     end loop;
   --     SIO_Periph.GPIO_OUT_SET := Mask_CS;

   --  end Write_gSPI_Byte;

    procedure Write_gSPI_Word32 (Value : Unsigned_32) is
      use RP2350.SIO;
      Temp  : UInt32 := UInt32 (Value);
   begin
      -- Split the 32-bit word into 4 bytes (MSB first) and stream them
      --  Write_gSPI_Byte (Unsigned_8 (Shift_Right (Value, 24) and 16#FF#));
      --  Write_gSPI_Byte (Unsigned_8 (Shift_Right (Value, 16) and 16#FF#));
      --  Write_gSPI_Byte (Unsigned_8 (Shift_Right (Value, 8)  and 16#FF#));
      --  Write_gSPI_Byte (Unsigned_8 (Value and 16#FF#));

      SIO_Periph.GPIO_OUT_CLR := Mask_CS;  --  0x2000000
      -- Send MSB First
      for Bit in 1 .. 32 loop
         SIO_Periph.GPIO_OUT_CLR := Mask_CLK; -- Clock Low
         if (Temp and 1) /= 0 then
         --  if (Temp and 16#80#) /= 0 then
            SIO_Periph.GPIO_OUT_SET := Mask_DATA;
         else
            SIO_Periph.GPIO_OUT_CLR := Mask_DATA;
         end if;

         -- Brief delay matching CYW43439 timing constraints (up to 33MHz limit)
         Wait (Microseconds (5));
         -- Clock High (CYW43439 samples on rising edge)
         SIO_Periph.GPIO_OUT_SET := Mask_CLK;
         Temp := Shift_Left (Temp, 1);
         Wait (Microseconds (5));
      end loop;

      SIO_Periph.GPIO_OUT_SET := Mask_CS;  --  0x2000000

   end Write_gSPI_Word32;

   procedure Wait (Duration : Time_Span) is
      Wait_Time : constant Time := Clock + Duration;
   begin
      delay until Wait_Time;

   end Wait;

end RP2350_CYW43439;
