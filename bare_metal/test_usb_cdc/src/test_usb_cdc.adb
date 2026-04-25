
--  Based on https://github.com/dougsummerville/Bare-Metal-Raspberry-Pi-Pico-2
--  A bare metal C programming environment for the Raspberry Pi Pico 2
--  with minimal dependences.
--  Accessing Hardware Registers
--  Each peripheral (e.g. UART) and CPU subsystem (e.g. PLL) has an include file
--  (e.g. rp2350 / pll.h) that can be included to use the register definitions
--  and field macros.
--  There are two register naming conventions defined.
--  Either or both can be used simultaneously.
--  1: The register block for a peripheral is overlayed with a struct having
--  the same name as the peripheral (from the datasheet).
--  To access a register use peripheral.register notation.
--  For example the RP2350 datasheet shows pll_sys has a cs register;
--  this would be accessed using pll_sys.cs.
--  To use the atomic versions of the registers add the suffix _set, _clr,
--  or _xor to the register name (e.g. pll_sys.cs_clr).
--  The included example LED driver should make this evident.
--  2: A preprocessor macro is created for each peripheral/register.
--  Following the example above the corresponding registers are:
--  PLL_SYS_CS and PLL_SYS_CS_CLR.

with System.Machine_Code; use System.Machine_Code;
with Interfaces.C;
with Ada.Text_IO; use Ada.Text_IO;

with RP2350_USB; use RP2350_USB;
with Support; use Support;
with Usb_Cdc; use Usb_Cdc;

procedure Test_Usb_Cdc is
   C             : Character;
   Prompt        : constant String := "Program will echo back each typed key" &
     ASCII.LF & ASCII.LF & ASCII.CR;
   Prompt_Result : Integer;
begin
   --  Give time to attach GDB before anything dangerous happens.
   for I in 1 .. 10_000_000 loop
      null;
   end loop;
   
   -- Disable interrupts on ARM Cortex-M processors.
   Asm ("cpsid i", Volatile => True);

   Configure_Usbcdc;
   
   -- Enable interrupts on ARM Cortex-M processors.
   Asm ("cpsie i", Volatile => True);

   while Usbcdc_Getchar (C) = 0 loop
      null;
   end loop;

   -- for( char *p=prompt; *p != 0; p++ )
   -- Ada's range-based loop is the safe equivalent for iterating over a string.
   for I in Prompt'Range loop
      Prompt_Result := Usbcdc_Putchar (Prompt (I));
   end loop;

   loop
      if Usbcdc_Getchar (C) /= 0 then
         Prompt_Result := Usbcdc_Putchar (C);
      end if;
   end loop;

end Test_Usb_Cdc;

