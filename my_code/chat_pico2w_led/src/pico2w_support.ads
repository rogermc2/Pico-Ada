
with System;

with Pico_W_Registers; use Pico_W_Registers;

package Pico2W_Support is

type GSPI_Command is record
   -- CYW43439 command fields mapping low to high bit-spaces
   Write_Mode   : Boolean;                    --  Bit 31: 0 = Read, 1 = Write (Sent First)
   Increment    : Boolean;                    --  Bit 30: Fixed address or auto-incrementing
   Function_Num : Natural range 0 .. 3;       --  Bits 29..28: Target internal function block
   Address      : Natural range 0 .. 131071;  -- Bits 27..11: 17-bit register address
   Data_Length  : Natural range 0 .. 2047;    -- Bits 10..0: Size of payload in bytes (Sent Last)
end record;

-- 1. FORCE THE NATIVE LITTLE-ENDIAN BIT ORDER
for GSPI_Command'Bit_Order use System.Low_Order_First;

-- 2. RE-MAP THE BIT RANGES FROM 0 TO 31 (No cross-byte warnings)
for GSPI_Command use record
   Write_Mode   at 0 range  0 ..  0; -- Explicitly assigned to bit 0
   Increment    at 0 range  1 ..  1;
   Function_Num at 0 range  2 ..  3;
   Address      at 0 range  4 .. 20;
   Data_Length  at 0 range 21 .. 31;
end record;

for GSPI_Command'Size use 32;

   procedure Initialize_Wireless_Bus;
   --  procedure Power_On_Infineon_Chip;
   --  procedure Set_Onboard_LED (State : Boolean);

end Pico2W_Support;