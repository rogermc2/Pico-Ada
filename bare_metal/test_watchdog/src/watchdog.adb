
with System;

package body Watchdog is

   Reload_Value : Unsigned_32 := 0;

   -----------------------------------------------------------------------------
   -- Hardware Register Base Addresses and Offsets for RP2350
   -----------------------------------------------------------------------------

   -- Base addresses for the peripherals involved
   WATCHDOG_BASE : constant := 16#400D_8000#;
   PSM_BASE      : constant := 16#4001_8000#;
   TICKS_BASE    : constant := 16#4010_8000#;

   -- RP2350 Atomic Register Access Aliases
   -- The RP series hardware supports atomic set/clear/xor via address offsets.
   -- Based on RP2350 address map: SET = +0x2000, CLR = +0x3000
   REG_ALIAS_SET : constant := 16#2000#;
   REG_ALIAS_CLR : constant := 16#3000#;

   -- Watchdog Register Offsets
   WATCHDOG_CTRL_OFFSET : constant := 16#0000#;
   WATCHDOG_LOAD_OFFSET : constant := 16#0004#;

   -- Power State Machine (PSM) Register Offsets
   PSM_WDSEL_OFFSET     : constant := 16#0008#;

   -- Ticks Block: The RP2350 has a dedicated Tick block.
   -- The Watchdog tick generator is typically at index 5.
   -- Each generator has 3 registers: CTRL (0x00), CYCLES (0x04), COUNT (0x08).
   -- Total 12 bytes per generator.
   TICKS_WATCHDOG_BASE   : constant := TICKS_BASE + (5 * 12);
   TICKS_CTRL_OFFSET     : constant := 16#0000#;
   TICKS_CYCLES_OFFSET   : constant := 16#0004#;

   -----------------------------------------------------------------------------
   -- Bit Masks and Macros
   -----------------------------------------------------------------------------

   -- WATCHDOG_CTRL bit 30 is the ENABLE bit on RP2350
   WATCHDOG_CTRL_ENABLE_MASK : constant Unsigned_32 := 16#4000_0000#;

   -----------------------------------------------------------------------------
   -- Hardware Register Mappings
   -----------------------------------------------------------------------------

   -- Register addresses are mapped using the Address aspect and marked Volatile
   -- to prevent the compiler from optimizing away the hardware accesses.

   WATCHDOG_CTRL_CLR : Unsigned_32 with
     Address => System'To_Address (WATCHDOG_BASE + WATCHDOG_CTRL_OFFSET + REG_ALIAS_CLR),
     Volatile;

   WATCHDOG_CTRL_SET : Unsigned_32 with
     Address => System'To_Address (WATCHDOG_BASE + WATCHDOG_CTRL_OFFSET + REG_ALIAS_SET),
     Volatile;

   WATCHDOG_LOAD : Unsigned_32 with
     Address => System'To_Address (WATCHDOG_BASE + WATCHDOG_LOAD_OFFSET),
     Volatile;

   PSM_WDSEL : Unsigned_32 with
     Address => System'To_Address (PSM_BASE + PSM_WDSEL_OFFSET),
     Volatile;

   TICKS_WATCHDOG_CYCLES : Unsigned_32 with
     Address => System'To_Address (TICKS_WATCHDOG_BASE + TICKS_CYCLES_OFFSET),
     Volatile;

   TICKS_WATCHDOG_CTRL : Unsigned_32 with
     Address => System'To_Address (TICKS_WATCHDOG_BASE + TICKS_CTRL_OFFSET),
     Volatile;

     procedure Configure_Watchdog (Reload_Us : Unsigned_32) is
   begin
      -- Atomic clear of the Enable bit to disable the watchdog during config.
      WATCHDOG_CTRL_CLR := WATCHDOG_CTRL_ENABLE_MASK;

      -- Select all subsystems to be reset when the watchdog fires.
      PSM_WDSEL := 16#01FF_FFFF#;

      -- Configure the clock cycles for the watchdog tick generator.
      TICKS_WATCHDOG_CYCLES := 1;

      -- TICKS_WATCHDOG_CTRL = TICKS_WATCHDOG_CTRL_ENABLE(1);
      -- Enable the tick generator (Bit 0).
      TICKS_WATCHDOG_CTRL := 1;

      -- Mask to 24 bits (the size of the LOAD register).
      Reload_Value := Reload_Us and 16#00FF_FFFF#;

      -- Perform initial feed to set the starting value.
      Feed_The_Watchdog;

      -- Atomic set of the Enable bit to start the watchdog.
      WATCHDOG_CTRL_SET := WATCHDOG_CTRL_ENABLE_MASK;

   end Configure_Watchdog;

   procedure Feed_The_Watchdog is
   begin
      -- Load the timer value into the hardware register.
      WATCHDOG_LOAD := Reload_Value;

   end Feed_The_Watchdog;

end Watchdog;
