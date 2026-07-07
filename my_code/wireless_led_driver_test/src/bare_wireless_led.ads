
with Interfaces; use Interfaces;

with RP2350_GPIO; use RP2350_GPIO;

package Bare_Wireless_LED is

   protected Wireless_Bus is
      procedure Initialize;
      procedure Set_LED (LED_State : Boolean);
   private
      procedure Bit_Bang_Write_32 (Val : Unsigned_32);
      procedure Write_CYW43_Register
       (Function_Num : Unsigned_8; Address : Unsigned_32; Data : Unsigned_32);
   end Wireless_Bus;

end Bare_Wireless_LED;
