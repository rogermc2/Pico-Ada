
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package C_Interface is

   procedure Print_LED_Status (Status : Integer);
   function C_Toggle_Logic (Current_Status : int) return int;
   pragma Import (C, C_Toggle_Logic, "c_toggle_logic");
   function Ada_Get_Next_Status (Current_Status : int) return int;
   pragma Export (C, Ada_Get_Next_Status, "ada_get_next_status");
  
end C_Interface;
