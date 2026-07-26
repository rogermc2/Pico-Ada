
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350_CYW43439; use RP2350_CYW43439;

procedure CYW43439_Setup is
   Test_Val : Unsigned_32;
begin
   Initialize_gSPI;
   Test_Val := Check_Chip_Communication; 

   loop
      null;
   end loop;
   
end CYW43439_Setup;
