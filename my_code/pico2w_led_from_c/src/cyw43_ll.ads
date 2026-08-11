
package CYW43_LL is

   function CYW43_LL_GPIO_Get (GPIO_N : Integer; GPIO_EN : Boolean) return Boolean;
   function CYW43_LL_GPIO_Set (GPIO_N : Integer; GPIO_EN : Boolean) return Boolean;

end CYW43_LL;