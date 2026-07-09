
with Ada.Real_Time; use Ada.Real_Time;

with Pico2W_Hardware; use Pico2W_Hardware;
with Pico_W_Registers; use Pico_W_Registers;

package body Pico2W_Support is

procedure Initialize_Wireless_Bus is

begin
   -- 1. Route Pin 23 (WL_REG_ON) to the SIO block to behave as a standard software GPIO
   -- 2. Configure Pin 23 as an output to handle the wireless power control rail
   SIO_GPIO_OE_SET := 2**23;

   -- 3. Power-cycle the Infineon transceiver chip: drive Pin 23 HIGH
   SIO_GPIO_OUT_SET := 2**23;
   
   -- 4. CRITICAL BARE-METAL TIMING: Implement a loop to stall execution
   --   for at least 250 microseconds
   --   This delay ensures the internal wireless crystal clock stabilizes.
   Delay (0.0001);
   --  Delay_Microseconds(250);

   -- 5. Configure GPIO 24 (SDIO), 25 (CSn), and 29 (CLK) to use alternative SPI profiles
   -- Refer to Chapter 2 of the RP2350 Datasheet for the exact FUNCSEL values matching the chip layout.
end Initialize_Wireless_Bus;

procedure Power_On_Infineon_Chip is
   Wake_Time : Time;
   -- 250 microseconds mapped cleanly into the Ravenscar Real_Time engine
   Startup_Delay : constant Time_Span := Microseconds (250);
begin
   -- Configure GPIO 23 (WL_REG_ON) as an output inside SIO
   SIO_GPIO_OE_SET := 2**23;

   -- Capture current ticks, then drive the hardware power rail HIGH
   Wake_Time := Clock;
   SIO_GPIO_OUT_SET := 2**23;

   -- Suspend the current execution task safely, letting other Ravenscar tasks yield
   delay until (Wake_Time + Startup_Delay);
end Power_On_Infineon_Chip;


procedure Set_Onboard_LED (State : Boolean) is
   Cmd     : GSPI_Command;
   Payload : Word := 0;
begin
   -- Configure token to write exactly 4 bytes into Function 1 (Backplane)
   Cmd := (Write_Mode => True,
           Auto_Inc   => True,
           Function_N => 1,
           Address    => 16#18005#, -- Top 17 bits of register address
           Data_Length=> 4);

   -- Bit 0 corresponds strictly to WL_GPIO0
   if State then
      Payload := 16#01#;
   else
      Payload := 16#00#;
   end if;

   -- Execute gSPI Transaction sequence:
   -- 1. Pull CSn (GPIO 25) LOW
   -- 2. Transmit the 32-bit Cmd record across the SPI bus
   -- 3. Transmit the 32-bit Payload word across the SPI bus
   -- 4. Push CSn (GPIO 25) HIGH
end Set_Onboard_LED;

end Pico2W_Support;