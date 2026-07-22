
with System;

with RP2350; use RP2350;
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0;
with RP2350.SIO;

package body RP2350_CYW43439 is

   -- Bitmasks
   Mask_REG_ON   : constant uint32 := 16#0080_0000#;
   Mask_DATA     : constant uint32 := 16#0100_0000#;
   Mask_CS       : constant uint32 := 16#0200_0000#;
   Mask_CLK      : constant uint32 := 16#2000_0000#;
   All_Pins_Mask : constant uint32 := 16#2380_0000#;

function Check_Chip_Communication return Unsigned_32 is
   use RP2350.SIO;
   Read_Header : constant Unsigned_32 := Shift_Left(16#0014#, 11) or 4;
   Result      : Unsigned_32 := 0;
begin
   SIO_Periph.GPIO_OUT_CLR := Mask_CS;
   -- Send Read Request Header
   Write_gSPI_Word32 (Read_Header);

   -- Enforce turnaround delay for hardware line direction swap
   Wait (Milliseconds (5));

   -- Read 4 bytes back from the chip
   Result := Shift_Left (Unsigned_32 (Read_gSPI_Byte), 24) or
             Shift_Left (Unsigned_32 (Read_gSPI_Byte), 16) or
             Shift_Left (Unsigned_32 (Read_gSPI_Byte), 8)  or
             Unsigned_32 (Read_gSPI_Byte);

   SIO_Periph.GPIO_OUT_SET := Mask_CS;

   return Result;

   end Check_Chip_Communication;

   procedure Initialize_gSPI is
      use RP2350;
      use RP2350.IO_BANK0;
      use RP2350.SIO;
      Wake_Header   : constant Unsigned_32 :=
      16#8000_0000# or Shift_Left(16#00A2#, 11) or 1;
   begin
      -- 1. Route pins to SIO function (Function 5 on RP2350)
      IO_BANK0_Periph.GPIO23_CTRL.FUNCSEL := IO_BANK0.siob_proc_23;
      IO_BANK0_Periph.GPIO24_CTRL.FUNCSEL := IO_BANK0.siob_proc_24;
      IO_BANK0_Periph.GPIO25_CTRL.FUNCSEL := IO_BANK0.siob_proc_25;
      IO_BANK0_Periph.GPIO29_CTRL.FUNCSEL := IO_BANK0.siob_proc_29;

      -- 2.  Configure the Input Enable (IE) using SVD PADS types
      -- Bit 6 = IE, Bit 3 = PUE (Pull-Up), Bits 4-5 = Drive Strength (12mA)
      
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.IE := 1;
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.PUE := 1;
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.DRIVE := PADS_BANK0.Val_12mA;

      PADS_BANK0.PADS_BANK0_Periph.GPIO25 := (0, 0, 0, 0, PADS_BANK0.Val_12mA, 0, 0, 0, 0);
      PADS_BANK0.PADS_BANK0_Periph.GPIO29 := (0, 0, 0, 0, PADS_BANK0.Val_12mA, 0, 0, 0, 0);

      -- 3. Configure default output directions and isolate bus with CS high
      SIO_Periph.GPIO_OE_SET  :=  All_Pins_Mask;    --  0x23800000

      -- 4. Set idle state, Cycle physical Power to the CYW43439
      SIO_Periph.GPIO_OUT_SET := Mask_CS or Mask_REG_ON;  --   0x2800000
      -- 5. Cycle physical hardware power to CYW43439
      SIO_Periph.GPIO_OUT_CLR := Mask_REG_ON;  --  0x800000
      Wait (Milliseconds (50));

      SIO_Periph.GPIO_OUT_SET :=  Mask_REG_ON;  --  0x800000
      --  Wait for internal wireless boot ROM to execute
      Wait (Milliseconds (250));

      -- 6. Execute clock wake frame over the bus
      SIO_Periph.GPIO_OUT_CLR := Mask_CS;  --  0x2000000
      Write_gSPI_Word32 (Wake_Header);
      Write_gSPI_Byte (2);  --  Request active HT internal clock
      SIO_Periph.GPIO_OUT_SET := Mask_CS;  --  0x2000000

   end Initialize_gSPI;

   procedure Write_gSPI_Byte (Data : Unsigned_8) is
      use RP2350.SIO;
      Temp  : Unsigned_8 := Data;
   begin
      -- Send MSB First
      for Bit in 1 .. 8 loop
         SIO_Periph.GPIO_OUT_CLR := Mask_CLK; -- Clock Low
         if (Temp and 16#80#) /= 0 then
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

   end Write_gSPI_Byte;

   function Read_gSPI_Byte return Unsigned_8 is
      use RP2350.SIO;
      Result : Unsigned_8 := 0;
   begin
      -- Relinquish host drive control so CYW43439 can transmit
      SIO_Periph.GPIO_OE_CLR := Mask_DATA;
      for Bit_Num in 1 .. 8 loop
         SIO_Periph.GPIO_OUT_CLR := Mask_CLK; -- Clock Low
         Wait (Microseconds (5));
         SIO_Periph.GPIO_OUT_SET := Mask_CLK; -- Clock High
         --  Shift tracking register to make room for next incoming bit
         Result := Shift_Left (Result, 1);
         --  Capture pin level from hardware input
         if (SIO_Periph.GPIO_IN and Mask_DATA) /= 0 then
            -- Push 1 into LSB of result
            Result := Result or 16#01#;
         end if;

         Wait (Microseconds (5));
      end loop;

      return Result;

   end Read_gSPI_Byte;

    procedure Write_gSPI_Word32 (Value : Unsigned_32) is
   begin
      -- Split the 32-bit word into 4 bytes (MSB first) and stream them
      Write_gSPI_Byte (Unsigned_8 (Shift_Right (Value, 24) and 16#FF#));
      Write_gSPI_Byte (Unsigned_8 (Shift_Right (Value, 16) and 16#FF#));
      Write_gSPI_Byte (Unsigned_8 (Shift_Right (Value, 8)  and 16#FF#));
      Write_gSPI_Byte (Unsigned_8 (Value and 16#FF#));

   end Write_gSPI_Word32;

   procedure Set_Onboard_LED (Enable : Boolean) is
      use RP2350.SIO;
      -- CYW43439 gSPI Protocol Header definitions:
      -- Bit 31: Write Command (1)
      -- Bit 30: Auto-Increment Address (1)
      -- Bits 28-26: Function 1 - Backplane (001)
      -- Bits 25-11: Register Address (ChipCommon GPIO Output Register)
      -- Bits 10-0: Data size in bytes (4 bytes for a 32-bit register write)
      
      -- CYW43439 ChipCommon GPIO Control address is 16#1800_0000# offset
      -- CYW43439 Backplane Register for ChipCommon GPIO (Function 1)
      GPIO_Out_Addr  : constant Unsigned_32 := 16#1800_0064#; 
      
      -- gSPI Command Header Generation Formula
      SPI_Header     : constant Unsigned_32 := 
                         16#8000_0000# or                  -- Write mode bit
                         16#4000_0000# or                  -- Auto-increment bit
                         Shift_Left (1, 26) or             -- Function 1 (Backplane)
                         Shift_Left (GPIO_Out_Addr, 11) or -- Target memory address
                         4;                                -- Length of payload (4 Bytes)
      Payload_Value  : Unsigned_32 := 0;
   begin
      -- Determine payload state for WL_GPIO0
      if Enable then
         Payload_Value := 1; -- Drive WL_GPIO0 High (LED On)
      else
         Payload_Value := 0; -- Drive WL_GPIO0 Low (LED Off)
      end if;

      -- Execute the gSPI bus cycle transaction
      -- Assert Chip Select Low to begin transaction
      SIO_Periph.GPIO_OUT_CLR  := Mask_CS;
      Write_gSPI_Word32 (SPI_Header);    -- Stream Header over SPI line
     
      -- CRITICAL CRUX: The gSPI Turnaround Delay
      -- The CYW43439 requires a brief gap here to process the command 
      -- before streaming the actual payload bits.
      Wait (Milliseconds (5));
      Write_gSPI_Word32 (Payload_Value); -- Stream Data Payload over SPI line
      Wait (Milliseconds (5));
      -- Deassert Chip Select High to conclude transfer
      SIO_Periph.GPIO_OUT_SET := Mask_CS;

   end Set_Onboard_LED;

   procedure Wait (Duration : Time_Span) is
      Wait_Time : constant Time := Clock + Duration;
   begin
      delay until Wait_Time;

   end Wait;

end RP2350_CYW43439;
