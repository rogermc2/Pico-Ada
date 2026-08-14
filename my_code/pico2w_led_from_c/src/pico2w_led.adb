
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with Utilities; use Utilities;
with CYW43_Arch; use CYW43_Arch;

procedure Pico2w_LED is
begin
   if CYW43_Arch_Init then
      loop
         --  Set_Onboard_LED (True);  -- Turn LED On
         Wait (Seconds (5));

         --  Set_Onboard_LED (False); -- Turn LED Off
         Wait (Seconds (5));
      end loop;
   end if;
   
end Pico2w_LED;
