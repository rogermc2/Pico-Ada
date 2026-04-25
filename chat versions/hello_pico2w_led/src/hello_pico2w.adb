with System;
with Interfaces;

procedure Hello_Pico2W is
   use Interfaces;

   LED_Pin : constant := 0;

   GPIO0_CTRL_Addr   : constant System.Address := System'To_Address (16#40014004#);
   GPIO_OE_SET_Addr  : constant System.Address := System'To_Address (16#D0000024#);
   GPIO_OUT_SET_Addr : constant System.Address := System'To_Address (16#D0000014#);
   GPIO_OUT_CLR_Addr : constant System.Address := System'To_Address (16#D0000018#);

   GPIO0_CTRL : Unsigned_32;
   pragma Volatile_Full_Access (GPIO0_CTRL);
   for GPIO0_CTRL'Address use GPIO0_CTRL_Addr;

   GPIO_OE_SET : Unsigned_32;
   pragma Volatile_Full_Access (GPIO_OE_SET);
   for GPIO_OE_SET'Address use GPIO_OE_SET_Addr;

   GPIO_OUT_SET : Unsigned_32;
   pragma Volatile_Full_Access (GPIO_OUT_SET);
   for GPIO_OUT_SET'Address use GPIO_OUT_SET_Addr;

   GPIO_OUT_CLR : Unsigned_32;
   pragma Volatile_Full_Access (GPIO_OUT_CLR);
   for GPIO_OUT_CLR'Address use GPIO_OUT_CLR_Addr;

   SIO_Function : constant Unsigned_32 := 5;
   LED_Mask     : constant Unsigned_32 := Shift_Left (Unsigned_32 (1), LED_Pin);

begin
   GPIO0_CTRL := SIO_Function;
   GPIO_OE_SET := LED_Mask;

   loop
      GPIO_OUT_SET := LED_Mask;

      for I in 1 .. 5_000_000 loop
         null;
      end loop;

      GPIO_OUT_CLR := LED_Mask;

      for I in 1 .. 5_000_000 loop
         null;
      end loop;
   end loop;
end Hello_Pico2W;
