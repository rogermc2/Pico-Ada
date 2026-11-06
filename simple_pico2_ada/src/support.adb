
with Ada.Text_IO; use Ada.Text_IO;

package body Support is

    procedure Print_LED_Status (Status : Integer) is
    begin
       if Status = 1 then
          Put_Line ("LED is ON");
       else
          Put_Line ("LED is OFF");
       end if;
       
    end Print_LED_Status;

end Support; 