with System;

with RP2350; use RP2350;

package Bounded_Vectors is

   Max_Capacity : constant := 2048;
   
   --  type Byte_Array is array (1 .. Max_Capacity) of Byte;
   type Byte_Array is array (Positive range <>) of Byte;

   type U8_Vector (Size : Positive) is record
      Data  : Byte_Array (1 .. Size) := (others => 0);
      Count : Natural := 0;
   end record;

   procedure Clear (V : out U8_Vector);
   procedure Append (V : in out U8_Vector; Item : Byte);
   function Length (V : U8_Vector) return Natural;
   function Element (V : U8_Vector; Index : Positive) return Byte;

end Bounded_Vectors;
