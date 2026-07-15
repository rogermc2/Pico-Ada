
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350_CYW43439; use RP2350_CYW43439;

procedure Pico2w_LED is
   LED_State   : Boolean := False;
   Test_Val    : Unsigned_32;
begin
    -- Initialize timing-critical gSPI bus lines
   Initialize_gSPI;
   Test_Val := Check_Chip_Communication; 

   loop
      Set_Onboard_LED (True);  -- Turn LED On
      Wait (Seconds (5));
      --  for I in 1 .. 5_000_000 loop null; end loop; -- Rough spin delay

      Set_Onboard_LED (False); -- Turn LED Off
      Wait (Seconds (5));
      --  for I in 1 .. 5_000_000 loop null; end loop; -- Rough spin delay
   end loop;
   
end Pico2w_LED;
