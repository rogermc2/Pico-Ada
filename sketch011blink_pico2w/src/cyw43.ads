
with Interfaces.C;

package CYW43 is
   --  pragma Preelaborate;

   -- Bring in standard C integer types for matching argument sizes
   subtype int is Interfaces.C.int;
   
   -- On the Pico 2 W / Pico W, the internal LED is always index 0 on the wireless chip
   CYW43_WL_GPIO_LED_PIN : constant Interfaces.C.unsigned := 0;

   -- Binds to int cyw43_arch_init(void)
   function Arch_Init return int;
   pragma Import (C, Arch_Init, "cyw43_arch_init");

   -- Binds to void cyw43_arch_gpio_put(unsigned wl_gpio, bool value)
   procedure Arch_GPIO_Put (WL_GPIO : Interfaces.C.unsigned; Value : Interfaces.C.int);
   pragma Import (C, Arch_GPIO_Put, "cyw43_arch_gpio_put");

end CYW43;
