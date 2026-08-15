
with CYW43_Config_Port; use CYW43_Config_Port;
with CYW43_LL; use CYW43_LL;

package body CYW43_Ctrl is

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

   function  CYW43_Init return Boolean is
      Data : Cyw43_Record (2048);
   begin     
    CYW43_HAL_Pin_Config (CYW43_PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);
    CYW43_HAL_Pin_Low (CYW43_PIN_WL_REG_ON);

    return CYW43_LL_Init (Data);

   end CYW43_Init;

end CYW43_Ctrl;