
with Ada.Real_Time;  use Ada.Real_Time;

with RP2350_GPIO; use RP2350_GPIO;
with Bare_Wireless_LED; use Bare_Wireless_LED;

package body Wireless_LED_Task is

   task body Blink_Worker is
      Blink_Interval : constant Time_Span := Milliseconds(500);
      Next_Blink     : Time := Clock;
      Toggle_State   : Boolean := False;
   begin
      -- Bring up the physical pins and wake the hardware
      Wireless_Bus.Initialize;

      loop
         Toggle_State := not Toggle_State;
         
         -- Flash the onboard LED purely via registers
         Wireless_Bus.Set_LED (Toggle_State);

         -- Let Ravenscar manage timing while the board sleeps
         Next_Blink := Next_Blink + Blink_Interval;
         delay until Next_Blink;
      end loop;
      
   end Blink_Worker;

end Wireless_LED_Task;
