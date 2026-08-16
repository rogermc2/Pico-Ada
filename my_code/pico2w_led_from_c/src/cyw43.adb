
package body CYW43 is

   CYW43_State       : CYW43_Record;
   CYW43_State_Sleep : UInt32 := 0;

   function Get_CYW43_State return CYW43_Record is
   begin
      return CYW43_State;

   end Get_CYW43_State;

   function Get_CYW43_State_Sleep return UInt32 is
   begin
      return CYW43_State_Sleep;

   end Get_CYW43_State_Sleep;

   procedure Set_CYW43_State  (State : CYW43_Record) is
   begin
      CYW43_State := State;

   end Set_CYW43_State;

   procedure Set_CYW43_State_Sleep  (Sleep : UInt32) is
   begin
      CYW43_State_Sleep := Sleep;

   end Set_CYW43_State_Sleep;
   
end CYW43;