
with Interfaces.C; use Interfaces.C;
with C_Interface;  use C_Interface;

procedure Simple_Pico2 is
   --  Assuming standard Pico SDK values for demonstration
   --  (In a real project, you would import 'gpio_init',
   --  'gpio_set_dir', etc. from the Pico SDK)
   Current_LED_State : int := 0;
begin
   loop
      --  Call the C function to print status
      Print_LED_Status (Current_LED_State);

      --  Use C function (which calls Ada logic) to toggle the state
      Current_LED_State := C_Toggle_Logic (Current_LED_State);

      --  Delay loop or Pico SDK sleep_ms call would go here
   end loop;

end Simple_Pico2;
