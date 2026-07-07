
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Real_Time.Delays;

with RP2350.Clocks; use RP2350.Clocks;
with RP2350.Ticks; use RP2350.Ticks;

with Utilities; use Utilities;

procedure Test is
   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;
   -- Define the multitasking blink construct
   task Wireless_Blink_Task;

   task body Wireless_Blink_Task is
      Blink_Interval : constant Time_Span := Milliseconds(1000);
      Next_Blink : Time := Clock;
      LED_On     : Boolean := False;
      begin
      -- Initialize the hardware bus before looping
      Wireless_Bus.Initialize;
      loop  --  Alternate states cleanly
         LED_On := not LED_On;
         Wireless_Bus.Set_LED_State (LED_On);
         --  Relinquish CPU execution control back to the Ravenscar scheduler
         Next_Blink := Next_Blink + Blink_Interval;
         delay until Next_Blink;
      end loop;

   end Wireless_Blink_Task;

begin
   --  Initialize clocks using your successful SVD initialization routine
   Initialize_Hardware_Clocks;
   loop
      delay until Clock + Days(1);
   end loop;

end Test;
