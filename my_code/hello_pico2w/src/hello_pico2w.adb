with RP2350_GPIO; use RP2350_GPIO;
with Interfaces; use Interfaces;

procedure Hello_Pico2W is
   Dummy : Unsigned_32 := 0
     with Volatile;

   procedure Delay_Loop is
   begin
      for I in 1 .. 10_000_000 loop
         Dummy := Dummy + 1;
      end loop;
   end Delay_Loop;

begin
   RP2350_GPIO.Init_Output (Pin_15);

   loop
      RP2350_GPIO.Set_High (Pin_15);
      Delay_Loop;

      RP2350_GPIO.Set_Low (Pin_15);
      Delay_Loop;
   end loop;
 
end Hello_Pico2W;
