pragma Ada_2022;
pragma Extensions_Allowed (On);

with Interfaces.C; use Interfaces.C;

with Ada.Text_IO; use Ada.Text_IO;

with CYW43; use CYW43;
with RP2350_Timer; use RP2350_Timer;

procedure Sketch_01_1_Blink is
   Init_Status : Interfaces.C.int;
begin
   Init_Status := Arch_Init;
   if Init_Status /= 0 then
      Put_Line ("CYW43 initialization failed");
   else
      loop
         -- Turn LED On (1)
         Arch_GPIO_Put (CYW43_WL_GPIO_LED_PIN, 1);
         Delay_Microseconds (1000000);

         -- Turn LED Off (0)
         Arch_GPIO_Put (CYW43_WL_GPIO_LED_PIN, 0);
         Delay_Microseconds (1000000);
      end loop;
   end if;

end Sketch_01_1_Blink;
