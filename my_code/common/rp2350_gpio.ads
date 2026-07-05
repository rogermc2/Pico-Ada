
with RP2350;

package RP2350_GPIO is

   subtype Pin_Number is RP2350.UInt32;

   Pin_15 : constant Pin_Number := 16#0000_8000#;
   Pin_25 : constant Pin_Number := 16#0200_0000#;
   procedure Init_Output (Pin : Pin_Number);
   procedure Set_High (Pin : Pin_Number);
   procedure Set_Low (Pin : Pin_Number);
   procedure Toggle (Pin : Pin_Number);
   
end RP2350_GPIO;