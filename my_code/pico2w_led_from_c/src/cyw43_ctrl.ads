
with RP2350; use RP2350;
with CYW43_Types; use CYW43_Types;

package  CYW43_Ctrl is

-- Type definitions to match the C structure in Cyw43_Intternal.h
   --  type Cyw43_Int (BL_Bytes : Positive) is record
   type CYW43_Record (BL : Positive) is record
      Startup_T0       : UInt32;
      Last_Header      : U32_Array (1 .. 2);
      Bus_Is_Up        : Boolean := False;
      SPI_Buffer       : U8_Array (1 .. BL);
   end record;

   function  CYW43_Init return Boolean;

end CYW43_Ctrl;