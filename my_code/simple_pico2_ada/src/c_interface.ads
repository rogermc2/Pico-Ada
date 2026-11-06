
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings; use Interfaces.C.Strings;

package C_Interface is

   function Toggle_Logic (Current_Status : integer) return integer;
   function Ada_Get_Next_Status (Current_Status : int) return int;
   pragma Export (C, Ada_Get_Next_Status, "ada_get_next_status");
  
end C_Interface;
