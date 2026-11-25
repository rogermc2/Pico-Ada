
with Interfaces.C; use Interfaces.C;

package CYW43 is
   --  pragma Preelaborate;

   --  subtype int is Interfaces.C.int;
   
   -- On the Pico 2 W the internal LED is always index 0 on the wireless chip
   CYW43_WL_GPIO_LED_PIN : constant unsigned := 0;

   function Arch_Init return int;
   --  from pico-sdk/src/rp2_common/pico_cyw43_arch/include/pico
   pragma Import (C, Arch_Init, "cyw43_arch_init");

   procedure Arch_GPIO_Put (WL_GPIO : unsigned; Value : int);
   -- from pico-sdk/src/rp2_common/pico_cyw43_arch/include/pico
   pragma Import (C, Arch_GPIO_Put, "cyw43_arch_gpio_put");

end CYW43;
