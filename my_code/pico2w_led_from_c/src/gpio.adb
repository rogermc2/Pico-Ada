
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0; use RP2350.PADS_BANK0;
with RP2350.SIO; use RP2350.SIO;


package body GPIO is

   --  PADS_BANK0_BASE : constant Unsigned_32 := 16#40038000#;

   --  IO_BANK0_GPIO0_CTRL_FUNCSEL_RESET : constant Byte := 16#1f#;
   --  IO_BANK0_GPIO0_CTRL_FUNCSEL_BITS  : constant Unsigned_32 := 16#1f#;
   --  IO_BANK0_GPIO0_CTRL_FUNCSEL_MSB   : constant Byte := 4;
   --  IO_BANK0_GPIO0_CTRL_FUNCSEL_LSB   : constant Byte := 0;

   --  IO_BANK0_GPIO0_CTRL_OFFSET : constant Unsigned_32 := 4;
   --  IO_BANK0_GPIO0_CTRL_BITS   : constant Unsigned_32 := 16#3003f01f#;
   --  IO_BANK0_GPIO0_CTRL_RESET  : constant Unsigned_32 := 16#1f#;

   --  Register    : PADS_BANK0_GPIO0
   --  Description : Pad control register
   --  PADS_BANK0_GPIO0_OFFSET : constant Unsigned_32 := 4;
   --  PADS_BANK0_GPIO0_BITS   : constant Unsigned_32 := 16#ff#;
   --  PADS_BANK0_GPIO0_RESET  : constant Unsigned_32 := 16#56#;

   --  Field       : PADS_BANK0_GPIO0_OD
   --  Description : Output disable.
   --  Has priority over output enable from peripherals.
   --  PADS_BANK0_GPIO0_OD_RESET  : constant Byte := 0;
   --  PADS_BANK0_GPIO0_OD_BITS   : constant Unsigned_32 := 16#80#;
   --  PADS_BANK0_GPIO0_OD_MSB    : constant Byte := 7;
   --  PADS_BANK0_GPIO0_OD_LSB    : constant Byte := 7;
   --  PADS_BANK0_GPIO0_OD_ACCESS : constant String := "RW";

   procedure Check_GPIO_Params (Pin : UInt32) is
   begin
      --  Check if the pin number is valid
      if Pin > 29 then
         raise Constraint_Error with "Invalid GPIO pin number";
      end if;
   end Check_GPIO_Params;

   function GPIO_Get_Function (Pin : UInt32) return UInt32 is
      use RP2350.IO_BANK0;
      Result_23 : GPIO23_CTRL_FUNCSEL_Field;
      Result_24 : GPIO24_CTRL_FUNCSEL_Field;
      Result_25 : GPIO25_CTRL_FUNCSEL_Field;
      Result_29 : GPIO29_CTRL_FUNCSEL_Field;
   begin
      case Pin is
         when 23 => Result_23 := IO_BANK0_Periph.GPIO23_CTRL.FUNCSEL;
         when 24 => Result_24 := IO_BANK0_Periph.GPIO24_CTRL.FUNCSEL;
         when 25 => Result_25 := IO_BANK0_Periph.GPIO25_CTRL.FUNCSEL;
         when 29 => Result_29 := IO_BANK0_Periph.GPIO29_CTRL.FUNCSEL;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;

      return 0;
       
   end GPIO_Get_Function;

   procedure GPIO_Set_Function (Pin : UInt32; Function_Num : UInt32) is
      use RP2350.IO_BANK0;
   begin
      GPIO_Set_Input_Enabled (Pin, True);

      --  case Pin is
      --     when 23 => IO_BANK0_Periph.GPIO23_CTRL.FUNCSEL := GPIO23_CTRL_FUNCSEL_Field (Function_Num);
      --     when 24 => IO_BANK0_Periph.GPIO24_CTRL.FUNCSEL := GPIO24_CTRL_FUNCSEL_Field (Function_Num);
      --     when 25 => IO_BANK0_Periph.GPIO25_CTRL.FUNCSEL := GPIO25_CTRL_FUNCSEL_Field (Function_Num);
      --     when 29 => IO_BANK0_Periph.GPIO29_CTRL.FUNCSEL := GPIO29_CTRL_FUNCSEL_Field (Function_Num);
      --     when others =>
      --        raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      --  end case;
       
   end GPIO_Set_Function;

   procedure GPIO_Set_Function_Masked_64 (Pin : UInt32; Function_Num : UInt32) is
   begin
       null; 
       
   end GPIO_Set_Function_Masked_64;

   procedure GPIO_Set_Pulls (Pin : UInt32; Up, Down : Boolean) is
      Enable_Down : constant GPIO_PDE_Field := (if Down then 1 else 0);
      Enable_Up   : constant GPIO_PUE_Field := (if Up then 1 else 0);
   begin
      case Pin is
         when 23 => PADS_BANK0_Periph.GPIO23.PDE := Enable_Down;
                    PADS_BANK0_Periph.GPIO23.PUE := Enable_Up;
         when 24 => PADS_BANK0_Periph.GPIO24.PDE := Enable_Down;
                    PADS_BANK0_Periph.GPIO24.PUE := Enable_Up;
         when 25 => PADS_BANK0_Periph.GPIO25.PDE := Enable_Down;
                    PADS_BANK0_Periph.GPIO25.PUE := Enable_Up;
         when 29 => PADS_BANK0_Periph.GPIO29.PDE := Enable_Down;
                    PADS_BANK0_Periph.GPIO29.PUE := Enable_Up;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;
       
   end GPIO_Set_Pulls;

   procedure GPIO_Pull_Down (Pin : UInt32) is
   begin
      case Pin is
         when 23 => PADS_BANK0_Periph.GPIO23.PDE := 1;
         when 24 => PADS_BANK0_Periph.GPIO24.PDE := 1;
         when 25 => PADS_BANK0_Periph.GPIO25.PDE := 1;
         when 29 => PADS_BANK0_Periph.GPIO29.PDE := 1;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;
        
   end GPIO_Pull_Down;


   procedure GPIO_Pull_Up (Pin : UInt32) is
   begin
      case Pin is
         when 23 => PADS_BANK0_Periph.GPIO23.PUE := 1;
         when 24 => PADS_BANK0_Periph.GPIO24.PUE := 1;
         when 25 => PADS_BANK0_Periph.GPIO25.PUE := 1;
         when 29 => PADS_BANK0_Periph.GPIO29.PUE := 1;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;
       
   end GPIO_Pull_Up;

   procedure GPIO_Set_Input_Enabled (Pin : UInt32; Enabled : Boolean) is
   Enable : constant GPIO_IE_Field := (if Enabled then 1 else 0);
   begin
      case Pin is
         when 23 => PADS_BANK0_Periph.GPIO23.IE := Enable;
         when 24 => PADS_BANK0_Periph.GPIO24.IE := Enable;
         when 25 => PADS_BANK0_Periph.GPIO25.IE := Enable;
         when 29 => PADS_BANK0_Periph.GPIO29.IE := Enable;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;

   end GPIO_Set_Input_Enabled;

   procedure GPIO_Set_Slew_Rate (Pin : UInt32; Slew : GPIO_Slew_Rate) is
      Slew_Rate : GPIO_SLEWFAST_Field :=
         (if Slew = GPIO_Slew_Slow then 0 else 1);
   begin
      null;
      case Pin is
         when 23 => PADS_BANK0_Periph.GPIO23.SLEWFAST := Slew_Rate;
         when 24 => PADS_BANK0_Periph.GPIO24.SLEWFAST := Slew_Rate;
         when 25 => PADS_BANK0_Periph.GPIO25.SLEWFAST := Slew_Rate;
         when 29 => PADS_BANK0_Periph.GPIO29.SLEWFAST := Slew_Rate;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;
      
   end GPIO_Set_Slew_Rate;

   procedure GPIO_Set_Drive_Strength (Pin : UInt32; Strength : GPIO_Drive_Strength) is
      Drive_Strength : GPIO0_Drive_Field;
   begin
      case Strength is
         when DRIVE_STRENGTH_2MA => Drive_Strength := Val_2mA;
         when DRIVE_STRENGTH_4MA => Drive_Strength := Val_4mA;
         when DRIVE_STRENGTH_8MA => Drive_Strength := Val_8mA;
         when DRIVE_STRENGTH_12MA => Drive_Strength := Val_12mA;
      end case;

      case Pin is
         when 23 => PADS_BANK0_Periph.GPIO23.DRIVE :=  Drive_Strength;
         when 24 => PADS_BANK0_Periph.GPIO24.DRIVE := Drive_Strength;
         when 25 => PADS_BANK0_Periph.GPIO25.DRIVE := Drive_Strength;
         when 29 => PADS_BANK0_Periph.GPIO29.DRIVE := Drive_Strength;
         when others =>
            raise Constraint_Error with "Invalid GPIO pin number for pull-down";
      end case;

   end GPIO_Set_Drive_Strength;

end GPIO;