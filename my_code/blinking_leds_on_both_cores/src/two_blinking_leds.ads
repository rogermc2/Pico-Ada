
pragma Ada_2022;
pragma Extensions_Allowed (On);

with Interfaces; use Interfaces;

with RP2350_GPIO; use RP2350_GPIO;

--  with RP.GPIO;
--  with Pico;
--  Sample to make both the internal and an external LED blink at
--  different rates using both cores of th
package Two_Blinking_LEDs is
   External_LED : Pin_Number renames Pin_15;
   Internal_LED : Pin_Number renames Pin_25;

--  Task that runs on the second core of the RP2040.
--  As a single task (not a type) it is automatically activated at startup.
task Core_2 with
   CPU => 2,
   Storage_Size => 4096;
--  Blinks an LED attached to a Raspberry Pi Pico
procedure Blink_LED (LED : Pin_Number; On_Time, Off_Time : Duration);

end Two_Blinking_LEDs;
