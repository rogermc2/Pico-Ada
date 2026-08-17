
with CYW43_Internal;
with Interfaces; use Interfaces;

with CYW43;
with CYW43_Ctrl;
with CYW43_Internal;
with CYW43_Types; use CYW43_Types;

package body CYW43_Driver is

   CWY43_Async_Context : Async_Context_Kind := ASYNC_CONTEXT_Null;
   LL  : CYW43_Internal.CYW43_Internal_Record (SPI_Buffer_Size);
   --  LL  : CYW43_LL.CYW43_LL_Record (SPI_Buffer_Size);

   --  CYW43_Driver_Init should be called before using any other
   function CYW43_Driver_Init
       (Context : Async_Context_Kind := ASYNC_CONTEXT_Null) return Boolean is
       State : CYW43_Internal.CYW43_Internal_Record (SPI_Buffer_Size);
   begin
      CYW43_Internal.Get_CYW43_State (State);
      CYW43_Ctrl.CYW43_Init (LL, State);
      CWY43_Async_Context := Context;

      return True;

   end CYW43_Driver_Init;

end CYW43_Driver;