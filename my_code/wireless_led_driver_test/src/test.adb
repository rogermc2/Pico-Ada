
with Ada.Real_Time; use Ada.Real_Time;

with Utilities; use Utilities;
with Wireless_LED_Task; --  CRITICAL: This pulls the task into scope at boot

procedure Test is
begin
   --  1. Initialize the RP2350 hardware clocks first
   Initialize_Hardware_Clocks;
   
   -- 2. Park the main environment loop forever. 
   -- The background Blink_Worker task handles everything else safely.
   loop
      delay until Clock + Minutes (24 * 60); -- park for 24 hours
   end loop;
end Test;
