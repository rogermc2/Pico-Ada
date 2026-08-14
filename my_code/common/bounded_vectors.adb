package body Bounded_Vectors is

   procedure Clear (V : out U8_Vector) is
   begin
      V.Count := 0;
   end Clear;

   procedure Append (V : in out U8_Vector; Item : Byte) is
   begin
      if V.Count < Max_Capacity then
         V.Count := V.Count + 1;
         V.Data (V.Count) := Item;
      else
         -- Safe embedded error handling: gracefully wrap around or halt
         raise Constraint_Error with "Vector Full";
      end if;
   end Append;

   function Length (V : U8_Vector) return Natural is
   begin
      return V.Count;
   end Length;

   function Element (V : U8_Vector; Index : Positive) return Byte is
   begin
      if Index <= V.Count then
         return V.Data (Index);
      else
         raise Constraint_Error with "Index Out of Bounds";
      end if;
   end Element;

end Bounded_Vectors;
