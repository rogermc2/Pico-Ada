
with Interfaces.C; use Interfaces.C;

package C_Interface is

   --  Import the C function into Ada
   procedure C_Print_LED_Status (Status : int);
   pragma Import (C, C_Print_LED_Status, "c_print_led_status");

   --  Import the second C function
   function C_Toggle_Logic (Current_Status : int) return int;
   pragma Import (C, C_Toggle_Logic, "c_toggle_logic");
   --  Export an Ada function so C can call it
   function Ada_Get_Next_Status (Current_Status : int) return int;
   pragma Export (C, Ada_Get_Next_Status, "ada_get_next_status");

end C_Interface;
