
with RP2350_GPIO; use RP2350_GPIO;
with Two_Blinking_LEDs; use Two_Blinking_LEDs;
procedure Blink_Two_LEDs is
   LED1 : Pin_Number := Internal_LED;
   LED2 : Pin_Number := External_LED;
begin
   Blink_LED (LED1, 0.5, 0.5);
   Blink_LED (LED2, 1.0, 1.0);

end Blink_Two_LEDs;