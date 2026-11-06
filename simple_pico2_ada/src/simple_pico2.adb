
with Interfaces.C; use Interfaces.C;
with C_Interface;  use C_Interface;

with Ada.Text_IO; use Ada.Text_IO;

procedure Simple_Pico2 is
   --  Assuming standard Pico SDK values for demonstration
   --  (In a real project, you would import 'gpio_init',
   --  'gpio_set_dir', etc. from the Pico SDK)
   Current_LED_State : int := 0;
begin
   --  The runtime handles USB stack powering and initialization before main starts.
   --  However, standard USB CDC serial ports take a second to negotiate a connection 
   --  with your operating system. A delay ensures your early prints aren't cut off.
   delay 2.0;

   loop
      --  Call the C function to print status
      --  C_Print_LED_Status (Current_LED_State);
      --  Call_Printf_Simple (int'image (Current_LED_State));
      Put_Line ("Current LED State: " & int'image (Current_LED_State));
      delay 1.0; 
      --  Use C function (which calls Ada logic) to toggle the state
      Current_LED_State := C_Toggle_Logic (Current_LED_State);

      --  Delay loop or Pico SDK sleep_ms call would go here
   end loop;

end Simple_Pico2;
