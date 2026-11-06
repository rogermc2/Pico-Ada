
with Ada.Text_IO; use Ada.Text_IO;

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

   --  procedure C_Puts (Message : String) is
   --      procedure C_Puts (Str : chars_ptr) with
   --     Import => True, Convention => C, External_Name => "puts";
   --     Msg : chars_ptr := New_String ("C Code: " & Message & ASCII.LF);
   --  begin
   --     --  Call the C function
   --     C_Puts (Msg);
   --     Free (Msg);

   --  end C_Puts;

   --  procedure Call_Printf_Simple (Message : String) is
   --  -- Import printf with a single string argument
   --     procedure Printf_String (Format : Interfaces.C.char_array)
   --     with Import, 
   --           Convention    => C, 
   --           External_Name => "printf";

   --  begin
   --     -- Interfaces.C.To_C converts an Ada string to a null-terminated C string
   --     Printf_String (Interfaces.C.To_C (Message & ASCII.LF));
   --  end Call_Printf_Simple;

end C_Interface;
