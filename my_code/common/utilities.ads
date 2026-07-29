
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350_GPIO; use RP2350_GPIO;

package Utilities is
   procedure Initialize_Hardware_Clocks;
   procedure Wait (Duration : Time_Span);
   
    --  Thread-safe controller for wireless chip interactions
   protected Wireless_Bus is
      procedure Initialize;
      procedure Set_LED_State (Enabled : Boolean);

      private
      -- Local tracks to handle protocol frames
      procedure Send_SPI_Word (Data : Unsigned_32);

   end Wireless_Bus;

end Utilities;
