
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with Pico2W_Hardware; use Pico2W_Hardware;
with Pico_W_Registers; use Pico_W_Registers;
  with RP2350.SIO; use RP2350.SIO;
with SVD_Support; use SVD_Support;

package body Pico2W_Support is

--  CYW43439 Hardware Mapping Details
--  GPIO 23 (WL_REG_ON): Wireless power supply reset pin.
--  GPIO 24 (WL_DATA): Bidirectional SPI data line.
--  GPIO 25 (WL_CS): Chip Select line.
--  GPIO 29 (WL_CLK): SPI clock line.

procedure Initialize_Wireless_Bus is

begin
   Configure_SIO_With_SVD;

end Initialize_Wireless_Bus;

procedure Power_On_Infineon_Chip is
   Wake_Time : Time;
   -- 250 microseconds mapped cleanly into the Ravenscar Real_Time engine
   Startup_Delay : constant Time_Span := Microseconds (250);
begin
   -- Configure GPIO 23 (WL_REG_ON) as an output inside SIO
   SIO_Periph.GPIO_OE_SET := REG_ON_MASK;

   -- Capture current ticks, then drive the hardware power rail HIGH
   Wake_Time := Clock;
   SIO_Periph.GPIO_OUT_SET := REG_ON_MASK;

   -- Suspend the current execution task safely, letting other Ravenscar tasks yield
   delay until (Wake_Time + Startup_Delay);
end Power_On_Infineon_Chip;


procedure Set_Onboard_LED (State : Boolean) is
   Cmd     : GSPI_Command;
   Payload : Word := 0;
begin
   -- Configure token to write exactly 4 bytes into Function 1 (Backplane)
   Cmd := (Write_Mode  => True,  Auto_Inc   => True, Function_N => 1,
           Address     => 16#18005#, -- Top 17 bits of register address
           Data_Length => 4);

   -- Bit 0 corresponds to WL_GPIO0
   if State then
      Payload := 16#01#;
   else
      Payload := 16#00#;
   end if;

   -- Execute gSPI Transaction sequence:
   -- 1. Pull CSn (GPIO 25) LOW
   SIO_Periph.GPIO_OUT_CLR := CS_MASK;
   -- 2. Transmit the 32-bit Cmd record across the SPI bus
   -- 3. Transmit the 32-bit Payload word across the SPI bus
   -- 4. Push CSn (GPIO 25) HIGH
   SIO_Periph.GPIO_OUT_SET := CS_MASK;
   
end Set_Onboard_LED;

end Pico2W_Support;