pragma Ada_2022;
pragma Extensions_Allowed (On);

with RP.Device;
with RP.Clock;
with RP.GPIO;
with Pico;

procedure Sketch_01_1_Blink is
begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   Pico.LED.Configure (RP.GPIO.Output);
   RP.Device.Timer.Enable;

   loop
      Pico.LED.Set;
      RP.Device.Timer.Delay_Milliseconds (1_000);
      Pico.LED.Clear;
      RP.Device.Timer.Delay_Milliseconds (1_000);
   end loop;

end Sketch_01_1_Blink;
