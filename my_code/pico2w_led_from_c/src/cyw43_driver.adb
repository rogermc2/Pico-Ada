
with Interfaces; use Interfaces;

with CYW43_Config_Port; use CYW43_Config_Port;
with CYW43_Ctrl; use CYW43_Ctrl;
with RP2350; use RP2350;
With CYW43_Types; use CYW43_Types;

package body CYW43_Driver is

   --  Initialize the CYW43 driver
   --  This function should be called before using any other functions in the CYW43 driver
   function CYW43_Driver_Init return Boolean is
      Data : CYW43_Record (2048);
   begin
      
      CYW43_HAL_Pin_Config (CYW43_PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);
      CYW43_HAL_Pin_Low (CYW43_PIN_WL_REG_ON);

      CYW43_Init (Data);
      return True;

   end CYW43_Driver_Init;

end CYW43_Driver;