
package body CYW43_Types is

   function CYW43_Int_From_LL (LL : CYW43_LL_Ptr) return CYW43_Internal_Ptr is
   begin
      -- Guard against null pointer dereferences typical in bare-metal drivers
      if LL = null then
         return null;
      end if;

      -- Extract the exact hardware memory boundary address of LL and cast it
      return Cast_Address (LL.all'Address);
      
   end CYW43_Int_From_LL;

end CYW43_Types;