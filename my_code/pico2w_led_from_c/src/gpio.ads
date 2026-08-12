
with Interfaces; use Interfaces;
with RP2350; use RP2350;

package GPIO is
   
   type GPIO_Direction is (GPIO_In, GPIO_Out);
   for GPIO_Direction use (GPIO_In => 0, GPIO_Out => 1);

   type GPIO_Slew_Rate is (GPIO_Slew_Slow, GPIO_Slew_Fast);
   for GPIO_Slew_Rate use (GPIO_Slew_Slow => 0, GPIO_Slew_Fast => 1);
   
   type GPIO_Drive_Strength is (DRIVE_STRENGTH_2MA, DRIVE_STRENGTH_4MA,
                               DRIVE_STRENGTH_8MA, DRIVE_STRENGTH_12MA);
   for GPIO_Drive_Strength use
    (DRIVE_STRENGTH_2MA => 0, DRIVE_STRENGTH_4MA => 1,
     DRIVE_STRENGTH_8MA => 2, DRIVE_STRENGTH_12MA => 3);

   --  Define the pin numbers for the CYW43 chip
   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;
   CYW43_PIN_WL_DATA    : constant UInt32 := 16#0100_0000#;  --  pin 24;
   CYW43_PIN_WL_CS      : constant UInt32 := 16#0200_0000#;  --  pin 25;
   CYW43_PIN_WL_CLK     : constant UInt32 := 16#2000_0000#;  --  pin 29;
   CYW43_PIN_WL_All     : constant UInt32 := 16#2380_0000#;

   procedure Check_GPIO_Params (Pin : UInt32);
   function GPIO_Get_Function (Pin : UInt32) return UInt32;
   procedure GPIO_Set_Function (Pin : UInt32; Function_Num : UInt32);
   procedure GPIO_Set_Function_Masked_64 (Pin : UInt32; Function_Num : UInt32);
   procedure GPIO_Set_Pulls (Pin : UInt32; up, down : Boolean);
   procedure GPIO_Pull_Up (Pin : UInt32);
   procedure GPIO_Pull_Down (Pin : UInt32);
   procedure GPIO_Set_Input_Enabled (Pin : UInt32; Enabled : Boolean);
   procedure GPIO_Set_Slew_Rate (Pin : UInt32; Slew : GPIO_Slew_Rate);
   procedure GPIO_Set_Drive_Strength (Pin : UInt32; Strength : GPIO_Drive_Strength);
   
end GPIO;