
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350_CYW43439; use RP2350_CYW43439;

procedure Pico2w_LED is
   Test_Val : Unsigned_32;
begin
    -- Initialize timing-critical gSPI bus lines
   Initialize_gSPI;
   Test_Val := Check_Chip_Communication; 

   loop
      Set_Onboard_LED (True);  -- Turn LED On
      Wait (Seconds (5));

      Set_Onboard_LED (False); -- Turn LED Off
      Wait (Seconds (5));
   end loop;
   
end Pico2w_LED;
