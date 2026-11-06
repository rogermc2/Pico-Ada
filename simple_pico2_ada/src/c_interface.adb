package body C_Interface is

   function Ada_Get_Next_Status (Current_Status : int) return int is
   begin
      --  Simple toggle logic written in Ada
      if Current_Status = 0 then
         return 1;
      else
         return 0;
      end if;

   end Ada_Get_Next_Status;

   procedure Call_Puts (Message : String) is
       procedure C_Puts (Str : chars_ptr) with
      Import => True, Convention => C, External_Name => "puts";
      Msg : chars_ptr := New_String ("C Code: " & Message & ASCII.LF);
   begin
      --  Call the C function
      C_Puts (Msg);
      Free (Msg);
   end Call_Puts;

   procedure Call_Printf (Message : String) is
      --  Import the C printf function (using a simplified binding for a single string)
      procedure C_Printf (Str : chars_ptr) with
      Import => True, Convention => C, External_Name => "printf";

      --  Create the C-compatible string pointer
      Msg : chars_ptr := New_String ("C Code: " & Message & ASCII.LF);
   begin
      --  Call the C function
      C_Printf (Msg);

      --  Free the allocated C string memory
      Free (Msg);
   end Call_Printf;

end C_Interface;
