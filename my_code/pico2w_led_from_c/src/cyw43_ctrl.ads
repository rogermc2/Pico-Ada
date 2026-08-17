
with CYW43; use CYW43;
with CYW43_Internal; use CYW43_Internal;
with CYW43_LL; use CYW43_LL;

package CYW43_Ctrl is

   function CYW43_GPIO_Set (Self : in out CYW43_Internal_Record; 
                     GPIO : Natural; Value : Boolean) return Boolean;
   procedure  CYW43_Init (LL : in out  CYW43_Internal_Record;
             Data : CYW43_Internal_Record);

end CYW43_Ctrl;