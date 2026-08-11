
with RP2350; use RP2350;
with CYW43_Config_Port; use CYW43_Config_Port;

package body CYW43_Ctrl is

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

   procedure CYW43_Init is
   begin     
    CYW43_HAL_Pin_Config (CYW43_PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);
    CYW43_HAL_Pin_Low (CYW43_PIN_WL_REG_ON);

   end CYW43_Init;

end CYW43_Ctrl;