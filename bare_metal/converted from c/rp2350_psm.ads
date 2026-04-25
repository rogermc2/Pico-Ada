-- Copyright (c) 2024-2025 Douglas H. Summerville (dsummer@binghamton.edu) 
--
-- Created from scraped data which is Copyright (c) 2024 Raspberry Pi
-- (Trading) Ltd.
--
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included
-- in all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.

with Interfaces; use Interfaces;
with System;
pragma Preelaborate;

package RP2350_PSM is

   ALL1 : constant Unsigned_32 := 16#FFFFFFFF#;

   type Reserved_Array is array (0 .. 1019) of Unsigned_32;

   type PSM_REG_BLOCKS is record
      frce_on      : Unsigned_32 := 0;
      frce_off     : Unsigned_32 := 0;
      wdsel        : Unsigned_32 := 0;
      done         : Unsigned_32 := 0;
      RSVD0        : Reserved_Array;
      frce_on_xor  : Unsigned_32 := 0;
      frce_off_xor : Unsigned_32 := 0;
      wdsel_xor    : Unsigned_32 := 0;
      done_xor     : Unsigned_32 := 0;
      RSVDxor_0    : Reserved_Array;
      frce_on_set  : Unsigned_32 := 0;
      frce_off_set : Unsigned_32 := 0;
      wdsel_set    : Unsigned_32 := 0;
      done_set     : Unsigned_32 := 0;
      RSVDset_0    : Reserved_Array;
      frce_on_clr  : Unsigned_32 := 0;
      frce_off_clr : Unsigned_32 := 0;
      wdsel_clr    : Unsigned_32 := 0;
      done_clr     : Unsigned_32 := 0;
      RSVDclr_0    : Reserved_Array;
   end record
     with Volatile;

   for PSM_REG_BLOCKS use record
      frce_on      at 16#0000# range 0 .. 31;
      frce_off     at 16#0004# range 0 .. 31;
      wdsel        at 16#0008# range 0 .. 31;
      done         at 16#000C# range 0 .. 31;
      RSVD0        at 16#0010# range 0 .. 32639; -- 1020 * 32 bits
      frce_on_xor  at 16#1000# range 0 .. 31;
      frce_off_xor at 16#1004# range 0 .. 31;
      wdsel_xor    at 16#1008# range 0 .. 31;
      done_xor     at 16#100C# range 0 .. 31;
      RSVDxor_0    at 16#1010# range 0 .. 32639;
      frce_on_set  at 16#2000# range 0 .. 31;
      frce_off_set at 16#2004# range 0 .. 31;
      wdsel_set    at 16#2008# range 0 .. 31;
      done_set     at 16#200C# range 0 .. 31;
      RSVDset_0    at 16#2010# range 0 .. 32639;
      frce_on_clr  at 16#3000# range 0 .. 31;
      frce_off_clr at 16#3004# range 0 .. 31;
      wdsel_clr    at 16#3008# range 0 .. 31;
      done_clr     at 16#300C# range 0 .. 31;
      RSVDclr_0    at 16#3010# range 0 .. 32639;
   end record;

   -- IO Registers as struct
   psm : PSM_REG_BLOCKS
     with Import, Address => System'To_Address(16#40018000#), Volatile;

   -- IO Registers AS MACROS (Represented as external variables in Ada)
   PSM_FRCE_ON     : Unsigned_32 with Import, Address => System'To_Address(16#40018000#), Volatile;
   PSM_FRCE_OFF    : Unsigned_32 with Import, Address => System'To_Address(16#40018004#), Volatile;
   PSM_WDSEL       : Unsigned_32 with Import, Address => System'To_Address(16#40018008#), Volatile;
   PSM_DONE        : Unsigned_32 with Import, Address => System'To_Address(16#4001800c#), Volatile;
   PSM_FRCE_ON_XOR  : Unsigned_32 with Import, Address => System'To_Address(16#40019000#), Volatile;
   PSM_FRCE_OFF_XOR : Unsigned_32 with Import, Address => System'To_Address(16#40019004#), Volatile;
   PSM_WDSEL_XOR    : Unsigned_32 with Import, Address => System'To_Address(16#40019008#), Volatile;
   PSM_DONE_XOR     : Unsigned_32 with Import, Address => System'To_Address(16#4001900c#), Volatile;
   PSM_FRCE_ON_SET  : Unsigned_32 with Import, Address => System'To_Address(16#4001a000#), Volatile;
   PSM_FRCE_OFF_SET : Unsigned_32 with Import, Address => System'To_Address(16#4001a004#), Volatile;
   PSM_WDSEL_SET    : Unsigned_32 with Import, Address => System'To_Address(16#4001a008#), Volatile;
   PSM_DONE_SET     : Unsigned_32 with Import, Address => System'To_Address(16#4001a00c#), Volatile;
   PSM_FRCE_ON_CLR  : Unsigned_32 with Import, Address => System'To_Address(16#4001b000#), Volatile;
   PSM_FRCE_OFF_CLR : Unsigned_32 with Import, Address => System'To_Address(16#4001b004#), Volatile;
   PSM_WDSEL_CLR    : Unsigned_32 with Import, Address => System'To_Address(16#4001b008#), Volatile;
   PSM_DONE_CLR     : Unsigned_32 with Import, Address => System'To_Address(16#4001b00c#), Volatile;

   -- FRCE_ON Register macros
   function PSM_FRCE_ON_PROC1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 24));
   PSM_FRCE_ON_PROC1_MASK : constant Unsigned_32 := PSM_FRCE_ON_PROC1(ALL1);
   function PSM_FRCE_ON_PROC0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 23));
   PSM_FRCE_ON_PROC0_MASK : constant Unsigned_32 := PSM_FRCE_ON_PROC0(ALL1);
   function PSM_FRCE_ON_ACCESSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 22));
   PSM_FRCE_ON_ACCESSCTRL_MASK : constant Unsigned_32 := PSM_FRCE_ON_ACCESSCTRL(ALL1);
   function PSM_FRCE_ON_SIO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 21));
   PSM_FRCE_ON_SIO_MASK : constant Unsigned_32 := PSM_FRCE_ON_SIO(ALL1);
   function PSM_FRCE_ON_XIP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 20));
   PSM_FRCE_ON_XIP_MASK : constant Unsigned_32 := PSM_FRCE_ON_XIP(ALL1);
   function PSM_FRCE_ON_SRAM9(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 19));
   PSM_FRCE_ON_SRAM9_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM9(ALL1);
   function PSM_FRCE_ON_SRAM8(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 18));
   PSM_FRCE_ON_SRAM8_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM8(ALL1);
   function PSM_FRCE_ON_SRAM7(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 17));
   PSM_FRCE_ON_SRAM7_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM7(ALL1);
   function PSM_FRCE_ON_SRAM6(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 16));
   PSM_FRCE_ON_SRAM6_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM6(ALL1);
   function PSM_FRCE_ON_SRAM5(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 15));
   PSM_FRCE_ON_SRAM5_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM5(ALL1);
   function PSM_FRCE_ON_SRAM4(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 14));
   PSM_FRCE_ON_SRAM4_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM4(ALL1);
   function PSM_FRCE_ON_SRAM3(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 13));
   PSM_FRCE_ON_SRAM3_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM3(ALL1);
   function PSM_FRCE_ON_SRAM2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 12));
   PSM_FRCE_ON_SRAM2_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM2(ALL1);
   function PSM_FRCE_ON_SRAM1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 11));
   PSM_FRCE_ON_SRAM1_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM1(ALL1);
   function PSM_FRCE_ON_SRAM0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 10));
   PSM_FRCE_ON_SRAM0_MASK : constant Unsigned_32 := PSM_FRCE_ON_SRAM0(ALL1);
   function PSM_FRCE_ON_BOOTRAM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 9));
   PSM_FRCE_ON_BOOTRAM_MASK : constant Unsigned_32 := PSM_FRCE_ON_BOOTRAM(ALL1);
   function PSM_FRCE_ON_ROM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 8));
   PSM_FRCE_ON_ROM_MASK : constant Unsigned_32 := PSM_FRCE_ON_ROM(ALL1);
   function PSM_FRCE_ON_BUSFABRIC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 7));
   PSM_FRCE_ON_BUSFABRIC_MASK : constant Unsigned_32 := PSM_FRCE_ON_BUSFABRIC(ALL1);
   function PSM_FRCE_ON_PSM_READY(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 6));
   PSM_FRCE_ON_PSM_READY_MASK : constant Unsigned_32 := PSM_FRCE_ON_PSM_READY(ALL1);
   function PSM_FRCE_ON_CLOCKS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 5));
   PSM_FRCE_ON_CLOCKS_MASK : constant Unsigned_32 := PSM_FRCE_ON_CLOCKS(ALL1);
   function PSM_FRCE_ON_RESETS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 4));
   PSM_FRCE_ON_RESETS_MASK : constant Unsigned_32 := PSM_FRCE_ON_RESETS(ALL1);
   function PSM_FRCE_ON_XOSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 3));
   PSM_FRCE_ON_XOSC_MASK : constant Unsigned_32 := PSM_FRCE_ON_XOSC(ALL1);
   function PSM_FRCE_ON_ROSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 2));
   PSM_FRCE_ON_ROSC_MASK : constant Unsigned_32 := PSM_FRCE_ON_ROSC(ALL1);
   function PSM_FRCE_ON_OTP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 1));
   PSM_FRCE_ON_OTP_MASK : constant Unsigned_32 := PSM_FRCE_ON_OTP(ALL1);
   function PSM_FRCE_ON_PROC_COLD(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 0));
   PSM_FRCE_ON_PROC_COLD_MASK : constant Unsigned_32 := PSM_FRCE_ON_PROC_COLD(ALL1);

   -- FRCE_OFF Register macros
   function PSM_FRCE_OFF_PROC1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 24));
   PSM_FRCE_OFF_PROC1_MASK : constant Unsigned_32 := PSM_FRCE_OFF_PROC1(ALL1);
   function PSM_FRCE_OFF_PROC0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 23));
   PSM_FRCE_OFF_PROC0_MASK : constant Unsigned_32 := PSM_FRCE_OFF_PROC0(ALL1);
   function PSM_FRCE_OFF_ACCESSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 22));
   PSM_FRCE_OFF_ACCESSCTRL_MASK : constant Unsigned_32 := PSM_FRCE_OFF_ACCESSCTRL(ALL1);
   function PSM_FRCE_OFF_SIO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 21));
   PSM_FRCE_OFF_SIO_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SIO(ALL1);
   function PSM_FRCE_OFF_XIP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 20));
   PSM_FRCE_OFF_XIP_MASK : constant Unsigned_32 := PSM_FRCE_OFF_XIP(ALL1);
   function PSM_FRCE_OFF_SRAM9(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 19));
   PSM_FRCE_OFF_SRAM9_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM9(ALL1);
   function PSM_FRCE_OFF_SRAM8(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 18));
   PSM_FRCE_OFF_SRAM8_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM8(ALL1);
   function PSM_FRCE_OFF_SRAM7(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 17));
   PSM_FRCE_OFF_SRAM7_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM7(ALL1);
   function PSM_FRCE_OFF_SRAM6(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 16));
   PSM_FRCE_OFF_SRAM6_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM6(ALL1);
   function PSM_FRCE_OFF_SRAM5(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 15));
   PSM_FRCE_OFF_SRAM5_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM5(ALL1);
   function PSM_FRCE_OFF_SRAM4(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 14));
   PSM_FRCE_OFF_SRAM4_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM4(ALL1);
   function PSM_FRCE_OFF_SRAM3(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 13));
   PSM_FRCE_OFF_SRAM3_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM3(ALL1);
   function PSM_FRCE_OFF_SRAM2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 12));
   PSM_FRCE_OFF_SRAM2_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM2(ALL1);
   function PSM_FRCE_OFF_SRAM1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 11));
   PSM_FRCE_OFF_SRAM1_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM1(ALL1);
   function PSM_FRCE_OFF_SRAM0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 10));
   PSM_FRCE_OFF_SRAM0_MASK : constant Unsigned_32 := PSM_FRCE_OFF_SRAM0(ALL1);
   function PSM_FRCE_OFF_BOOTRAM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 9));
   PSM_FRCE_OFF_BOOTRAM_MASK : constant Unsigned_32 := PSM_FRCE_OFF_BOOTRAM(ALL1);
   function PSM_FRCE_OFF_ROM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 8));
   PSM_FRCE_OFF_ROM_MASK : constant Unsigned_32 := PSM_FRCE_OFF_ROM(ALL1);
   function PSM_FRCE_OFF_BUSFABRIC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 7));
   PSM_FRCE_OFF_BUSFABRIC_MASK : constant Unsigned_32 := PSM_FRCE_OFF_BUSFABRIC(ALL1);
   function PSM_FRCE_OFF_PSM_READY(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 6));
   PSM_FRCE_OFF_PSM_READY_MASK : constant Unsigned_32 := PSM_FRCE_OFF_PSM_READY(ALL1);
   function PSM_FRCE_OFF_CLOCKS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 5));
   PSM_FRCE_OFF_CLOCKS_MASK : constant Unsigned_32 := PSM_FRCE_OFF_CLOCKS(ALL1);
   function PSM_FRCE_OFF_RESETS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 4));
   PSM_FRCE_OFF_RESETS_MASK : constant Unsigned_32 := PSM_FRCE_OFF_RESETS(ALL1);
   function PSM_FRCE_OFF_XOSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 3));
   PSM_FRCE_OFF_XOSC_MASK : constant Unsigned_32 := PSM_FRCE_OFF_XOSC(ALL1);
   function PSM_FRCE_OFF_ROSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 2));
   PSM_FRCE_OFF_ROSC_MASK : constant Unsigned_32 := PSM_FRCE_OFF_ROSC(ALL1);
   function PSM_FRCE_OFF_OTP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 1));
   PSM_FRCE_OFF_OTP_MASK : constant Unsigned_32 := PSM_FRCE_OFF_OTP(ALL1);
   function PSM_FRCE_OFF_PROC_COLD(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 0));
   PSM_FRCE_OFF_PROC_COLD_MASK : constant Unsigned_32 := PSM_FRCE_OFF_PROC_COLD(ALL1);

   -- WDSEL Register macros
   function PSM_WDSEL_ALL(v : Unsigned_32) return Unsigned_32 is (v and 16#FFFFFF#);
   PSM_WDSEL_ALL_MASK : constant Unsigned_32 := PSM_WDSEL_ALL(ALL1);
   function PSM_WDSEL_PROC1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 24));
   PSM_WDSEL_PROC1_MASK : constant Unsigned_32 := PSM_WDSEL_PROC1(ALL1);
   function PSM_WDSEL_PROC0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 23));
   PSM_WDSEL_PROC0_MASK : constant Unsigned_32 := PSM_WDSEL_PROC0(ALL1);
   function PSM_WDSEL_ACCESSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 22));
   PSM_WDSEL_ACCESSCTRL_MASK : constant Unsigned_32 := PSM_WDSEL_ACCESSCTRL(ALL1);
   function PSM_WDSEL_SIO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 21));
   PSM_WDSEL_SIO_MASK : constant Unsigned_32 := PSM_WDSEL_SIO(ALL1);
   function PSM_WDSEL_XIP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 20));
   PSM_WDSEL_XIP_MASK : constant Unsigned_32 := PSM_WDSEL_XIP(ALL1);
   function PSM_WDSEL_SRAM9(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 19));
   PSM_WDSEL_SRAM9_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM9(ALL1);
   function PSM_WDSEL_SRAM8(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 18));
   PSM_WDSEL_SRAM8_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM8(ALL1);
   function PSM_WDSEL_SRAM7(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 17));
   PSM_WDSEL_SRAM7_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM7(ALL1);
   function PSM_WDSEL_SRAM6(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 16));
   PSM_WDSEL_SRAM6_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM6(ALL1);
   function PSM_WDSEL_SRAM5(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 15));
   PSM_WDSEL_SRAM5_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM5(ALL1);
   function PSM_WDSEL_SRAM4(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 14));
   PSM_WDSEL_SRAM4_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM4(ALL1);
   function PSM_WDSEL_SRAM3(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 13));
   PSM_WDSEL_SRAM3_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM3(ALL1);
   function PSM_WDSEL_SRAM2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 12));
   PSM_WDSEL_SRAM2_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM2(ALL1);
   function PSM_WDSEL_SRAM1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 11));
   PSM_WDSEL_SRAM1_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM1(ALL1);
   function PSM_WDSEL_SRAM0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 10));
   PSM_WDSEL_SRAM0_MASK : constant Unsigned_32 := PSM_WDSEL_SRAM0(ALL1);
   function PSM_WDSEL_BOOTRAM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 9));
   PSM_WDSEL_BOOTRAM_MASK : constant Unsigned_32 := PSM_WDSEL_BOOTRAM(ALL1);
   function PSM_WDSEL_ROM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 8));
   PSM_WDSEL_ROM_MASK : constant Unsigned_32 := PSM_WDSEL_ROM(ALL1);
   function PSM_WDSEL_BUSFABRIC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 7));
   PSM_WDSEL_BUSFABRIC_MASK : constant Unsigned_32 := PSM_WDSEL_BUSFABRIC(ALL1);
   function PSM_WDSEL_PSM_READY(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 6));
   PSM_WDSEL_PSM_READY_MASK : constant Unsigned_32 := PSM_WDSEL_PSM_READY(ALL1);
   function PSM_WDSEL_CLOCKS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 5));
   PSM_WDSEL_CLOCKS_MASK : constant Unsigned_32 := PSM_WDSEL_CLOCKS(ALL1);
   function PSM_WDSEL_RESETS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 4));
   PSM_WDSEL_RESETS_MASK : constant Unsigned_32 := PSM_WDSEL_RESETS(ALL1);
   function PSM_WDSEL_XOSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 3));
   PSM_WDSEL_XOSC_MASK : constant Unsigned_32 := PSM_WDSEL_XOSC(ALL1);
   function PSM_WDSEL_ROSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 2));
   PSM_WDSEL_ROSC_MASK : constant Unsigned_32 := PSM_WDSEL_ROSC(ALL1);
   function PSM_WDSEL_OTP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 1));
   PSM_WDSEL_OTP_MASK : constant Unsigned_32 := PSM_WDSEL_OTP(ALL1);
   function PSM_WDSEL_PROC_COLD(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 0));
   PSM_WDSEL_PROC_COLD_MASK : constant Unsigned_32 := PSM_WDSEL_PROC_COLD(ALL1);

   -- DONE Register macros
   function PSM_DONE_PROC1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 24));
   PSM_DONE_PROC1_MASK : constant Unsigned_32 := PSM_DONE_PROC1(ALL1);
   function PSM_DONE_PROC0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 23));
   PSM_DONE_PROC0_MASK : constant Unsigned_32 := PSM_DONE_PROC0(ALL1);
   function PSM_DONE_ACCESSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 22));
   PSM_DONE_ACCESSCTRL_MASK : constant Unsigned_32 := PSM_DONE_ACCESSCTRL(ALL1);
   function PSM_DONE_SIO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 21));
   PSM_DONE_SIO_MASK : constant Unsigned_32 := PSM_DONE_SIO(ALL1);
   function PSM_DONE_XIP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 20));
   PSM_DONE_XIP_MASK : constant Unsigned_32 := PSM_DONE_XIP(ALL1);
   function PSM_DONE_SRAM9(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 19));
   PSM_DONE_SRAM9_MASK : constant Unsigned_32 := PSM_DONE_SRAM9(ALL1);
   function PSM_DONE_SRAM8(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 18));
   PSM_DONE_SRAM8_MASK : constant Unsigned_32 := PSM_DONE_SRAM8(ALL1);
   function PSM_DONE_SRAM7(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 17));
   PSM_DONE_SRAM7_MASK : constant Unsigned_32 := PSM_DONE_SRAM7(ALL1);
   function PSM_DONE_SRAM6(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 16));
   PSM_DONE_SRAM6_MASK : constant Unsigned_32 := PSM_DONE_SRAM6(ALL1);
   function PSM_DONE_SRAM5(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 15));
   PSM_DONE_SRAM5_MASK : constant Unsigned_32 := PSM_DONE_SRAM5(ALL1);
   function PSM_DONE_SRAM4(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 14));
   PSM_DONE_SRAM4_MASK : constant Unsigned_32 := PSM_DONE_SRAM4(ALL1);
   function PSM_DONE_SRAM3(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 13));
   PSM_DONE_SRAM3_MASK : constant Unsigned_32 := PSM_DONE_SRAM3(ALL1);
   function PSM_DONE_SRAM2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 12));
   PSM_DONE_SRAM2_MASK : constant Unsigned_32 := PSM_DONE_SRAM2(ALL1);
   function PSM_DONE_SRAM1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 11));
   PSM_DONE_SRAM1_MASK : constant Unsigned_32 := PSM_DONE_SRAM1(ALL1);
   function PSM_DONE_SRAM0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 10));
   PSM_DONE_SRAM0_MASK : constant Unsigned_32 := PSM_DONE_SRAM0(ALL1);
   function PSM_DONE_BOOTRAM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 9));
   PSM_DONE_BOOTRAM_MASK : constant Unsigned_32 := PSM_DONE_BOOTRAM(ALL1);
   function PSM_DONE_ROM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 8));
   PSM_DONE_ROM_MASK : constant Unsigned_32 := PSM_DONE_ROM(ALL1);
   function PSM_DONE_BUSFABRIC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 7));
   PSM_DONE_BUSFABRIC_MASK : constant Unsigned_32 := PSM_DONE_BUSFABRIC(ALL1);
   function PSM_DONE_PSM_READY(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 6));
   PSM_DONE_PSM_READY_MASK : constant Unsigned_32 := PSM_DONE_PSM_READY(ALL1);
   function PSM_DONE_CLOCKS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 5));
   PSM_DONE_CLOCKS_MASK : constant Unsigned_32 := PSM_DONE_CLOCKS(ALL1);
   function PSM_DONE_RESETS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 4));
   PSM_DONE_RESETS_MASK : constant Unsigned_32 := PSM_DONE_RESETS(ALL1);
   function PSM_DONE_XOSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 3));
   PSM_DONE_XOSC_MASK : constant Unsigned_32 := PSM_DONE_XOSC(ALL1);
   function PSM_DONE_ROSC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 2));
   PSM_DONE_ROSC_MASK : constant Unsigned_32 := PSM_DONE_ROSC(ALL1);
   function PSM_DONE_OTP(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 1));
   PSM_DONE_OTP_MASK : constant Unsigned_32 := PSM_DONE_OTP(ALL1);
   function PSM_DONE_PROC_COLD(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 16#1#, 0));
   PSM_DONE_PROC_COLD_MASK : constant Unsigned_32 := PSM_DONE_PROC_COLD(ALL1);

end RP2350_PSM;
