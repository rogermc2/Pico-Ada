
pragma Ada_2022;
pragma Extensions_Allowed (On);

--  with Pico.UART_IO;
with Pico;
with RP.GPIO;

--  Blink LED sample from Chapter 1.1 from the Freenove C-Tutorial Chapter 1.1
--  RP2040 light tasking version

procedure Sketch_01_2_Blink with No_Return is
   --  pragma Debug (Pico.UART_IO.Initialise);
   --  pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_01_2_Blink"));

   --  Use GP 15 for the external LED
   LED : RP.GPIO.GPIO_Point;
begin
   LED.Pin := 15;
   --  pragma Debug (Pico.UART_IO.Put_Line ("> Initialise"));

   LED.Configure (RP.GPIO.Output);

   --  pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      LED.Set;
      delay 0.5;
      LED.Clear;
      delay 0.5;
   end loop;

end Sketch_01_2_Blink;
