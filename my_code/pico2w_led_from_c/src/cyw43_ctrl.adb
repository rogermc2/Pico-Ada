
with CYW43_Config_Port; use CYW43_Config_Port;
with CYW43; use CYW43;
with GPIO; use GPIO;
with CYW43_Internal;
with CYW43_Bus_PIO_SPI; use CYW43_Bus_PIO_SPI;
with CYW43_Types; use CYW43_Types;
with RP2350; use RP2350;

package body CYW43_Ctrl is

   CYW43_Int : CYW43_Internal.CYW43_Internal_Record (SPI_Buffer_Size);

   procedure  CYW43_Init
    (LL : in out CYW43_LL.CYW43_LL_Record; Data : CYW43_Record) is
      WL_HOST_WAKE : constant UInt32 := CYW43_Get_Pin_WL (PIN_INDEX_WL_HOST_WAKE);
      CYW43_State : CYW43_Record := Data;
   begin
      CYW43_HAL_Pin_Config (WL_HOST_WAKE, HAL_PIN_MODE_INPUT, HAL_PIN_PULL_NONE, 0);
      CYW43_HAL_Pin_Config 
         (PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);
      CYW43_HAL_Pin_Low (PIN_WL_REG_ON);

      CYW43_State.AP_Channel := 3;
      CYW43_State.Initted := True;
      Set_CYW43_State (CYW43_State);

      CYW43_LL_Init (CYW43_Int, LL, CYW43_State);

   end CYW43_Init;

end CYW43_Ctrl;