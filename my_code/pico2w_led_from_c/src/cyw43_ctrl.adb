
with Ada.Real_Time;
with CYW43_Config_Port; use CYW43_Config_Port;
with CYW43; use CYW43;
with GPIO; use GPIO;
with CYW43_Bus_PIO_SPI; use CYW43_Bus_PIO_SPI;
with CYW43_Types; use CYW43_Types;
with RP2350; use RP2350;
with Utilities;

package body CYW43_Ctrl is

   CYW43_Int : CYW43_Internal.CYW43_Internal_Record (SPI_Buffer_Size);
   --  CYW43_Poll : 

   --  function CYW43_Ensure_Up (Self : in out CYW43_Record) return Boolean is
   procedure CYW43_Ensure_Up is
      use Utilities;
      Done : Boolean := True;
   begin
      --  Done := CYW43_Poll /= null;
      --  if Done then
      --     Done := CYW43_LL_Bus_Sleep (Self, false);
      --  else
         -- Reset and power up the WL chip
         CYW43_HAL_Pin_Low (PIN_WL_REG_ON);
         Wait (Ada.Real_Time.Milliseconds (20));
         CYW43_HAL_Pin_High (PIN_WL_REG_ON);
         Wait (Ada.Real_Time.Milliseconds (50));
      --  end if;

      --  return Done;

   end CYW43_Ensure_Up;

   function CYW43_GPIO_Set (Self : in out CYW43_Internal_Record;
                   GPIO : Natural; Value : Boolean) return Boolean is
      OK : Boolean := False;
   begin
      CYW43_Ensure_Up;
      OK := CYW43_LL_GPIO_Set (Self, GPIO, Value);

      return OK;

   end CYW43_GPIO_Set;

   procedure  CYW43_Init
    (LL : in out CYW43_Internal_Record; Data : CYW43_Internal_Record) is
      WL_HOST_WAKE : constant UInt32 := CYW43_Get_Pin_WL (PIN_INDEX_WL_HOST_WAKE);
      CYW43_State : CYW43_Internal_Record := Data;
   begin
      CYW43_HAL_Pin_Config (WL_HOST_WAKE, HAL_PIN_MODE_INPUT, HAL_PIN_PULL_NONE, 0);
      CYW43_HAL_Pin_Config 
         (PIN_WL_REG_ON, HAL_PIN_MODE_OUTPUT, HAL_PIN_PULL_NONE, 0);
      CYW43_HAL_Pin_Low (PIN_WL_REG_ON);

      CYW43_State.CB_Data.AP_Channel := 3;
      CYW43_State.CB_Data.Initted := True;
      Set_CYW43_State (CYW43_State);

      CYW43_LL_Init (CYW43_Int, CYW43_State.CB_Data);

   end CYW43_Init;

end CYW43_Ctrl;