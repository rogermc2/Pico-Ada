
with Interfaces; use Interfaces;

with RP2350; use RP2350;

package CYW43_Config_Port is

   type CYW43_HAL_Pin_Mode is (HAL_PIN_MODE_INPUT, HAL_PIN_MODE_OUTPUT, HAL_PIN_MODE_ALT);
   type CYW43_HAL_Pin_Pull is (HAL_PIN_PULL_NONE, HAL_PIN_PULL_UP, HAL_PIN_PULL_DOWN);

   procedure CYW43_HAL_Pin_Config (Pin : UInt32; Mode : CYW43_HAL_Pin_Mode;
                                   Pull : CYW43_HAL_Pin_Pull; Alt : UInt32);

end CYW43_Config_Port;