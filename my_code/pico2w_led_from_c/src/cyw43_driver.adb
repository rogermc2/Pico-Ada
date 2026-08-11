
with Interfaces; use Interfaces;

with CYW43_Config_Port; use CYW43_Config_Port;
with RP2350; use RP2350;

package body CYW43_Driver is

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

   procedure CYW43_Init;

   function CYW43_Driver_Init return Boolean is
      --  Initialize the CYW43 driver
      --  This function should be called before using any other functions in the CYW43 driver
      Result : Boolean := false;
   begin
      CYW43_Init;
      return Result;
      
   end CYW43_Driver_Init;

   procedure CYW43_Init is
   begin
      
    CYW43_HAL_Pin_Config (CYW43_PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);

   end CYW43_Init;

end CYW43_Driver;