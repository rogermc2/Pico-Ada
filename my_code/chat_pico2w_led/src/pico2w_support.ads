
with Pico_W_Registers; use Pico_W_Registers;

package Pico2W_Support is

type GSPI_Command is record
   Write_Mode : Boolean;  -- True for Write, False for Read
   Auto_Inc   : Boolean;  -- Increment target internal memory address
   Function_N : Bits_2;   -- Function 0 (Bus Control), Function 1 (Backplane)
   Address    : Bits_17;  -- Target register address inside CYW43439
   Data_Length: Bits_11;  -- Transaction length in bytes
end record with Size => 32, Bit_Order => System.High_Order_First;

for GSPI_Command use record
   Write_Mode  at 0 range 31 .. 31;
   Auto_Inc    at 0 range 30 .. 30;
   Function_N  at 0 range 28 .. 29;
   Address     at 0 range 11 .. 27;
   Data_Length at 0 range 0 .. 10;
end record;

   procedure Initialize_Wireless_Bus;
   procedure Power_On_Infineon_Chip;
   procedure Set_Onboard_LED (State : Boolean);

end Pico2W_Support;