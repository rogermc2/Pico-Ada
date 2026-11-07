
with Interfaces.C; use Interfaces.C;

with Ada.Text_IO; use Ada.Text_IO;

with RP.GPIO;

with Support; use Support;

procedure Pico2_Blink is
   --  Assuming standard Pico SDK values for demonstration
   --  (In a real project, you would import 'gpio_init',
   --  'gpio_set_dir', etc. from the Pico SDK)
   --  Use GP 15 for the external LED
   LED               : RP.GPIO.GPIO_Point;
   --  Current_LED_State : Integer := 0;
begin
   --  The runtime handles USB stack powering and initialization before main starts.
   --  However, standard USB CDC serial ports take a second to negotiate a connection 
   --  with your operating system. A delay ensures your early prints aren't cut off.
   delay 2.0;
   LED.Pin := 15;
   LED.Configure (RP.GPIO.Output);

   loop
      LED.Set;
      delay 0.5; 
      LED.Clear;
      delay 0.5;
   end loop;

end Pico2_Blink;
