
with System;

package body RP2350_CYW43439 is

      -- Use the conversion instance to safely create pointers from addresses
   function Reg_Ptr (Addr : System.Address) return Word_Convert.Object_Pointer is
   begin
      return Word_Convert.To_Pointer (Addr);
   end Reg_Ptr;

   procedure Initialize_gSPI is
      -- Control registers for mapping functions
      GPIO23_Ctrl : Volatile_Word renames
       Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0BC#)).all;
      GPIO24_Ctrl : Volatile_Word renames
       Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0C4#)).all;
      GPIO25_Ctrl : Volatile_Word renames
       Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0CC#)).all;
      GPIO29_Ctrl : Volatile_Word renames
       Reg_Ptr (System'To_Address (IO_BANK0_Base + 16#0EC#)).all;

      -- Output enables via SIO
      OE_Set      : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OE_SET_Offset)).all;
      Out_Set     : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      Out_Clr     : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;

       Wake_Header : constant Unsigned_32 :=
        16#8000_0000# or 16#4000_0000# or
         Shift_Left (16#1800_00A2#, 11) or 1;
   begin
      -- 1. Route pins to SIO function (Function 5 on RP2350)
      GPIO23_Ctrl := 5;
      GPIO24_Ctrl := 5; -- DATA
      GPIO25_Ctrl := 5; -- CS
      GPIO29_Ctrl := 5; -- CLK

      -- 2. Configure default output directions
      OE_Set  := Mask_CS or Mask_CLK or Mask_DATA or Mask_REG_ON;
      Out_Set := Mask_CS; -- Drive CS high (Idle)

      Out_Clr := Mask_REG_ON;
      For I in 1 .. 50000 loop  -- Settle delay
         null;
      end loop;

      Out_Set := Mask_REG_ON;
      --  Wait for internal wireless boot ROM to execute
      For I in 1 .. 25000 loop
         null;
      end loop;
      Out_Clr := Mask_CS; 

      Write_gSPI_Word32 (Wake_Header);
      Write_gSPI_Byte (2);  --  Request active HT internal clock
      Out_Set := Mask_CS;

      For I in 1 .. 100000 loop  -- Settle delay
         null;
      end loop;

   end Initialize_gSPI;

   procedure Write_gSPI_Byte (Data : Unsigned_8) is
      Out_Set : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      Out_Clr : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;
      OE_Set  : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OE_SET_Offset)).all;
      Temp    : Unsigned_8 := Data;
   begin
      -- Ensure host drives the shared data line
      OE_Set := Mask_DATA;

      -- Send MSB First
      for Bit in 1 .. 8 loop
         Out_Clr := Mask_CLK; -- Clock Low

         if (Temp and 16#80#) /= 0 then
            Out_Set := Mask_DATA;
         else
            Out_Clr := Mask_DATA;
         end if;

         -- Brief delay matching CYW43439 timing constraints (up to 33MHz limit)
         for I in 1 .. 5 loop null; end loop;

         Out_Set := Mask_CLK; -- Clock High (CYW43439 samples on rising edge)
         Temp    := Shift_Left (Temp, 1);
         
         for I in 1 .. 5 loop null; end loop;
      end loop;
   end Write_gSPI_Byte;

   function Read_gSPI_Byte return Unsigned_8 is
      Out_Set : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      Out_Clr : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;
      OE_Clr  : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OE_CLR_Offset)).all;
      GPIO_In : Volatile_Word renames
       Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_IN_Offset)).all;
      Result  : Unsigned_8 := 0;
   begin
      -- Relinquish host drive control so CYW43439 can transmit
      OE_Clr := Mask_DATA;

      for Bit in 1 .. 8 loop
         Out_Clr := Mask_CLK; -- Clock Low
         for I in 1 .. 5 loop null; end loop;

         Out_Set := Mask_CLK; -- Clock High
         Result  := Shift_Left (Result, 1);

         -- Sample line after edge propagation delay
         if (GPIO_In and Mask_DATA) /= 0 then
            Result := Result or 16#01#;
         end if;
         for I in 1 .. 5 loop null; end loop;
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
      Out_Set : Volatile_Word renames Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_SET_Offset)).all;
      Out_Clr : Volatile_Word renames Reg_Ptr (System'To_Address (SIO_Base + SIO_GPIO_OUT_CLR_Offset)).all;
      
      -- CYW43439 gSPI Protocol Header definitions:
      -- Bit 31: Write Command (1)
      -- Bit 30: Auto-Increment Address (1)
      -- Bits 28-26: Function 1 - Backplane (001)
      -- Bits 25-11: Register Address (ChipCommon GPIO Output Register)
      -- Bits 10-0: Data size in bytes (4 bytes for a 32-bit register write)
      
      -- CYW43439 ChipCommon GPIO Control address is 16#1800_0000# offset
      GPIO_Out_Addr  : constant Unsigned_32 := 16#1800_0064#; 
      
      -- gSPI Command Header Generation Formula
      SPI_Header     : constant Unsigned_32 := 
                         16#8000_0000# or                  -- Write mode bit
                         16#4000_0000# or                  -- Auto-increment bit
                         Shift_Left (1, 26) or             -- Function 1 (Backplane)
                         Shift_Left (GPIO_Out_Addr, 11) or -- Target memory address
                         4;                                -- Length of payload (4 Bytes)
                         
      Payload_Value  : Unsigned_32 := 16#0000_0000#;
   begin
      -- Determine payload state for WL_GPIO0
      if Enable then
         Payload_Value := 16#0000_0001#; -- Drive WL_GPIO0 High (LED On)
      else
         Payload_Value := 16#0000_0000#; -- Drive WL_GPIO0 Low (LED Off)
      end if;

      -- Execute the gSPI bus cycle transaction
      Out_Clr := Mask_CS; -- Assert Chip Select Low to begin transaction
      Write_gSPI_Word32 (SPI_Header);    -- Stream Header over SPI line
      Write_gSPI_Word32 (Payload_Value); -- Stream Data Payload over SPI line
      Out_Set := Mask_CS; -- Deassert Chip Select High to conclude transfer

   end Set_Onboard_LED;

end RP2350_CYW43439;
