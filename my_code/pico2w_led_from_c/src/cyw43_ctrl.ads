
with Ada.Containers.Vectors;

with RP2350; use RP2350;

package  CYW43_Ctrl is

   package Cyw43_Vector_Package is new Ada.Containers.Vectors (Positive, Byte);
   subtype Cyw43_Vector is Cyw43_Vector_Package.Vector;

-- Type definitions to match the C structure in Cyw43_Intternal.h
   --  type Cyw43_Int (BL_Bytes : Positive) is record
   type CYW43_Record is record
      Startup_T0       : UInt32;
      Last_Header      : U32_Array (1 .. 2);
      Bus_Is_Up        : Boolean := False;
      SPI_Buffer       : Cyw43_Vector;
      --  SPI_Buffer       : U8_Array (1 .. BL_Bytes);
   end record;

   procedure CYW43_Init;

end CYW43_Ctrl;