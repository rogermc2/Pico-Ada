
with CYW43_Config_Port; use CYW43_Config_Port;
with CYW43; use CYW43;
with CYW43_Types; use CYW43_Types;

package body CYW43_Ctrl is

   procedure  CYW43_Init (LL : in out CYW43_LL.CYW43_LL_Record; Data : in out CYW43_Record) is
      Buff : U32_Array (1 .. 100);
   begin
   --  #if defined(CYW43_PIN_WL_HOST_WAKE)
   --   cyw43_hal_pin_config(CYW43_PIN_WL_HOST_WAKE, CYW43_HAL_PIN_MODE_INPUT, CYW43_HAL_PIN_PULL_NONE, 0);
   --   #elif defined(CYW43_PIN_WL_IRQ)
   --   cyw43_hal_pin_config(CYW43_PIN_WL_IRQ, CYW43_HAL_PIN_MODE_INPUT, CYW43_HAL_PIN_PULL_NONE, 0);
   --   #endif
    CYW43_HAL_Pin_Config (CYW43_PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);
    CYW43_HAL_Pin_Low (CYW43_PIN_WL_REG_ON);

   CYW43_LL_Init (LL, Data);
   Data.AP_Channel := 3;
   Data.Initted := True;

   end CYW43_Init;

end CYW43_Ctrl;