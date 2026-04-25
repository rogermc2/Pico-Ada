--  Copyright (c) 2024-2025 Douglas H. Summerville (dsummer@binghamton.edu) 
-- 
--  Created from scraped data which is Copyright (c) 2024 Raspberry Pi
--  (Trading) Ltd.
-- 
--  Permission is hereby granted, free of charge, to any person obtaining a
--  copy of this software and associated documentation files (the "Software"),
--  to deal in the Software without restriction, including without limitation
--  the rights to use, copy, modify, merge, publish, distribute, sublicense,
--  and/or sell copies of the Software, and to permit persons to whom the
--  Software is furnished to do so, subject to the following conditions:
-- 
--  The above copyright notice and this permission notice shall be included
--  in all copies or substantial portions of the Software.
-- 
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 -- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--  DEALINGS IN THE SOFTWARE.

with Interfaces; use Interfaces;
with System;
pragma Preelaborate;

package RP2350_Ticks is

   ALL1 : constant Unsigned_32 := 16#FFFF_FFFF#;

   type Unsigned_32_Array is array (Positive range <>) of Unsigned_32;

   type TICKS_REG_BLOCKS is record
      proc0_ctrl          : Unsigned_32 := 0;
      proc0_cycles        : Unsigned_32 := 0;
      proc0_count         : Unsigned_32 := 0;
      proc1_ctrl          : Unsigned_32 := 0;
      proc1_cycles        : Unsigned_32 := 0;
      proc1_count         : Unsigned_32 := 0;
      timer0_ctrl         : Unsigned_32 := 0;
      timer0_cycles       : Unsigned_32 := 0;
      timer0_count        : Unsigned_32 := 0;
      timer1_ctrl         : Unsigned_32 := 0;
      timer1_cycles       : Unsigned_32 := 0;
      timer1_count        : Unsigned_32 := 0;
      watchdog_ctrl       : Unsigned_32 := 0;
      watchdog_cycles     : Unsigned_32 := 0;
      watchdog_count      : Unsigned_32 := 0;
      riscv_ctrl          : Unsigned_32 := 0;
      riscv_cycles        : Unsigned_32 := 0;
      riscv_count         : Unsigned_32 := 0;
      RSVD0               : Unsigned_32_Array (1 .. 1006);
      proc0_ctrl_xor      : Unsigned_32 := 0;
      proc0_cycles_xor    : Unsigned_32 := 0;
      proc0_count_xor     : Unsigned_32 := 0;
      proc1_ctrl_xor      : Unsigned_32 := 0;
      proc1_cycles_xor    : Unsigned_32 := 0;
      proc1_count_xor     : Unsigned_32 := 0;
      timer0_ctrl_xor     : Unsigned_32 := 0;
      timer0_cycles_xor   : Unsigned_32 := 0;
      timer0_count_xor    : Unsigned_32 := 0;
      timer1_ctrl_xor     : Unsigned_32 := 0;
      timer1_cycles_xor   : Unsigned_32 := 0;
      timer1_count_xor    : Unsigned_32 := 0;
      watchdog_ctrl_xor   : Unsigned_32 := 0;
      watchdog_cycles_xor : Unsigned_32 := 0;
      watchdog_count_xor  : Unsigned_32 := 0;
      riscv_ctrl_xor      : Unsigned_32 := 0;
      riscv_cycles_xor    : Unsigned_32 := 0;
      riscv_count_xor     : Unsigned_32 := 0;
      RSVDxor_0           : Unsigned_32_Array (1 .. 1006);
      proc0_ctrl_set      : Unsigned_32 := 0;
      proc0_cycles_set    : Unsigned_32 := 0;
      proc0_count_set     : Unsigned_32 := 0;
      proc1_ctrl_set      : Unsigned_32 := 0;
      proc1_cycles_set    : Unsigned_32 := 0;
      proc1_count_set     : Unsigned_32 := 0;
      timer0_ctrl_set     : Unsigned_32 := 0;
      timer0_cycles_set   : Unsigned_32 := 0;
      timer0_count_set    : Unsigned_32 := 0;
      timer1_ctrl_set     : Unsigned_32 := 0;
      timer1_cycles_set   : Unsigned_32 := 0;
      timer1_count_set    : Unsigned_32 := 0;
      watchdog_ctrl_set   : Unsigned_32 := 0;
      watchdog_cycles_set : Unsigned_32 := 0;
      watchdog_count_set  : Unsigned_32 := 0;
      riscv_ctrl_set      : Unsigned_32 := 0;
      riscv_cycles_set    : Unsigned_32 := 0;
      riscv_count_set     : Unsigned_32 := 0;
      RSVDset_0           : Unsigned_32_Array (1 .. 1006);
      proc0_ctrl_clr      : Unsigned_32 := 0;
      proc0_cycles_clr    : Unsigned_32 := 0;
      proc0_count_clr     : Unsigned_32 := 0;
      proc1_ctrl_clr      : Unsigned_32 := 0;
      proc1_cycles_clr    : Unsigned_32 := 0;
      proc1_count_clr     : Unsigned_32 := 0;
      timer0_ctrl_clr     : Unsigned_32 := 0;
      timer0_cycles_clr   : Unsigned_32 := 0;
      timer0_count_clr    : Unsigned_32 := 0;
      timer1_ctrl_clr     : Unsigned_32 := 0;
      timer1_cycles_clr   : Unsigned_32 := 0;
      timer1_count_clr    : Unsigned_32 := 0;
      watchdog_ctrl_clr   : Unsigned_32 := 0;
      watchdog_cycles_clr : Unsigned_32 := 0;
      watchdog_count_clr  : Unsigned_32 := 0;
      riscv_ctrl_clr      : Unsigned_32 := 0;
      riscv_cycles_clr    : Unsigned_32 := 0;
      riscv_count_clr     : Unsigned_32 := 0;
      RSVDclr_0           : Unsigned_32_Array (1 .. 1006);
   end record with Pack, Volatile;

   for TICKS_REG_BLOCKS use record
      proc0_ctrl          at 16#0000# range 0 .. 31;
      proc0_cycles        at 16#0004# range 0 .. 31;
      proc0_count         at 16#0008# range 0 .. 31;
      proc1_ctrl          at 16#000C# range 0 .. 31;
      proc1_cycles        at 16#0010# range 0 .. 31;
      proc1_count         at 16#0014# range 0 .. 31;
      timer0_ctrl         at 16#0018# range 0 .. 31;
      timer0_cycles       at 16#001C# range 0 .. 31;
      timer0_count        at 16#0020# range 0 .. 31;
      timer1_ctrl         at 16#0024# range 0 .. 31;
      timer1_cycles       at 16#0028# range 0 .. 31;
      timer1_count        at 16#002C# range 0 .. 31;
      watchdog_ctrl       at 16#0030# range 0 .. 31;
      watchdog_cycles     at 16#0034# range 0 .. 31;
      watchdog_count      at 16#0038# range 0 .. 31;
      riscv_ctrl          at 16#003C# range 0 .. 31;
      riscv_cycles        at 16#0040# range 0 .. 31;
      riscv_count         at 16#0044# range 0 .. 31;
      RSVD0               at 16#0048# range 0 .. 1006 * 32 - 1;
      proc0_ctrl_xor      at 16#1000# range 0 .. 31;
      proc0_cycles_xor    at 16#1004# range 0 .. 31;
      proc0_count_xor     at 16#1008# range 0 .. 31;
      proc1_ctrl_xor      at 16#100C# range 0 .. 31;
      proc1_cycles_xor    at 16#1010# range 0 .. 31;
      proc1_count_xor     at 16#1014# range 0 .. 31;
      timer0_ctrl_xor     at 16#1018# range 0 .. 31;
      timer0_cycles_xor   at 16#101C# range 0 .. 31;
      timer0_count_xor    at 16#1020# range 0 .. 31;
      timer1_ctrl_xor     at 16#1024# range 0 .. 31;
      timer1_cycles_xor   at 16#1028# range 0 .. 31;
      timer1_count_xor    at 16#102C# range 0 .. 31;
      watchdog_ctrl_xor   at 16#1030# range 0 .. 31;
      watchdog_cycles_xor at 16#1034# range 0 .. 31;
      watchdog_count_xor  at 16#1038# range 0 .. 31;
      riscv_ctrl_xor      at 16#103C# range 0 .. 31;
      riscv_cycles_xor    at 16#1040# range 0 .. 31;
      riscv_count_xor     at 16#1044# range 0 .. 31;
      RSVDxor_0           at 16#1048# range 0 .. 1006 * 32 - 1;
      proc0_ctrl_set      at 16#2000# range 0 .. 31;
      proc0_cycles_set    at 16#2004# range 0 .. 31;
      proc0_count_set     at 16#2008# range 0 .. 31;
      proc1_ctrl_set      at 16#200C# range 0 .. 31;
      proc1_cycles_set    at 16#2010# range 0 .. 31;
      proc1_count_set     at 16#2014# range 0 .. 31;
      timer0_ctrl_set     at 16#2018# range 0 .. 31;
      timer0_cycles_set   at 16#201C# range 0 .. 31;
      timer0_count_set    at 16#2020# range 0 .. 31;
      timer1_ctrl_set     at 16#2024# range 0 .. 31;
      timer1_cycles_set   at 16#2028# range 0 .. 31;
      timer1_count_set    at 16#202C# range 0 .. 31;
      watchdog_ctrl_set   at 16#2030# range 0 .. 31;
      watchdog_cycles_set at 16#2034# range 0 .. 31;
      watchdog_count_set  at 16#2038# range 0 .. 31;
      riscv_ctrl_set      at 16#203C# range 0 .. 31;
      riscv_cycles_set    at 16#2040# range 0 .. 31;
      riscv_count_set     at 16#2044# range 0 .. 31;
      RSVDset_0           at 16#2048# range 0 .. 1006 * 32 - 1;
      proc0_ctrl_clr      at 16#3000# range 0 .. 31;
      proc0_cycles_clr    at 16#3004# range 0 .. 31;
      proc0_count_clr     at 16#3008# range 0 .. 31;
      proc1_ctrl_clr      at 16#300C# range 0 .. 31;
      proc1_cycles_clr    at 16#3010# range 0 .. 31;
      proc1_count_clr     at 16#3014# range 0 .. 31;
      timer0_ctrl_clr     at 16#3018# range 0 .. 31;
      timer0_cycles_clr   at 16#301C# range 0 .. 31;
      timer0_count_clr    at 16#3020# range 0 .. 31;
      timer1_ctrl_clr     at 16#3024# range 0 .. 31;
      timer1_cycles_clr   at 16#3028# range 0 .. 31;
      timer1_count_clr    at 16#302C# range 0 .. 31;
      watchdog_ctrl_clr   at 16#3030# range 0 .. 31;
      watchdog_cycles_clr at 16#3034# range 0 .. 31;
      watchdog_count_clr  at 16#3038# range 0 .. 31;
      riscv_ctrl_clr      at 16#303C# range 0 .. 31;
      riscv_cycles_clr    at 16#3040# range 0 .. 31;
      riscv_count_clr     at 16#3044# range 0 .. 31;
      RSVDclr_0           at 16#3048# range 0 .. 1006 * 32 - 1;
   end record;

   -- IO Registers as struct

   ticks : TICKS_REG_BLOCKS with
     Volatile,
     Address => System'To_Address (16#40108000#);

   -- IO Registers AS MACROS

   TICKS_PROC0_CTRL : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108000#);

   TICKS_PROC0_CYCLES : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108004#);

   TICKS_PROC0_COUNT : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108008#);

   TICKS_PROC1_CTRL : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010800C#);

   TICKS_PROC1_CYCLES : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108010#);

   TICKS_PROC1_COUNT : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108014#);

   TICKS_TIMER0_CTRL : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108018#);

   TICKS_TIMER0_CYCLES : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010801C#);

   TICKS_TIMER0_COUNT : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108020#);

   TICKS_TIMER1_CTRL : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108024#);

   TICKS_TIMER1_CYCLES : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108028#);

   TICKS_TIMER1_COUNT : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010802C#);

   TICKS_WATCHDOG_CTRL : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108030#);

   TICKS_WATCHDOG_CYCLES : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108034#);

   TICKS_WATCHDOG_COUNT : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108038#);

   TICKS_RISCV_CTRL : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010803C#);

   TICKS_RISCV_CYCLES : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108040#);

   TICKS_RISCV_COUNT : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40108044#);

   TICKS_PROC0_CTRL_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109000#);

   TICKS_PROC0_CYCLES_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109004#);

   TICKS_PROC0_COUNT_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109008#);

   TICKS_PROC1_CTRL_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010900C#);

   TICKS_PROC1_CYCLES_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109010#);

   TICKS_PROC1_COUNT_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109014#);

   TICKS_TIMER0_CTRL_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109018#);

   TICKS_TIMER0_CYCLES_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010901C#);

   TICKS_TIMER0_COUNT_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109020#);

   TICKS_TIMER1_CTRL_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109024#);

   TICKS_TIMER1_CYCLES_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109028#);

   TICKS_TIMER1_COUNT_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010902C#);

   TICKS_WATCHDOG_CTRL_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109030#);

   TICKS_WATCHDOG_CYCLES_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109034#);

   TICKS_WATCHDOG_COUNT_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109038#);

   TICKS_RISCV_CTRL_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010903C#);

   TICKS_RISCV_CYCLES_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109040#);

   TICKS_RISCV_COUNT_XOR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#40109044#);

   TICKS_PROC0_CTRL_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A000#);

   TICKS_PROC0_CYCLES_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A004#);

   TICKS_PROC0_COUNT_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A008#);

   TICKS_PROC1_CTRL_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A00C#);

   TICKS_PROC1_CYCLES_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A010#);

   TICKS_PROC1_COUNT_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A014#);

   TICKS_TIMER0_CTRL_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A018#);

   TICKS_TIMER0_CYCLES_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A01C#);

   TICKS_TIMER0_COUNT_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A020#);

   TICKS_TIMER1_CTRL_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A024#);

   TICKS_TIMER1_CYCLES_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A028#);

   TICKS_TIMER1_COUNT_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A02C#);

   TICKS_WATCHDOG_CTRL_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A030#);

   TICKS_WATCHDOG_CYCLES_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A034#);

   TICKS_WATCHDOG_COUNT_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A038#);

   TICKS_RISCV_CTRL_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A03C#);

   TICKS_RISCV_CYCLES_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A040#);

   TICKS_RISCV_COUNT_SET : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010A044#);

   TICKS_PROC0_CTRL_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B000#);

   TICKS_PROC0_CYCLES_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B004#);

   TICKS_PROC0_COUNT_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B008#);

   TICKS_PROC1_CTRL_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B00C#);

   TICKS_PROC1_CYCLES_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B010#);

   TICKS_PROC1_COUNT_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B014#);

   TICKS_TIMER0_CTRL_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B018#);

   TICKS_TIMER0_CYCLES_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B01C#);

   TICKS_TIMER0_COUNT_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B020#);

   TICKS_TIMER1_CTRL_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B024#);

   TICKS_TIMER1_CYCLES_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B028#);

   TICKS_TIMER1_COUNT_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B02C#);

   TICKS_WATCHDOG_CTRL_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B030#);

   TICKS_WATCHDOG_CYCLES_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B034#);

   TICKS_WATCHDOG_COUNT_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B038#);

   TICKS_RISCV_CTRL_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B03C#);

   TICKS_RISCV_CYCLES_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B040#);

   TICKS_RISCV_COUNT_CLR : Unsigned_32 with
     Volatile,
     Address => System'To_Address (16#4010B044#);

   -- PROC0_CTRL Register macros

   function TICKS_PROC0_CTRL_RUNNING (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 1));
   pragma Inline (TICKS_PROC0_CTRL_RUNNING);

   TICKS_PROC0_CTRL_RUNNING_MASK : constant Unsigned_32 := TICKS_PROC0_CTRL_RUNNING (ALL1);

   function TICKS_PROC0_CTRL_ENABLE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 0));
   pragma Inline (TICKS_PROC0_CTRL_ENABLE);

   TICKS_PROC0_CTRL_ENABLE_MASK : constant Unsigned_32 := TICKS_PROC0_CTRL_ENABLE (ALL1);

   -- PROC0_CYCLES Register macros

   -- PROC0_COUNT Register macros

   -- PROC1_CTRL Register macros

   function TICKS_PROC1_CTRL_RUNNING (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 1));
   pragma Inline (TICKS_PROC1_CTRL_RUNNING);

   TICKS_PROC1_CTRL_RUNNING_MASK : constant Unsigned_32 := TICKS_PROC1_CTRL_RUNNING (ALL1);

   function TICKS_PROC1_CTRL_ENABLE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 0));
   pragma Inline (TICKS_PROC1_CTRL_ENABLE);

   TICKS_PROC1_CTRL_ENABLE_MASK : constant Unsigned_32 := TICKS_PROC1_CTRL_ENABLE (ALL1);

   -- PROC1_CYCLES Register macros

   -- PROC1_COUNT Register macros

   -- TIMER0_CTRL Register macros

   function TICKS_TIMER0_CTRL_RUNNING (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 1));
   pragma Inline (TICKS_TIMER0_CTRL_RUNNING);

   TICKS_TIMER0_CTRL_RUNNING_MASK : constant Unsigned_32 := TICKS_TIMER0_CTRL_RUNNING (ALL1);

   function TICKS_TIMER0_CTRL_ENABLE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 0));
   pragma Inline (TICKS_TIMER0_CTRL_ENABLE);

   TICKS_TIMER0_CTRL_ENABLE_MASK : constant Unsigned_32 := TICKS_TIMER0_CTRL_ENABLE (ALL1);

   -- TIMER0_CYCLES Register macros

   -- TIMER0_COUNT Register macros

   -- TIMER1_CTRL Register macros

   function TICKS_TIMER1_CTRL_RUNNING (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 1));
   pragma Inline (TICKS_TIMER1_CTRL_RUNNING);

   TICKS_TIMER1_CTRL_RUNNING_MASK : constant Unsigned_32 := TICKS_TIMER1_CTRL_RUNNING (ALL1);

   function TICKS_TIMER1_CTRL_ENABLE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 0));
   pragma Inline (TICKS_TIMER1_CTRL_ENABLE);

   TICKS_TIMER1_CTRL_ENABLE_MASK : constant Unsigned_32 := TICKS_TIMER1_CTRL_ENABLE (ALL1);

   -- TIMER1_CYCLES Register macros

   -- TIMER1_COUNT Register macros

   -- WATCHDOG_CTRL Register macros

   function TICKS_WATCHDOG_CTRL_RUNNING (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 1));
   pragma Inline (TICKS_WATCHDOG_CTRL_RUNNING);

   TICKS_WATCHDOG_CTRL_RUNNING_MASK : constant Unsigned_32 := TICKS_WATCHDOG_CTRL_RUNNING (ALL1);

   function TICKS_WATCHDOG_CTRL_ENABLE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 0));
   pragma Inline (TICKS_WATCHDOG_CTRL_ENABLE);

   TICKS_WATCHDOG_CTRL_ENABLE_MASK : constant Unsigned_32 := TICKS_WATCHDOG_CTRL_ENABLE (ALL1);

   -- WATCHDOG_CYCLES Register macros

   -- WATCHDOG_COUNT Register macros

   -- RISCV_CTRL Register macros

   function TICKS_RISCV_CTRL_RUNNING (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 1));
   pragma Inline (TICKS_RISCV_CTRL_RUNNING);

   TICKS_RISCV_CTRL_RUNNING_MASK : constant Unsigned_32 := TICKS_RISCV_CTRL_RUNNING (ALL1);

   function TICKS_RISCV_CTRL_ENABLE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 1, 0));
   pragma Inline (TICKS_RISCV_CTRL_ENABLE);

   TICKS_RISCV_CTRL_ENABLE_MASK : constant Unsigned_32 := TICKS_RISCV_CTRL_ENABLE (ALL1);

   -- RISCV_CYCLES Register macros

   -- RISCV_COUNT Register macros

end RP2350_Ticks;
