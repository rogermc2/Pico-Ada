
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with Utilities; use Utilities;
with CYW43_Arch; use CYW43_Arch;
with CYW43_Types; use CYW43_Types;

procedure Pico2w_LED is
   OK : Boolean := True;
begin
   if CYW43_Arch_Init then
      while OK loop
         OK := CYW43_Arch_GPIO_Put (CYW43_WL_GPIO_LED_PIN, True);  -- Turn LED On
         Wait (Seconds (1));

         OK := OK and CYW43_Arch_GPIO_Put (CYW43_WL_GPIO_LED_PIN, False); -- Turn LED Off
         Wait (Seconds (1));
      end loop;
   end if;
   
end Pico2w_LED;
