
with Ada.Real_Time; use Ada.Real_Time;

with RP2350_CYW43439; use RP2350_CYW43439;

procedure Pico2w_LED is
   -- Establish a periodic timing loop using Ravenscar's Real_Time clock
   Next_Time   : Time := Clock;
   Period      : constant Time_Span := Milliseconds (500);
   LED_State   : Boolean := False;
begin
    -- Initialize timing-critical gSPI bus lines
   Initialize_gSPI;

   loop
      Set_Onboard_LED (True);  -- Turn LED On
      for I in 1 .. 5_000_000 loop null; end loop; -- Rough spin delay

      Set_Onboard_LED (False); -- Turn LED Off
      for I in 1 .. 5_000_000 loop null; end loop; -- Rough spin delay
   end loop;
   
end Pico2w_LED;
