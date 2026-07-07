
with Interfaces; use Interfaces;

with RP2350_GPIO; use RP2350_GPIO;

package Wireless_LED_Driver is

--  Thread-safe controller for wireless chip interactions
   protected Wireless_Bus is
      procedure Initialize;
      procedure Set_LED_State (Enabled : Boolean);

      private
      -- Local tracks to handle protocol frames
      procedure Send_SPI_Word (Data : Unsigned_32);

   end Wireless_Bus;

end Wireless_LED_Driver;
