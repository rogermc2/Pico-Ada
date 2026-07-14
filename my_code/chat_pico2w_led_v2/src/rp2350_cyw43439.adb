
with RP2350.IO_BANK0;
with System;

with Registers; use Registers;

with RP2350.SIO; use RP2350.SIO;

package body RP2350_CYW43439 is

   -- Use the conversion instance to safely create pointers from addresses
   function Reg_Ptr (Addr : System.Address) return Word_Convert.Object_Pointer is
   begin
      return Word_Convert.To_Pointer (Addr);
   end Reg_Ptr;

function Check_Chip_Communication return Unsigned_32 is
   --  Out_Set : Volatile_Word renames
   --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
   --  Out_Clr : Volatile_Word renames
   --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;  
   -- Read (Bit 31 = 0), Function 0, Address 16#14# (Test Register), Length 4 Bytes
   Read_Header : constant Unsigned_32 := Shift_Left(16#0014#, 11) or 4;
   Periph      : SIO_Peripheral;
   Result      : Unsigned_32 := 0;
begin
   --  Out_Clr := Volatile_Word (Mask_CS);
   Periph.GPIO_Out_Clr := Mask_CS;

   -- Send Read Request Header
   Write_gSPI_Word32 (Read_Header);

   -- Enforce turnaround delay for hardware line direction swap
   Wait (Milliseconds (5));
   --  for I in 1 .. 50 loop null; end loop;

   -- Read 4 bytes back from the chip
   Result := Shift_Left(Unsigned_32(Read_gSPI_Byte), 24) or
             Shift_Left(Unsigned_32(Read_gSPI_Byte), 16) or
             Shift_Left(Unsigned_32(Read_gSPI_Byte), 8)  or
             Unsigned_32(Read_gSPI_Byte);

   Periph.GPIO_OUT_SET := Mask_CS;
   --  Out_Set := Volatile_Word (Mask_CS);

   return Result;

   end Check_Chip_Communication;

   procedure Initialize_gSPI is
      use RP2350;
      -- Control registers for mapping functions
      GPIO23_Ctrl : IO_BANK0.GPIO23_CTRL_Register;
      GPIO24_Ctrl : IO_BANK0.GPIO24_CTRL_Register;
      GPIO25_Ctrl : IO_BANK0.GPIO25_CTRL_Register;
      GPIO29_Ctrl : IO_BANK0.GPIO29_CTRL_Register;
      --  GPIO23_Ctrl : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0BC#)).all;
      --  GPIO24_Ctrl : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0C4#)).all;
      --  GPIO25_Ctrl : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0CC#)).all;
      --  GPIO29_Ctrl : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0EC#)).all;

      -- Output enables via SIO
      --  OE_Set      : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OE_SET_Offset)).all;
      --  Out_Set     : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      --  Out_Clr     : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;

       Wake_Header : constant Unsigned_32 :=
        16#8000_0000# or 16#4000_0000# or
         Shift_Left (16#1800_00A2#, 11) or 1;
      Periph : SIO_Peripheral;
   begin
      -- 1. Route pins to SIO function (Function 5 on RP2350)
      GPIO23_Ctrl.FUNCSEL := IO_BANK0.siob_proc_23;
      GPIO24_Ctrl.FUNCSEL := IO_BANK0.siob_proc_24; -- DATA
      GPIO25_Ctrl.FUNCSEL := IO_BANK0.siob_proc_25; -- CS
      GPIO29_Ctrl.FUNCSEL := IO_BANK0.siob_proc_29; -- CLK

      -- 2. Configure default output directions
      Periph.GPIO_OE_SET  :=  All_Pins_Mask;
      --  OE_Set  :=  Volatile_Word (All_Pins_Mask);

      -- 3. Set idle state
      Periph.GPIO_OUT_SET := Mask_CS or Mask_REG_ON;
      --  Out_Set := Volatile_Word (Mask_CS or Mask_REG_ON);

      Periph.GPIO_OUT_CLR := Mask_REG_ON;
      --  Out_Clr := Volatile_Word (Mask_REG_ON);
      Wait (Milliseconds (50));
      --  For I in 1 .. 50000 loop  -- Settle delay
      --     null;
      --  end loop;

      Periph.GPIO_OUT_SET :=  Mask_REG_ON;
      --  Out_Set := Volatile_Word (Mask_REG_ON);
      --  Wait for internal wireless boot ROM to execute
      Wait (Milliseconds (25));
      --  For I in 1 .. 25000 loop
      --     null;
      --  end loop;
      Periph.GPIO_OUT_CLR := Mask_CS; 
      --  Out_Clr := Volatile_Word (Mask_CS);

      Write_gSPI_Word32 (Wake_Header);
      Write_gSPI_Byte (2);  --  Request active HT internal clock
      Periph.GPIO_OUT_SET := Mask_CS;
      --  Out_Set := Volatile_Word (Mask_CS);

      Wait (Milliseconds (100));
      --  For I in 1 .. 100000 loop  -- Settle delay
      --     null;
      --  end loop;

   end Initialize_gSPI;

   procedure Write_gSPI_Byte (Data : Unsigned_8) is
      --  Out_Set : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      --  Out_Clr : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;
      --  OE_Set  : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OE_SET_Offset)).all;
      Periph  : SIO_Peripheral;
      Temp    : Unsigned_8 := Data;
   begin
      -- Ensure host drives the shared data line
      --  OE_Set := Volatile_Word (Mask_DATA);

      -- Send MSB First
      for Bit in 1 .. 8 loop
         Periph.GPIO_OUT_CLR := Mask_CLK; -- Clock Low
         --  Out_Clr := Volatile_Word (Mask_CLK); -- Clock Low

         if (Temp and 16#80#) /= 0 then
            Periph.GPIO_OUT_SET := Mask_DATA;
            --  Out_Set := Volatile_Word (Mask_DATA);
         else
            Periph.GPIO_OUT_CLR := Mask_DATA;
            --  Out_Clr := Volatile_Word (Mask_DATA);
         end if;

         -- Brief delay matching CYW43439 timing constraints (up to 33MHz limit)
         Wait (Milliseconds (5));
         --  for I in 1 .. 5 loop null; end loop;
         -- Clock High (CYW43439 samples on rising edge)
         Periph.GPIO_OUT_SET := Mask_CLK;
         --  Out_Set := Volatile_Word (Mask_CLK);
         Temp := Shift_Left (Temp, 1);
         
         Wait (Milliseconds (5));
         --  for I in 1 .. 5 loop null; end loop;
      end loop;

   end Write_gSPI_Byte;

   function Read_gSPI_Byte return Unsigned_8 is
      use RP2350;
      --  Out_Set : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      --  Out_Clr : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;
      --  OE_Clr  : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OE_CLR_Offset)).all;
      --  GPIO_In : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_IN_Offset)).all;
      Periph  : SIO_Peripheral;
      Result  : Unsigned_8 := 0;
   begin
      -- Relinquish host drive control so CYW43439 can transmit
       Periph.GPIO_OE_CLR := Mask_DATA;
      --  OE_Clr := Volatile_Word (Mask_DATA);

      for Bit in 1 .. 8 loop
          Periph.GPIO_OUT_CLR := Mask_CLK; -- Clock Low
         --  Out_Clr := Volatile_Word (Mask_CLK); -- Clock Low
         for I in 1 .. 5 loop null; end loop;

         Periph.GPIO_OUT_SET := Mask_CLK; -- Clock High
         --  Out_Set := Volatile_Word (Mask_CLK); -- Clock High
         Result  := Shift_Left (Result, 1);

         -- Sample line after edge propagation delay
         --  if (GPIO_In and Volatile_Word (Mask_DATA)) /= 0 then
         if (Periph.GPIO_IN and Mask_DATA) /= 0 then
            Result := Result or 16#01#;
         end if;

         Wait (Milliseconds (5));
         --  for I in 1 .. 5 loop null; end loop;
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
      --  Out_Set : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      --  Out_Clr : Volatile_Word renames
      --   Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;
      
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
      Periph         : SIO_Peripheral;                  
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
      Periph.GPIO_OUT_CLR  := Mask_CS;
      --  Out_Clr := Volatile_Word (Mask_CS);
      Write_gSPI_Word32 (SPI_Header);    -- Stream Header over SPI line
     
      -- CRITICAL CRUX: The gSPI Turnaround Delay
      -- The CYW43439 requires a brief gap here to process the command 
      -- before you stream the actual payload bits.
      Wait (Milliseconds (5));
      Write_gSPI_Word32 (Payload_Value); -- Stream Data Payload over SPI line
      Wait (Milliseconds (5));
       -- Deassert Chip Select High to conclude transfer
      Periph.GPIO_OUT_SET := Mask_CS;

   end Set_Onboard_LED;

   procedure Wait (Duration : Time_Span) is
      Wait_Time : constant Time := Clock + Duration;
   begin
      delay until Wait_Time;

   end Wait;

end RP2350_CYW43439;
