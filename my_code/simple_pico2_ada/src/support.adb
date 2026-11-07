
with Ada.Text_IO; use Ada.Text_IO;

package body Support is

 function Ada_Get_Next_Status (Current_Status : integer) return integer is
   begin
      if Current_Status = 0 then
         return 1;
      else
         return 0;
      end if;

   end Ada_Get_Next_Status;

   --  function C_Toggle_Logic (Current_Status : int) return int;
   --  pragma Import (C, C_Toggle_Logic, "c_toggle_logic");

   function Toggle_Logic (Current_Status : Integer) return integer is
   begin
      --  return Integer (C_Toggle_Logic (Int (Current_Status)));
      return Ada_Get_Next_Status (Current_Status);
      
   end Toggle_Logic;
   
    procedure Print_LED_Status (Status : Integer) is
    begin
       if Status = 1 then
          Put_Line ("LED is ON");
       else
          Put_Line ("LED is OFF");
       end if;
       
    end Print_LED_Status;

end Support; 