
with Ada.Numerics;

with RP2350.SIO; use RP2350.SIO;

with GPIO; use GPIO;

package body CYW43_Config_Port is

   procedure CYW43_HAL_Pin_Config (Pin : UInt32; Mode : CYW43_HAL_Pin_Mode;
                                   Pull : CYW43_HAL_Pin_Pull; Alt : UInt32) is
   begin
      case Pin is
         when CYW43_PIN_WL_REG_ON => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_REG_ON;
         when CYW43_PIN_WL_DATA   => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_DATA;
         when CYW43_PIN_WL_CS     => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_CS;
         when CYW43_PIN_WL_CLK    => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_CLK;
         when CYW43_PIN_WL_All    => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_All;
         when others =>
            raise Constraint_Error with "Invalid pin number for CYW43";
      end case;

      SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_All;
   end CYW43_HAL_Pin_Config;


   procedure CYW43_HAL_Pin_Low (Pin : UInt32) is
   begin
      case Pin is
         when CYW43_PIN_WL_REG_ON => SIO_Periph.GPIO_OUT_CLR := CYW43_PIN_WL_REG_ON;
         when CYW43_PIN_WL_DATA   => SIO_Periph.GPIO_OUT_CLR := CYW43_PIN_WL_DATA;
         when CYW43_PIN_WL_CS     => SIO_Periph.GPIO_OUT_CLR := CYW43_PIN_WL_CS;
         when CYW43_PIN_WL_CLK    => SIO_Periph.GPIO_OUT_CLR := CYW43_PIN_WL_CLK;
         when CYW43_PIN_WL_All    => SIO_Periph.GPIO_OUT_CLR := CYW43_PIN_WL_All;
         when others =>
            raise Constraint_Error with "Invalid pin number for CYW43";
      end case;
   end CYW43_HAL_Pin_Low;

   procedure CYW43_HAL_Pin_High (Pin : UInt32) is
   begin
      case Pin is
         when CYW43_PIN_WL_REG_ON => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_REG_ON;
         when CYW43_PIN_WL_DATA   => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_DATA;
         when CYW43_PIN_WL_CS     => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_CS;
         when CYW43_PIN_WL_CLK    => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_CLK;
         when CYW43_PIN_WL_All    => SIO_Periph.GPIO_OUT_SET := CYW43_PIN_WL_All;
         when others =>
            raise Constraint_Error with "Invalid pin number for CYW43";
      end case;

   end CYW43_HAL_Pin_High;

end CYW43_Config_Port;