
with System;

package Wireless_Driver is

   protected CYW43439_Bus is
      pragma Interrupt_Priority (System.Interrupt_Priority'Last);

      -- Initializes the hardware pins under mutual exclusion
      procedure Initialize;
      procedure Set_LED (Enabled : Boolean);

   private
      Initialized : Boolean := False;
   end CYW43439_Bus;

end Wireless_Driver;
