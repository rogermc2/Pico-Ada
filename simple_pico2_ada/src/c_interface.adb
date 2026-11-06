
with Ada.Text_IO; use Ada.Text_IO;

package body C_Interface is

   function Ada_Get_Next_Status (Current_Status : int) return int is
   begin
      if Current_Status = 0 then
         return 1;
      else
         return 0;
      end if;

   end Ada_Get_Next_Status;

    procedure Print_LED_Status (Status : Integer) is
    begin
       if Status = 1 then
          Put_Line ("LED is ON");
       else
          Put_Line ("LED is OFF");
       end if;
    end Print_LED_Status;

end C_Interface;
