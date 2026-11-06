
with Interfaces.C; use Interfaces.C;

with Ada.Text_IO; use Ada.Text_IO;

with C_Interface;  use C_Interface;
with Support;      use Support;

procedure Simple_Pico2 is
   --  Assuming standard Pico SDK values for demonstration
   --  (In a real project, you would import 'gpio_init',
   --  'gpio_set_dir', etc. from the Pico SDK)
   Current_LED_State : Integer := 0;
begin
   --  The runtime handles USB stack powering and initialization before main starts.
   --  However, standard USB CDC serial ports take a second to negotiate a connection 
   --  with your operating system. A delay ensures your early prints aren't cut off.
   delay 2.0;

   loop
      Current_LED_State := Toggle_Logic (Current_LED_State);
      Print_LED_Status (Current_LED_State);
      delay 1.0; 
      Current_LED_State := Toggle_Logic (Current_LED_State);
      Print_LED_Status (Current_LED_State);
      delay 1.0;
   end loop;

end Simple_Pico2;
