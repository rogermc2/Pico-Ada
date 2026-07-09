
with Ada.Real_Time; use Ada.Real_Time;
with Wireless_Driver;

procedure Pico2w_LED is
   -- Establish a periodic timing loop using Ravenscar's Real_Time clock
   Next_Time   : Time := Clock;
   Period      : constant Time_Span := Milliseconds (500);
   LED_State   : Boolean := False;
begin
   -- Run hardware initialization under mutual exclusion
   Wireless_Driver.CYW43439_Bus.Initialize;

   loop
      LED_State := not LED_State;
      
      -- Dispatch the command safely to the protected SPI structure
      Wireless_Driver.CYW43439_Bus.Set_LED (LED_State);

      -- Put the processor into a low-power wait state until the next tick
      Next_Time := Next_Time + Period;
      delay until Next_Time;
   end loop;
   
end Pico2w_LED;
