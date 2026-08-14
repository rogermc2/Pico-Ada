with System;

package Bounded_Vectors is

   Max_Capacity : constant := 100; -- Set this to your maximum required size
   
   type Byte_Array is array (1 .. Max_Capacity) of Byte;

   type Vector is record
      Data  : Byte_Array := (others => 0);
      Count : Natural    := 0;
   end record;

   -- Core operations
   procedure Clear (V : out Vector);
   procedure Append (V : in out Vector; Item : Byte);
   function Length (V : Vector) return Natural;
   function Element (V : Vector; Index : Positive) return Byte;

end Bounded_Vectors;
