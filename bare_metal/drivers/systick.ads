
with System;
with Interfaces; use Interfaces;

package Systick is
   pragma Preelaborate;

   type Unsigned_24 is mod 2**24;
   type Unsigned_32 is mod 2**32;

   --  Hardware Register Structures
   --  Cortex-M33 SysTick Registers (Standard ARM)
   type SysTick_Registers is record
      CSR   : Unsigned_32 := 0; --  Control and Status Register
      RVR   : Unsigned_32 := 0; --  Reload Value Register
      CVR   : Unsigned_32 := 0; --  Current Value Register
      CALIB : Unsigned_32 := 0; --  Calibration Value Register
   end record
     with Volatile, Size => 4 * 32;

   for SysTick_Registers use record
      CSR   at 0 range 0 .. 31;
      RVR   at 4 range 0 .. 31;
      CVR   at 8 range 0 .. 31;
      CALIB at 12 range 0 .. 31;
   end record;

   --  RP2350 Ticks Register Block
   type Ticks_Registers is record
      PROC0_CTRL   : Unsigned_32 := 0;
      PROC0_CYCLES : Unsigned_32 := 0;
      PROC0_COUNT  : Unsigned_32 := 0;
      PROC1_CTRL   : Unsigned_32 := 0;
      PROC1_CYCLES : Unsigned_32 := 0;
      PROC1_COUNT  : Unsigned_32 := 0;
      --  Note: The RP2350 contains multiple tick generators
      --  (PROC0, PROC1, TIMER, WATCHDOG)
   end record
     with Volatile, Size => 6 * 32;

   for Ticks_Registers use record
      PROC0_CTRL   at 16#00# range 0 .. 31;
      PROC0_CYCLES at 16#04# range 0 .. 31;
      PROC0_COUNT  at 16#08# range 0 .. 31;
      PROC1_CTRL   at 16#0C# range 0 .. 31;
      PROC1_CYCLES at 16#10# range 0 .. 31;
      PROC1_COUNT  at 16#14# range 0 .. 31;
   end record;

   --  Hardware Constants / Register Addresses
   PPB_BASE     : constant := 16#E000_0000#;
   SYSTICK_BASE : constant := PPB_BASE + 16#E010#;
   TICKS_BASE   : constant := 16#400B_0000#;

   --  Memory Mapping
   SysTick_Regs : SysTick_Registers
     with Address => System'To_Address (SYSTICK_BASE), Import, Volatile;

   Ticks_Regs : Ticks_Registers
     with Address => System'To_Address (TICKS_BASE), Import, Volatile;

   --  Bit Masks and Macros
   M33_SYST_CSR_ENABLE_MASK    : constant Unsigned_32 := 16#0000_0001#;
   M33_SYST_CSR_TICKINT_MASK   : constant Unsigned_32 := 16#0000_0002#;
   M33_SYST_CSR_CLKSOURCE_MASK : constant Unsigned_32 := 16#0000_0004#;
   M33_SYST_CSR_COUNTFLAG_MASK : constant Unsigned_32 := 16#0001_0000#;

   TICKS_PROC0_CTRL_ENABLE_MASK : constant Unsigned_32 := 16#0000_0001#;

   --  Configuration Constants
   SYSTICK_FREQ_HZ : constant := 1000;
   EXT_CLK_FREQ_HZ : constant := 1000_000;
   SYSTICK_TOP     : constant Unsigned_32 :=
     (EXT_CLK_FREQ_HZ / SYSTICK_FREQ_HZ) - 1;

   procedure Configure_Systick;
   function System_Tick return Boolean;

end Systick;
