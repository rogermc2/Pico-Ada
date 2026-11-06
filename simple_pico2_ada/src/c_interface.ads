
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package C_Interface is

   --  Import  C functions into Ada
   procedure C_Print_LED_Status (Status : int);
   pragma Import (C, C_Print_LED_Status, "c_print_led_status");
   function C_Toggle_Logic (Current_Status : int) return int;
   pragma Import (C, C_Toggle_Logic, "c_toggle_logic");
   function Ada_Get_Next_Status (Current_Status : int) return int;
   pragma Export (C, Ada_Get_Next_Status, "ada_get_next_status");
   procedure Call_Printf (Message : String);
   procedure Call_Puts (Message : String);
   --  procedure C_Puts (Str : chars_ptr);
   --  pragma Import (C, C_Puts, "puts");

end C_Interface;
