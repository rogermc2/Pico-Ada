
with RP2350_GPIO; use RP2350_GPIO;

with Two_Blinking_LEDs; use Two_Blinking_LEDs;

procedure Blink_Two_LEDs is
begin
   Blink_LED (External_LED, 1.0, 1.0);

end Blink_Two_LEDs;