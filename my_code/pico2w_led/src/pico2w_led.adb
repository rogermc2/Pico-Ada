
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350_CYW43439; use RP2350_CYW43439;
with cyw43439_driver; use cyw43439_driver;

procedure Pico2w_LED is
   Wake_Command : GSPI_Header;
   TX_Buffer    : U8_Array (1 .. 5);
   Test_Val     : Unsigned_32;
begin
    -- Initialize timing-critical gSPI bus lines
   Initialize_gSPI;
   
   Wake_Command := (Write_Access => True,
                    Auto_Inc     => True,
                    Func         => Function_1_Backplane,
                    Address      => 16#1000E#, -- CHIPCLKCSR register
                    Length       => 1);

   Build_SPI_Frame(Wake_Command, Payload => 16#01#, Buffer => TX_Buffer);

   -- TX_Buffer now contains: [16#D2#, 16#00#, 16#1C#, 16#01#, 16#01#]
   -- Send TX_Buffer over your SPI peripheral here!

   loop
      Set_Onboard_LED (True);  -- Turn LED On
      Wait (Seconds (5));

      Set_Onboard_LED (False); -- Turn LED Off
      Wait (Seconds (5));
   end loop;
   
end Pico2w_LED;
