
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

with Led; use Led;

procedure Test_Led is

   Led_Pin : constant Natural := 15;
   Wait    : constant Positive := 10000000;
   Counter : Natural := 0 with Volatile;
begin
   Configure_Led (Led_Pin);
   loop
      Counter := 0;
      Toggle_Led (Led_Pin);
      for count in 1 .. Wait loop
         Counter := Counter + 1;
      end loop;
   end loop;

end Test_Led;
