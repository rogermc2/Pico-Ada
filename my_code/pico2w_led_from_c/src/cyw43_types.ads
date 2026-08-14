
with RP2350; use RP2350;

package CYW43_Types is

   type U8_Array is array (Positive range <>) of Byte;
   type U32_Array is array (Positive range <>) of UInt32;

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

end CYW43_Types;