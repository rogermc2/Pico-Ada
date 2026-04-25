--  --   Copyright (c) 2024-2025 Douglas H. Summerville (dsummer@binghamton.edu) 
--   *
--   * Created from scraped data which is Copyright (c) 2024 Raspberry Pi
--   * (Trading) Ltd.
--   *
--   * Permission is hereby granted, free of charge, to any person obtaining a
--   * copy of this software and associated documentation files (the "Software"),
--   * to deal in the Software without restriction, including without limitation
--   * the rights to use, copy, modify, merge, publish, distribute, sublicense,
--   * and/or sell copies of the Software, and to permit persons to whom the
--   * Software is furnished to do so, subject to the following conditions:
--   *
--   * The above copyright notice and this permission notice shall be included
--   * in all copies or substantial portions of the Software.
--   *
--   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--   * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--   * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--   * DEALINGS IN THE SOFTWARE.
--   

with Interfaces; use Interfaces;
with System;

package RP2350_SIO is

   subtype uint32_t is Unsigned_32;

   ALL1 : constant uint32_t := 16#FFFFFFFF#;

   type RSVD1_Array is array (0 .. 7) of uint32_t;
   type RSVD2_Array is array (0 .. 2) of uint32_t;
   type RSVD3_Array is array (0 .. 1) of uint32_t;

   type SIO_REG_BLOCKS is record
      cpuid               : uint32_t := 0;
      gpio_in             : uint32_t := 0;
      gpio_hi_in          : uint32_t := 0;
      RSVD0               : uint32_t := 0;
      gpio_out            : uint32_t := 0;
      gpio_hi_out         : uint32_t := 0;
      gpio_out_set        : uint32_t := 0;
      gpio_hi_out_set     : uint32_t := 0;
      gpio_out_clr        : uint32_t := 0;
      gpio_hi_out_clr     : uint32_t := 0;
      gpio_out_xor        : uint32_t := 0;
      gpio_hi_out_xor     : uint32_t := 0;
      gpio_oe             : uint32_t := 0;
      gpio_hi_oe          : uint32_t := 0;
      gpio_oe_set         : uint32_t := 0;
      gpio_hi_oe_set      : uint32_t := 0;
      gpio_oe_clr         : uint32_t := 0;
      gpio_hi_oe_clr      : uint32_t := 0;
      gpio_oe_xor         : uint32_t := 0;
      gpio_hi_oe_xor      : uint32_t := 0;
      fifo_st             : uint32_t := 0;
      fifo_wr             : uint32_t := 0;
      fifo_rd             : uint32_t := 0;
      spinlock_st         : uint32_t := 0;
      RSVD1               : RSVD1_Array;
      interp0_accum0      : uint32_t := 0;
      interp0_accum1      : uint32_t := 0;
      interp0_base0       : uint32_t := 0;
      interp0_base1       : uint32_t := 0;
      interp0_base2       : uint32_t := 0;
      interp0_pop_lane0   : uint32_t := 0;
      interp0_pop_lane1   : uint32_t := 0;
      interp0_pop_full    : uint32_t := 0;
      interp0_peek_lane0  : uint32_t := 0;
      interp0_peek_lane1  : uint32_t := 0;
      interp0_peek_full   : uint32_t := 0;
      interp0_ctrl_lane0  : uint32_t := 0;
      interp0_ctrl_lane1  : uint32_t := 0;
      interp0_accum0_add  : uint32_t := 0;
      interp0_accum1_add  : uint32_t := 0;
      interp0_base_1and0  : uint32_t := 0;
      interp1_accum0      : uint32_t := 0;
      interp1_accum1      : uint32_t := 0;
      interp1_base0       : uint32_t := 0;
      interp1_base1       : uint32_t := 0;
      interp1_base2       : uint32_t := 0;
      interp1_pop_lane0   : uint32_t := 0;
      interp1_pop_lane1   : uint32_t := 0;
      interp1_pop_full    : uint32_t := 0;
      interp1_peek_lane0  : uint32_t := 0;
      interp1_peek_lane1  : uint32_t := 0;
      interp1_peek_full   : uint32_t := 0;
      interp1_ctrl_lane0  : uint32_t := 0;
      interp1_ctrl_lane1  : uint32_t := 0;
      interp1_accum0_add  : uint32_t := 0;
      interp1_accum1_add  : uint32_t := 0;
      interp1_base_1and0  : uint32_t := 0;
      spinlock0           : uint32_t := 0;
      spinlock1           : uint32_t := 0;
      spinlock2           : uint32_t := 0;
      spinlock3           : uint32_t := 0;
      spinlock4           : uint32_t := 0;
      spinlock5           : uint32_t := 0;
      spinlock6           : uint32_t := 0;
      spinlock7           : uint32_t := 0;
      spinlock8           : uint32_t := 0;
      spinlock9           : uint32_t := 0;
      spinlock10          : uint32_t := 0;
      spinlock11          : uint32_t := 0;
      spinlock12          : uint32_t := 0;
      spinlock13          : uint32_t := 0;
      spinlock14          : uint32_t := 0;
      spinlock15          : uint32_t := 0;
      spinlock16          : uint32_t := 0;
      spinlock17          : uint32_t := 0;
      spinlock18          : uint32_t := 0;
      spinlock19          : uint32_t := 0;
      spinlock20          : uint32_t := 0;
      spinlock21          : uint32_t := 0;
      spinlock22          : uint32_t := 0;
      spinlock23          : uint32_t := 0;
      spinlock24          : uint32_t := 0;
      spinlock25          : uint32_t := 0;
      spinlock26          : uint32_t := 0;
      spinlock27          : uint32_t := 0;
      spinlock28          : uint32_t := 0;
      spinlock29          : uint32_t := 0;
      spinlock30          : uint32_t := 0;
      spinlock31          : uint32_t := 0;
      doorbell_out_set    : uint32_t := 0;
      doorbell_out_clr    : uint32_t := 0;
      doorbell_in_set     : uint32_t := 0;
      doorbell_in_clr     : uint32_t := 0;
      peri_nonsec         : uint32_t := 0;
      RSVD2               : RSVD2_Array;
      riscv_softirq       : uint32_t := 0;
      mtime_ctrl          : uint32_t := 0;
      RSVD3               : RSVD3_Array;
      mtime               : uint32_t := 0;
      mtimeh              : uint32_t := 0;
      mtimecmp            : uint32_t := 0;
      mtimecmph           : uint32_t := 0;
      tmds_ctrl           : uint32_t := 0;
      tmds_wdata          : uint32_t := 0;
      tmds_peek_single    : uint32_t := 0;
      tmds_pop_single     : uint32_t := 0;
      tmds_peek_double_l0 : uint32_t := 0;
      tmds_pop_double_l0  : uint32_t := 0;
      tmds_peek_double_l1 : uint32_t := 0;
      tmds_pop_double_l1  : uint32_t := 0;
      tmds_peek_double_l2 : uint32_t := 0;
      tmds_pop_double_l2  : uint32_t := 0;
   end record
     with Volatile, Alignment => 4;

   type SIO_NONSEC_REG_BLOCKS is record
      cpuid               : uint32_t := 0;
      gpio_in             : uint32_t := 0;
      gpio_hi_in          : uint32_t := 0;
      RSVD0               : uint32_t := 0;
      gpio_out            : uint32_t := 0;
      gpio_hi_out         : uint32_t := 0;
      gpio_out_set        : uint32_t := 0;
      gpio_hi_out_set     : uint32_t := 0;
      gpio_out_clr        : uint32_t := 0;
      gpio_hi_out_clr     : uint32_t := 0;
      gpio_out_xor        : uint32_t := 0;
      gpio_hi_out_xor     : uint32_t := 0;
      gpio_oe             : uint32_t := 0;
      gpio_hi_oe          : uint32_t := 0;
      gpio_oe_set         : uint32_t := 0;
      gpio_hi_oe_set      : uint32_t := 0;
      gpio_oe_clr         : uint32_t := 0;
      gpio_hi_oe_clr      : uint32_t := 0;
      gpio_oe_xor         : uint32_t := 0;
      gpio_hi_oe_xor      : uint32_t := 0;
      fifo_st             : uint32_t := 0;
      fifo_wr             : uint32_t := 0;
      fifo_rd             : uint32_t := 0;
      spinlock_st         : uint32_t := 0;
      RSVD1               : RSVD1_Array;
      interp0_accum0      : uint32_t := 0;
      interp0_accum1      : uint32_t := 0;
      interp0_base0       : uint32_t := 0;
      interp0_base1       : uint32_t := 0;
      interp0_base2       : uint32_t := 0;
      interp0_pop_lane0   : uint32_t := 0;
      interp0_pop_lane1   : uint32_t := 0;
      interp0_pop_full    : uint32_t := 0;
      interp0_peek_lane0  : uint32_t := 0;
      interp0_peek_lane1  : uint32_t := 0;
      interp0_peek_full   : uint32_t := 0;
      interp0_ctrl_lane0  : uint32_t := 0;
      interp0_ctrl_lane1  : uint32_t := 0;
      interp0_accum0_add  : uint32_t := 0;
      interp0_accum1_add  : uint32_t := 0;
      interp0_base_1and0  : uint32_t := 0;
      interp1_accum0      : uint32_t := 0;
      interp1_accum1      : uint32_t := 0;
      interp1_base0       : uint32_t := 0;
      interp1_base1       : uint32_t := 0;
      interp1_base2       : uint32_t := 0;
      interp1_pop_lane0   : uint32_t := 0;
      interp1_pop_lane1   : uint32_t := 0;
      interp1_pop_full    : uint32_t := 0;
      interp1_peek_lane0  : uint32_t := 0;
      interp1_peek_lane1  : uint32_t := 0;
      interp1_peek_full   : uint32_t := 0;
      interp1_ctrl_lane0  : uint32_t := 0;
      interp1_ctrl_lane1  : uint32_t := 0;
      interp1_accum0_add  : uint32_t := 0;
      interp1_accum1_add  : uint32_t := 0;
      interp1_base_1and0  : uint32_t := 0;
      spinlock0           : uint32_t := 0;
      spinlock1           : uint32_t := 0;
      spinlock2           : uint32_t := 0;
      spinlock3           : uint32_t := 0;
      spinlock4           : uint32_t := 0;
      spinlock5           : uint32_t := 0;
      spinlock6           : uint32_t := 0;
      spinlock7           : uint32_t := 0;
      spinlock8           : uint32_t := 0;
      spinlock9           : uint32_t := 0;
      spinlock10          : uint32_t := 0;
      spinlock11          : uint32_t := 0;
      spinlock12          : uint32_t := 0;
      spinlock13          : uint32_t := 0;
      spinlock14          : uint32_t := 0;
      spinlock15          : uint32_t := 0;
      spinlock16          : uint32_t := 0;
      spinlock17          : uint32_t := 0;
      spinlock18          : uint32_t := 0;
      spinlock19          : uint32_t := 0;
      spinlock20          : uint32_t := 0;
      spinlock21          : uint32_t := 0;
      spinlock22          : uint32_t := 0;
      spinlock23          : uint32_t := 0;
      spinlock24          : uint32_t := 0;
      spinlock25          : uint32_t := 0;
      spinlock26          : uint32_t := 0;
      spinlock27          : uint32_t := 0;
      spinlock28          : uint32_t := 0;
      spinlock29          : uint32_t := 0;
      spinlock30          : uint32_t := 0;
      spinlock31          : uint32_t := 0;
      doorbell_out_set    : uint32_t := 0;
      doorbell_out_clr    : uint32_t := 0;
      doorbell_in_set     : uint32_t := 0;
      doorbell_in_clr     : uint32_t := 0;
      peri_nonsec         : uint32_t := 0;
      RSVD2               : RSVD2_Array;
      riscv_softirq       : uint32_t := 0;
      mtime_ctrl          : uint32_t := 0;
      RSVD3               : RSVD3_Array;
      mtime               : uint32_t := 0;
      mtimeh              : uint32_t := 0;
      mtimecmp            : uint32_t := 0;
      mtimecmph           : uint32_t := 0;
      tmds_ctrl           : uint32_t := 0;
      tmds_wdata          : uint32_t := 0;
      tmds_peek_single    : uint32_t := 0;
      tmds_pop_single     : uint32_t := 0;
      tmds_peek_double_l0 : uint32_t := 0;
      tmds_pop_double_l0  : uint32_t := 0;
      tmds_peek_double_l1 : uint32_t := 0;
      tmds_pop_double_l1  : uint32_t := 0;
      tmds_peek_double_l2 : uint32_t := 0;
      tmds_pop_double_l2  : uint32_t := 0;
   end record
     with Volatile, Alignment => 4;


   -- --  IO Registers as struct

   -- #define sio (*(SIO_REG_BLOCKS volatile *)0xd0000000)
   sio : SIO_REG_BLOCKS
     with Import, Address => System'To_Address (16#D0000000#);

   -- #define sio_nonsec (*(SIO_NONSEC_REG_BLOCKS volatile *)0xd0020000)
   sio_nonsec : SIO_NONSEC_REG_BLOCKS
     with Import, Address => System'To_Address (16#D0020000#);


   -- --  IO Registers AS MACROS

   -- #define SIO_CPUID (*(volatile uint32_t *)0xd0000000)
   SIO_CPUID : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000000#);
   -- #define SIO_GPIO_IN (*(volatile uint32_t *)0xd0000004)
   SIO_GPIO_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000004#);
   -- #define SIO_GPIO_HI_IN (*(volatile uint32_t *)0xd0000008)
   SIO_GPIO_HI_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000008#);
   -- #define SIO_GPIO_OUT (*(volatile uint32_t *)0xd0000010)
   SIO_GPIO_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000010#);
   -- #define SIO_GPIO_HI_OUT (*(volatile uint32_t *)0xd0000014)
   SIO_GPIO_HI_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000014#);
   -- #define SIO_GPIO_OUT_SET (*(volatile uint32_t *)0xd0000018)
   SIO_GPIO_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000018#);
   -- #define SIO_GPIO_HI_OUT_SET (*(volatile uint32_t *)0xd000001c)
   SIO_GPIO_HI_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d000001c#);
   -- #define SIO_GPIO_OUT_CLR (*(volatile uint32_t *)0xd0000020)
   SIO_GPIO_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000020#);
   -- #define SIO_GPIO_HI_OUT_CLR (*(volatile uint32_t *)0xd0000024)
   SIO_GPIO_HI_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000024#);
   -- #define SIO_GPIO_OUT_XOR (*(volatile uint32_t *)0xd0000028)
   SIO_GPIO_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000028#);
   -- #define SIO_GPIO_HI_OUT_XOR (*(volatile uint32_t *)0xd000002c)
   SIO_GPIO_HI_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d000002c#);
   -- #define SIO_GPIO_OE (*(volatile uint32_t *)0xd0000030)
   SIO_GPIO_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000030#);
   -- #define SIO_GPIO_HI_OE (*(volatile uint32_t *)0xd0000034)
   SIO_GPIO_HI_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000034#);
   -- #define SIO_GPIO_OE_SET (*(volatile uint32_t *)0xd0000038)
   SIO_GPIO_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000038#);
   -- #define SIO_GPIO_HI_OE_SET (*(volatile uint32_t *)0xd000003c)
   SIO_GPIO_HI_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d000003c#);
   -- #define SIO_GPIO_OE_CLR (*(volatile uint32_t *)0xd0000040)
   SIO_GPIO_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000040#);
   -- #define SIO_GPIO_HI_OE_CLR (*(volatile uint32_t *)0xd0000044)
   SIO_GPIO_HI_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000044#);
   -- #define SIO_GPIO_OE_XOR (*(volatile uint32_t *)0xd0000048)
   SIO_GPIO_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000048#);
   -- #define SIO_GPIO_HI_OE_XOR (*(volatile uint32_t *)0xd000004c)
   SIO_GPIO_HI_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d000004c#);
   -- #define SIO_FIFO_ST (*(volatile uint32_t *)0xd0000050)
   SIO_FIFO_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000050#);
   -- #define SIO_FIFO_WR (*(volatile uint32_t *)0xd0000054)
   SIO_FIFO_WR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000054#);
   -- #define SIO_FIFO_RD (*(volatile uint32_t *)0xd0000058)
   SIO_FIFO_RD : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000058#);
   -- #define SIO_SPINLOCK_ST (*(volatile uint32_t *)0xd000005c)
   SIO_SPINLOCK_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d000005c#);
   -- #define SIO_INTERP0_ACCUM0 (*(volatile uint32_t *)0xd0000080)
   SIO_INTERP0_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000080#);
   -- #define SIO_INTERP0_ACCUM1 (*(volatile uint32_t *)0xd0000084)
   SIO_INTERP0_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000084#);
   -- #define SIO_INTERP0_BASE0 (*(volatile uint32_t *)0xd0000088)
   SIO_INTERP0_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000088#);
   -- #define SIO_INTERP0_BASE1 (*(volatile uint32_t *)0xd000008c)
   SIO_INTERP0_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000008c#);
   -- #define SIO_INTERP0_BASE2 (*(volatile uint32_t *)0xd0000090)
   SIO_INTERP0_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000090#);
   -- #define SIO_INTERP0_POP_LANE0 (*(volatile uint32_t *)0xd0000094)
   SIO_INTERP0_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000094#);
   -- #define SIO_INTERP0_POP_LANE1 (*(volatile uint32_t *)0xd0000098)
   SIO_INTERP0_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000098#);
   -- #define SIO_INTERP0_POP_FULL (*(volatile uint32_t *)0xd000009c)
   SIO_INTERP0_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d000009c#);
   -- #define SIO_INTERP0_PEEK_LANE0 (*(volatile uint32_t *)0xd00000a0)
   SIO_INTERP0_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000a0#);
   -- #define SIO_INTERP0_PEEK_LANE1 (*(volatile uint32_t *)0xd00000a4)
   SIO_INTERP0_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000a4#);
   -- #define SIO_INTERP0_PEEK_FULL (*(volatile uint32_t *)0xd00000a8)
   SIO_INTERP0_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000a8#);
   -- #define SIO_INTERP0_CTRL_LANE0 (*(volatile uint32_t *)0xd00000ac)
   SIO_INTERP0_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000ac#);
   -- #define SIO_INTERP0_CTRL_LANE1 (*(volatile uint32_t *)0xd00000b0)
   SIO_INTERP0_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000b0#);
   -- #define SIO_INTERP0_ACCUM0_ADD (*(volatile uint32_t *)0xd00000b4)
   SIO_INTERP0_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000b4#);
   -- #define SIO_INTERP0_ACCUM1_ADD (*(volatile uint32_t *)0xd00000b8)
   SIO_INTERP0_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000b8#);
   -- #define SIO_INTERP0_BASE_1AND0 (*(volatile uint32_t *)0xd00000bc)
   SIO_INTERP0_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000bc#);
   -- #define SIO_INTERP1_ACCUM0 (*(volatile uint32_t *)0xd00000c0)
   SIO_INTERP1_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000c0#);
   -- #define SIO_INTERP1_ACCUM1 (*(volatile uint32_t *)0xd00000c4)
   SIO_INTERP1_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000c4#);
   -- #define SIO_INTERP1_BASE0 (*(volatile uint32_t *)0xd00000c8)
   SIO_INTERP1_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000c8#);
   -- #define SIO_INTERP1_BASE1 (*(volatile uint32_t *)0xd00000cc)
   SIO_INTERP1_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000cc#);
   -- #define SIO_INTERP1_BASE2 (*(volatile uint32_t *)0xd00000d0)
   SIO_INTERP1_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000d0#);
   -- #define SIO_INTERP1_POP_LANE0 (*(volatile uint32_t *)0xd00000d4)
   SIO_INTERP1_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000d4#);
   -- #define SIO_INTERP1_POP_LANE1 (*(volatile uint32_t *)0xd00000d8)
   SIO_INTERP1_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000d8#);
   -- #define SIO_INTERP1_POP_FULL (*(volatile uint32_t *)0xd00000dc)
   SIO_INTERP1_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000dc#);
   -- #define SIO_INTERP1_PEEK_LANE0 (*(volatile uint32_t *)0xd00000e0)
   SIO_INTERP1_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000e0#);
   -- #define SIO_INTERP1_PEEK_LANE1 (*(volatile uint32_t *)0xd00000e4)
   SIO_INTERP1_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000e4#);
   -- #define SIO_INTERP1_PEEK_FULL (*(volatile uint32_t *)0xd00000e8)
   SIO_INTERP1_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000e8#);
   -- #define SIO_INTERP1_CTRL_LANE0 (*(volatile uint32_t *)0xd00000ec)
   SIO_INTERP1_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000ec#);
   -- #define SIO_INTERP1_CTRL_LANE1 (*(volatile uint32_t *)0xd00000f0)
   SIO_INTERP1_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000f0#);
   -- #define SIO_INTERP1_ACCUM0_ADD (*(volatile uint32_t *)0xd00000f4)
   SIO_INTERP1_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000f4#);
   -- #define SIO_INTERP1_ACCUM1_ADD (*(volatile uint32_t *)0xd00000f8)
   SIO_INTERP1_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000f8#);
   -- #define SIO_INTERP1_BASE_1AND0 (*(volatile uint32_t *)0xd00000fc)
   SIO_INTERP1_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000fc#);
   -- #define SIO_SPINLOCK0 (*(volatile uint32_t *)0xd0000100)
   SIO_SPINLOCK0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000100#);
   -- #define SIO_SPINLOCK1 (*(volatile uint32_t *)0xd0000104)
   SIO_SPINLOCK1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000104#);
   -- #define SIO_SPINLOCK2 (*(volatile uint32_t *)0xd0000108)
   SIO_SPINLOCK2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000108#);
   -- #define SIO_SPINLOCK3 (*(volatile uint32_t *)0xd000010c)
   SIO_SPINLOCK3 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000010c#);
   -- #define SIO_SPINLOCK4 (*(volatile uint32_t *)0xd0000110)
   SIO_SPINLOCK4 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000110#);
   -- #define SIO_SPINLOCK5 (*(volatile uint32_t *)0xd0000114)
   SIO_SPINLOCK5 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000114#);
   -- #define SIO_SPINLOCK6 (*(volatile uint32_t *)0xd0000118)
   SIO_SPINLOCK6 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000118#);
   -- #define SIO_SPINLOCK7 (*(volatile uint32_t *)0xd000011c)
   SIO_SPINLOCK7 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000011c#);
   -- #define SIO_SPINLOCK8 (*(volatile uint32_t *)0xd0000120)
   SIO_SPINLOCK8 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000120#);
   -- #define SIO_SPINLOCK9 (*(volatile uint32_t *)0xd0000124)
   SIO_SPINLOCK9 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000124#);
   -- #define SIO_SPINLOCK10 (*(volatile uint32_t *)0xd0000128)
   SIO_SPINLOCK10 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000128#);
   -- #define SIO_SPINLOCK11 (*(volatile uint32_t *)0xd000012c)
   SIO_SPINLOCK11 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000012c#);
   -- #define SIO_SPINLOCK12 (*(volatile uint32_t *)0xd0000130)
   SIO_SPINLOCK12 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000130#);
   -- #define SIO_SPINLOCK13 (*(volatile uint32_t *)0xd0000134)
   SIO_SPINLOCK13 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000134#);
   -- #define SIO_SPINLOCK14 (*(volatile uint32_t *)0xd0000138)
   SIO_SPINLOCK14 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000138#);
   -- #define SIO_SPINLOCK15 (*(volatile uint32_t *)0xd000013c)
   SIO_SPINLOCK15 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000013c#);
   -- #define SIO_SPINLOCK16 (*(volatile uint32_t *)0xd0000140)
   SIO_SPINLOCK16 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000140#);
   -- #define SIO_SPINLOCK17 (*(volatile uint32_t *)0xd0000144)
   SIO_SPINLOCK17 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000144#);
   -- #define SIO_SPINLOCK18 (*(volatile uint32_t *)0xd0000148)
   SIO_SPINLOCK18 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000148#);
   -- #define SIO_SPINLOCK19 (*(volatile uint32_t *)0xd000014c)
   SIO_SPINLOCK19 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000014c#);
   -- #define SIO_SPINLOCK20 (*(volatile uint32_t *)0xd0000150)
   SIO_SPINLOCK20 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000150#);
   -- #define SIO_SPINLOCK21 (*(volatile uint32_t *)0xd0000154)
   SIO_SPINLOCK21 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000154#);
   -- #define SIO_SPINLOCK22 (*(volatile uint32_t *)0xd0000158)
   SIO_SPINLOCK22 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000158#);
   -- #define SIO_SPINLOCK23 (*(volatile uint32_t *)0xd000015c)
   SIO_SPINLOCK23 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000015c#);
   -- #define SIO_SPINLOCK24 (*(volatile uint32_t *)0xd0000160)
   SIO_SPINLOCK24 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000160#);
   -- #define SIO_SPINLOCK25 (*(volatile uint32_t *)0xd0000164)
   SIO_SPINLOCK25 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000164#);
   -- #define SIO_SPINLOCK26 (*(volatile uint32_t *)0xd0000168)
   SIO_SPINLOCK26 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000168#);
   -- #define SIO_SPINLOCK27 (*(volatile uint32_t *)0xd000016c)
   SIO_SPINLOCK27 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000016c#);
   -- #define SIO_SPINLOCK28 (*(volatile uint32_t *)0xd0000170)
   SIO_SPINLOCK28 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000170#);
   -- #define SIO_SPINLOCK29 (*(volatile uint32_t *)0xd0000174)
   SIO_SPINLOCK29 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000174#);
   -- #define SIO_SPINLOCK30 (*(volatile uint32_t *)0xd0000178)
   SIO_SPINLOCK30 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000178#);
   -- #define SIO_SPINLOCK31 (*(volatile uint32_t *)0xd000017c)
   SIO_SPINLOCK31 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000017c#);
   -- #define SIO_DOORBELL_OUT_SET (*(volatile uint32_t *)0xd0000180)
   SIO_DOORBELL_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000180#);
   -- #define SIO_DOORBELL_OUT_CLR (*(volatile uint32_t *)0xd0000184)
   SIO_DOORBELL_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000184#);
   -- #define SIO_DOORBELL_IN_SET (*(volatile uint32_t *)0xd0000188)
   SIO_DOORBELL_IN_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000188#);
   -- #define SIO_DOORBELL_IN_CLR (*(volatile uint32_t *)0xd000018c)
   SIO_DOORBELL_IN_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d000018c#);
   -- #define SIO_PERI_NONSEC (*(volatile uint32_t *)0xd0000190)
   SIO_PERI_NONSEC : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000190#);
   -- #define SIO_RISCV_SOFTIRQ (*(volatile uint32_t *)0xd00001a0)
   SIO_RISCV_SOFTIRQ : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001a0#);
   -- #define SIO_MTIME_CTRL (*(volatile uint32_t *)0xd00001a4)
   SIO_MTIME_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001a4#);
   -- #define SIO_MTIME (*(volatile uint32_t *)0xd00001b0)
   SIO_MTIME : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001b0#);
   -- #define SIO_MTIMEH (*(volatile uint32_t *)0xd00001b4)
   SIO_MTIMEH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001b4#);
   -- #define SIO_MTIMECMP (*(volatile uint32_t *)0xd00001b8)
   SIO_MTIMECMP : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001b8#);
   -- #define SIO_MTIMECMPH (*(volatile uint32_t *)0xd00001bc)
   SIO_MTIMECMPH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001bc#);
   -- #define SIO_TMDS_CTRL (*(volatile uint32_t *)0xd00001c0)
   SIO_TMDS_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001c0#);
   -- #define SIO_TMDS_WDATA (*(volatile uint32_t *)0xd00001c4)
   SIO_TMDS_WDATA : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001c4#);
   -- #define SIO_TMDS_PEEK_SINGLE (*(volatile uint32_t *)0xd00001c8)
   SIO_TMDS_PEEK_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001c8#);
   -- #define SIO_TMDS_POP_SINGLE (*(volatile uint32_t *)0xd00001cc)
   SIO_TMDS_POP_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001cc#);
   -- #define SIO_TMDS_PEEK_DOUBLE_L0 (*(volatile uint32_t *)0xd00001d0)
   SIO_TMDS_PEEK_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001d0#);
   -- #define SIO_TMDS_POP_DOUBLE_L0 (*(volatile uint32_t *)0xd00001d4)
   SIO_TMDS_POP_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001d4#);
   -- #define SIO_TMDS_PEEK_DOUBLE_L1 (*(volatile uint32_t *)0xd00001d8)
   SIO_TMDS_PEEK_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001d8#);
   -- #define SIO_TMDS_POP_DOUBLE_L1 (*(volatile uint32_t *)0xd00001dc)
   SIO_TMDS_POP_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001dc#);
   -- #define SIO_TMDS_PEEK_DOUBLE_L2 (*(volatile uint32_t *)0xd00001e0)
   SIO_TMDS_PEEK_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001e0#);
   -- #define SIO_TMDS_POP_DOUBLE_L2 (*(volatile uint32_t *)0xd00001e4)
   SIO_TMDS_POP_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001e4#);
   -- #define SIO_NONSEC_CPUID (*(volatile uint32_t *)0xd0020000)
   SIO_NONSEC_CPUID : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020000#);
   -- #define SIO_NONSEC_GPIO_IN (*(volatile uint32_t *)0xd0020004)
   SIO_NONSEC_GPIO_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020004#);
   -- #define SIO_NONSEC_GPIO_HI_IN (*(volatile uint32_t *)0xd0020008)
   SIO_NONSEC_GPIO_HI_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020008#);
   -- #define SIO_NONSEC_GPIO_OUT (*(volatile uint32_t *)0xd0020010)
   SIO_NONSEC_GPIO_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020010#);
   -- #define SIO_NONSEC_GPIO_HI_OUT (*(volatile uint32_t *)0xd0020014)
   SIO_NONSEC_GPIO_HI_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020014#);
   -- #define SIO_NONSEC_GPIO_OUT_SET (*(volatile uint32_t *)0xd0020018)
   SIO_NONSEC_GPIO_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020018#);
   -- #define SIO_NONSEC_GPIO_HI_OUT_SET (*(volatile uint32_t *)0xd002001c)
   SIO_NONSEC_GPIO_HI_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d002001c#);
   -- #define SIO_NONSEC_GPIO_OUT_CLR (*(volatile uint32_t *)0xd0020020)
   SIO_NONSEC_GPIO_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020020#);
   -- #define SIO_NONSEC_GPIO_HI_OUT_CLR (*(volatile uint32_t *)0xd0020024)
   SIO_NONSEC_GPIO_HI_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020024#);
   -- #define SIO_NONSEC_GPIO_OUT_XOR (*(volatile uint32_t *)0xd0020028)
   SIO_NONSEC_GPIO_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020028#);
   -- #define SIO_NONSEC_GPIO_HI_OUT_XOR (*(volatile uint32_t *)0xd002002c)
   SIO_NONSEC_GPIO_HI_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d002002c#);
   -- #define SIO_NONSEC_GPIO_OE (*(volatile uint32_t *)0xd0020030)
   SIO_NONSEC_GPIO_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020030#);
   -- #define SIO_NONSEC_GPIO_HI_OE (*(volatile uint32_t *)0xd0020034)
   SIO_NONSEC_GPIO_HI_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020034#);
   -- #define SIO_NONSEC_GPIO_OE_SET (*(volatile uint32_t *)0xd0020038)
   SIO_NONSEC_GPIO_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020038#);
   -- #define SIO_NONSEC_GPIO_HI_OE_SET (*(volatile uint32_t *)0xd002003c)
   SIO_NONSEC_GPIO_HI_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d002003c#);
   -- #define SIO_NONSEC_GPIO_OE_CLR (*(volatile uint32_t *)0xd0020040)
   SIO_NONSEC_GPIO_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020040#);
   -- #define SIO_NONSEC_GPIO_HI_OE_CLR (*(volatile uint32_t *)0xd0020044)
   SIO_NONSEC_GPIO_HI_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020044#);
   -- #define SIO_NONSEC_GPIO_OE_XOR (*(volatile uint32_t *)0xd0020048)
   SIO_NONSEC_GPIO_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020048#);
   -- #define SIO_NONSEC_GPIO_HI_OE_XOR (*(volatile uint32_t *)0xd002004c)
   SIO_NONSEC_GPIO_HI_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d002004c#);
   -- #define SIO_NONSEC_FIFO_ST (*(volatile uint32_t *)0xd0020050)
   SIO_NONSEC_FIFO_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020050#);
   -- #define SIO_NONSEC_FIFO_WR (*(volatile uint32_t *)0xd0020054)
   SIO_NONSEC_FIFO_WR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020054#);
   -- #define SIO_NONSEC_FIFO_RD (*(volatile uint32_t *)0xd0020058)
   SIO_NONSEC_FIFO_RD : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020058#);
   -- #define SIO_NONSEC_SPINLOCK_ST (*(volatile uint32_t *)0xd002005c)
   SIO_NONSEC_SPINLOCK_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d002005c#);
   -- #define SIO_NONSEC_INTERP0_ACCUM0 (*(volatile uint32_t *)0xd0020080)
   SIO_NONSEC_INTERP0_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020080#);
   -- #define SIO_NONSEC_INTERP0_ACCUM1 (*(volatile uint32_t *)0xd0020084)
   SIO_NONSEC_INTERP0_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020084#);
   -- #define SIO_NONSEC_INTERP0_BASE0 (*(volatile uint32_t *)0xd0020088)
   SIO_NONSEC_INTERP0_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020088#);
   -- #define SIO_NONSEC_INTERP0_BASE1 (*(volatile uint32_t *)0xd002008c)
   SIO_NONSEC_INTERP0_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002008c#);
   -- #define SIO_NONSEC_INTERP0_BASE2 (*(volatile uint32_t *)0xd0020090)
   SIO_NONSEC_INTERP0_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020090#);
   -- #define SIO_NONSEC_INTERP0_POP_LANE0 (*(volatile uint32_t *)0xd0020094)
   SIO_NONSEC_INTERP0_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020094#);
   -- #define SIO_NONSEC_INTERP0_POP_LANE1 (*(volatile uint32_t *)0xd0020098)
   SIO_NONSEC_INTERP0_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020098#);
   -- #define SIO_NONSEC_INTERP0_POP_FULL (*(volatile uint32_t *)0xd002009c)
   SIO_NONSEC_INTERP0_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d002009c#);
   -- #define SIO_NONSEC_INTERP0_PEEK_LANE0 (*(volatile uint32_t *)0xd00200a0)
   SIO_NONSEC_INTERP0_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200a0#);
   -- #define SIO_NONSEC_INTERP0_PEEK_LANE1 (*(volatile uint32_t *)0xd00200a4)
   SIO_NONSEC_INTERP0_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200a4#);
   -- #define SIO_NONSEC_INTERP0_PEEK_FULL (*(volatile uint32_t *)0xd00200a8)
   SIO_NONSEC_INTERP0_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200a8#);
   -- #define SIO_NONSEC_INTERP0_CTRL_LANE0 (*(volatile uint32_t *)0xd00200ac)
   SIO_NONSEC_INTERP0_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200ac#);
   -- #define SIO_NONSEC_INTERP0_CTRL_LANE1 (*(volatile uint32_t *)0xd00200b0)
   SIO_NONSEC_INTERP0_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200b0#);
   -- #define SIO_NONSEC_INTERP0_ACCUM0_ADD (*(volatile uint32_t *)0xd00200b4)
   SIO_NONSEC_INTERP0_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200b4#);
   -- #define SIO_NONSEC_INTERP0_ACCUM1_ADD (*(volatile uint32_t *)0xd00200b8)
   SIO_NONSEC_INTERP0_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200b8#);
   -- #define SIO_NONSEC_INTERP0_BASE_1AND0 (*(volatile uint32_t *)0xd00200bc)
   SIO_NONSEC_INTERP0_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200bc#);
   -- #define SIO_NONSEC_INTERP1_ACCUM0 (*(volatile uint32_t *)0xd00200c0)
   SIO_NONSEC_INTERP1_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200c0#);
   -- #define SIO_NONSEC_INTERP1_ACCUM1 (*(volatile uint32_t *)0xd00200c4)
   SIO_NONSEC_INTERP1_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200c4#);
   -- #define SIO_NONSEC_INTERP1_BASE0 (*(volatile uint32_t *)0xd00200c8)
   SIO_NONSEC_INTERP1_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200c8#);
   -- #define SIO_NONSEC_INTERP1_BASE1 (*(volatile uint32_t *)0xd00200cc)
   SIO_NONSEC_INTERP1_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200cc#);
   -- #define SIO_NONSEC_INTERP1_BASE2 (*(volatile uint32_t *)0xd00200d0)
   SIO_NONSEC_INTERP1_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200d0#);
   -- #define SIO_NONSEC_INTERP1_POP_LANE0 (*(volatile uint32_t *)0xd00200d4)
   SIO_NONSEC_INTERP1_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200d4#);
   -- #define SIO_NONSEC_INTERP1_POP_LANE1 (*(volatile uint32_t *)0xd00200d8)
   SIO_NONSEC_INTERP1_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200d8#);
   -- #define SIO_NONSEC_INTERP1_POP_FULL (*(volatile uint32_t *)0xd00200dc)
   SIO_NONSEC_INTERP1_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200dc#);
   -- #define SIO_NONSEC_INTERP1_PEEK_LANE0 (*(volatile uint32_t *)0xd00200e0)
   SIO_NONSEC_INTERP1_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200e0#);
   -- #define SIO_NONSEC_INTERP1_PEEK_LANE1 (*(volatile uint32_t *)0xd00200e4)
   SIO_NONSEC_INTERP1_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200e4#);
   -- #define SIO_NONSEC_INTERP1_PEEK_FULL (*(volatile uint32_t *)0xd00200e8)
   SIO_NONSEC_INTERP1_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200e8#);
   -- #define SIO_NONSEC_INTERP1_CTRL_LANE0 (*(volatile uint32_t *)0xd00200ec)
   SIO_NONSEC_INTERP1_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200ec#);
   -- #define SIO_NONSEC_INTERP1_CTRL_LANE1 (*(volatile uint32_t *)0xd00200f0)
   SIO_NONSEC_INTERP1_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200f0#);
   -- #define SIO_NONSEC_INTERP1_ACCUM0_ADD (*(volatile uint32_t *)0xd00200f4)
   SIO_NONSEC_INTERP1_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200f4#);
   -- #define SIO_NONSEC_INTERP1_ACCUM1_ADD (*(volatile uint32_t *)0xd00200f8)
   SIO_NONSEC_INTERP1_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200f8#);
   -- #define SIO_NONSEC_INTERP1_BASE_1AND0 (*(volatile uint32_t *)0xd00200fc)
   SIO_NONSEC_INTERP1_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200fc#);
   -- #define SIO_NONSEC_SPINLOCK0 (*(volatile uint32_t *)0xd0020100)
   SIO_NONSEC_SPINLOCK0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020100#);
   -- #define SIO_NONSEC_SPINLOCK1 (*(volatile uint32_t *)0xd0020104)
   SIO_NONSEC_SPINLOCK1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020104#);
   -- #define SIO_NONSEC_SPINLOCK2 (*(volatile uint32_t *)0xd0020108)
   SIO_NONSEC_SPINLOCK2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020108#);
   -- #define SIO_NONSEC_SPINLOCK3 (*(volatile uint32_t *)0xd002010c)
   SIO_NONSEC_SPINLOCK3 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002010c#);
   -- #define SIO_NONSEC_SPINLOCK4 (*(volatile uint32_t *)0xd0020110)
   SIO_NONSEC_SPINLOCK4 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020110#);
   -- #define SIO_NONSEC_SPINLOCK5 (*(volatile uint32_t *)0xd0020114)
   SIO_NONSEC_SPINLOCK5 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020114#);
   -- #define SIO_NONSEC_SPINLOCK6 (*(volatile uint32_t *)0xd0020118)
   SIO_NONSEC_SPINLOCK6 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020118#);
   -- #define SIO_NONSEC_SPINLOCK7 (*(volatile uint32_t *)0xd002011c)
   SIO_NONSEC_SPINLOCK7 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002011c#);
   -- #define SIO_NONSEC_SPINLOCK8 (*(volatile uint32_t *)0xd0020120)
   SIO_NONSEC_SPINLOCK8 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020120#);
   -- #define SIO_NONSEC_SPINLOCK9 (*(volatile uint32_t *)0xd0020124)
   SIO_NONSEC_SPINLOCK9 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020124#);
   -- #define SIO_NONSEC_SPINLOCK10 (*(volatile uint32_t *)0xd0020128)
   SIO_NONSEC_SPINLOCK10 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020128#);
   -- #define SIO_NONSEC_SPINLOCK11 (*(volatile uint32_t *)0xd002012c)
   SIO_NONSEC_SPINLOCK11 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002012c#);
   -- #define SIO_NONSEC_SPINLOCK12 (*(volatile uint32_t *)0xd0020130)
   SIO_NONSEC_SPINLOCK12 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020130#);
   -- #define SIO_NONSEC_SPINLOCK13 (*(volatile uint32_t *)0xd0020134)
   SIO_NONSEC_SPINLOCK13 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020134#);
   -- #define SIO_NONSEC_SPINLOCK14 (*(volatile uint32_t *)0xd0020138)
   SIO_NONSEC_SPINLOCK14 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020138#);
   -- #define SIO_NONSEC_SPINLOCK15 (*(volatile uint32_t *)0xd002013c)
   SIO_NONSEC_SPINLOCK15 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002013c#);
   -- #define SIO_NONSEC_SPINLOCK16 (*(volatile uint32_t *)0xd0020140)
   SIO_NONSEC_SPINLOCK16 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020140#);
   -- #define SIO_NONSEC_SPINLOCK17 (*(volatile uint32_t *)0xd0020144)
   SIO_NONSEC_SPINLOCK17 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020144#);
   -- #define SIO_NONSEC_SPINLOCK18 (*(volatile uint32_t *)0xd0020148)
   SIO_NONSEC_SPINLOCK18 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020148#);
   -- #define SIO_NONSEC_SPINLOCK19 (*(volatile uint32_t *)0xd002014c)
   SIO_NONSEC_SPINLOCK19 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002014c#);
   -- #define SIO_NONSEC_SPINLOCK20 (*(volatile uint32_t *)0xd0020150)
   SIO_NONSEC_SPINLOCK20 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020150#);
   -- #define SIO_NONSEC_SPINLOCK21 (*(volatile uint32_t *)0xd0020154)
   SIO_NONSEC_SPINLOCK21 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020154#);
   -- #define SIO_NONSEC_SPINLOCK22 (*(volatile uint32_t *)0xd0020158)
   SIO_NONSEC_SPINLOCK22 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020158#);
   -- #define SIO_NONSEC_SPINLOCK23 (*(volatile uint32_t *)0xd002015c)
   SIO_NONSEC_SPINLOCK23 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002015c#);
   -- #define SIO_NONSEC_SPINLOCK24 (*(volatile uint32_t *)0xd0020160)
   SIO_NONSEC_SPINLOCK24 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020160#);
   -- #define SIO_NONSEC_SPINLOCK25 (*(volatile uint32_t *)0xd0020164)
   SIO_NONSEC_SPINLOCK25 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020164#);
   -- #define SIO_NONSEC_SPINLOCK26 (*(volatile uint32_t *)0xd0020168)
   SIO_NONSEC_SPINLOCK26 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020168#);
   -- #define SIO_NONSEC_SPINLOCK27 (*(volatile uint32_t *)0xd002016c)
   SIO_NONSEC_SPINLOCK27 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002016c#);
   -- #define SIO_NONSEC_SPINLOCK28 (*(volatile uint32_t *)0xd0020170)
   SIO_NONSEC_SPINLOCK28 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020170#);
   -- #define SIO_NONSEC_SPINLOCK29 (*(volatile uint32_t *)0xd0020174)
   SIO_NONSEC_SPINLOCK29 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020174#);
   -- #define SIO_NONSEC_SPINLOCK30 (*(volatile uint32_t *)0xd0020178)
   SIO_NONSEC_SPINLOCK30 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020178#);
   -- #define SIO_NONSEC_SPINLOCK31 (*(volatile uint32_t *)0xd002017c)
   SIO_NONSEC_SPINLOCK31 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002017c#);
   -- #define SIO_NONSEC_DOORBELL_OUT_SET (*(volatile uint32_t *)0xd0020180)
   SIO_NONSEC_DOORBELL_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020180#);
   -- #define SIO_NONSEC_DOORBELL_OUT_CLR (*(volatile uint32_t *)0xd0020184)
   SIO_NONSEC_DOORBELL_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020184#);
   -- #define SIO_NONSEC_DOORBELL_IN_SET (*(volatile uint32_t *)0xd0020188)
   SIO_NONSEC_DOORBELL_IN_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020188#);
   -- #define SIO_NONSEC_DOORBELL_IN_CLR (*(volatile uint32_t *)0xd002018c)
   SIO_NONSEC_DOORBELL_IN_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d002018c#);
   -- #define SIO_NONSEC_PERI_NONSEC (*(volatile uint32_t *)0xd0020190)
   SIO_NONSEC_PERI_NONSEC : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020190#);
   -- #define SIO_NONSEC_RISCV_SOFTIRQ (*(volatile uint32_t *)0xd00201a0)
   SIO_NONSEC_RISCV_SOFTIRQ : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201a0#);
   -- #define SIO_NONSEC_MTIME_CTRL (*(volatile uint32_t *)0xd00201a4)
   SIO_NONSEC_MTIME_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201a4#);
   -- #define SIO_NONSEC_MTIME (*(volatile uint32_t *)0xd00201b0)
   SIO_NONSEC_MTIME : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201b0#);
   -- #define SIO_NONSEC_MTIMEH (*(volatile uint32_t *)0xd00201b4)
   SIO_NONSEC_MTIMEH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201b4#);
   -- #define SIO_NONSEC_MTIMECMP (*(volatile uint32_t *)0xd00201b8)
   SIO_NONSEC_MTIMECMP : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201b8#);
   -- #define SIO_NONSEC_MTIMECMPH (*(volatile uint32_t *)0xd00201bc)
   SIO_NONSEC_MTIMECMPH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201bc#);
   -- #define SIO_NONSEC_TMDS_CTRL (*(volatile uint32_t *)0xd00201c0)
   SIO_NONSEC_TMDS_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201c0#);
   -- #define SIO_NONSEC_TMDS_WDATA (*(volatile uint32_t *)0xd00201c4)
   SIO_NONSEC_TMDS_WDATA : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201c4#);
   -- #define SIO_NONSEC_TMDS_PEEK_SINGLE (*(volatile uint32_t *)0xd00201c8)
   SIO_NONSEC_TMDS_PEEK_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201c8#);
   -- #define SIO_NONSEC_TMDS_POP_SINGLE (*(volatile uint32_t *)0xd00201cc)
   SIO_NONSEC_TMDS_POP_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201cc#);
   -- #define SIO_NONSEC_TMDS_PEEK_DOUBLE_L0 (*(volatile uint32_t *)0xd00201d0)
   SIO_NONSEC_TMDS_PEEK_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201d0#);
   -- #define SIO_NONSEC_TMDS_POP_DOUBLE_L0 (*(volatile uint32_t *)0xd00201d4)
   SIO_NONSEC_TMDS_POP_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201d4#);
   -- #define SIO_NONSEC_TMDS_PEEK_DOUBLE_L1 (*(volatile uint32_t *)0xd00201d8)
   SIO_NONSEC_TMDS_PEEK_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201d8#);
   -- #define SIO_NONSEC_TMDS_POP_DOUBLE_L1 (*(volatile uint32_t *)0xd00201dc)
   SIO_NONSEC_TMDS_POP_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201dc#);
   -- #define SIO_NONSEC_TMDS_PEEK_DOUBLE_L2 (*(volatile uint32_t *)0xd00201e0)
   SIO_NONSEC_TMDS_PEEK_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201e0#);
   -- #define SIO_NONSEC_TMDS_POP_DOUBLE_L2 (*(volatile uint32_t *)0xd00201e4)
   SIO_NONSEC_TMDS_POP_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201e4#);

   -- --  CPUID Register macros


   -- --  GPIO_IN Register macros


   -- --  GPIO_HI_IN Register macros

   -- #define SIO_GPIO_HI_IN_QSPI_SD(v) (((v)&0xf)<<28)
   function SIO_GPIO_HI_IN_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   -- #define SIO_GPIO_HI_IN_QSPI_SD_MASK SIO_GPIO_HI_IN_QSPI_SD(ALL1)
   SIO_GPIO_HI_IN_QSPI_SD_MASK : constant uint32_t := SIO_GPIO_HI_IN_QSPI_SD (ALL1);
   -- #define SIO_GPIO_HI_IN_QSPI_CSN(v) (((v)&0x1)<<27)
   function SIO_GPIO_HI_IN_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   -- #define SIO_GPIO_HI_IN_QSPI_CSN_MASK SIO_GPIO_HI_IN_QSPI_CSN(ALL1)
   SIO_GPIO_HI_IN_QSPI_CSN_MASK : constant uint32_t := SIO_GPIO_HI_IN_QSPI_CSN (ALL1);
   -- #define SIO_GPIO_HI_IN_QSPI_SCK(v) (((v)&0x1)<<26)
   function SIO_GPIO_HI_IN_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   -- #define SIO_GPIO_HI_IN_QSPI_SCK_MASK SIO_GPIO_HI_IN_QSPI_SCK(ALL1)
   SIO_GPIO_HI_IN_QSPI_SCK_MASK : constant uint32_t := SIO_GPIO_HI_IN_QSPI_SCK (ALL1);
   -- #define SIO_GPIO_HI_IN_USB_DM(v) (((v)&0x1)<<25)
   function SIO_GPIO_HI_IN_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   -- #define SIO_GPIO_HI_IN_USB_DM_MASK SIO_GPIO_HI_IN_USB_DM(ALL1)
   SIO_GPIO_HI_IN_USB_DM_MASK : constant uint32_t := SIO_GPIO_HI_IN_USB_DM (ALL1);
   -- #define SIO_GPIO_HI_IN_USB_DP(v) (((v)&0x1)<<24)
   function SIO_GPIO_HI_IN_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   -- #define SIO_GPIO_HI_IN_USB_DP_MASK SIO_GPIO_HI_IN_USB_DP(ALL1)
   SIO_GPIO_HI_IN_USB_DP_MASK : constant uint32_t := SIO_GPIO_HI_IN_USB_DP (ALL1);
   -- #define SIO_GPIO_HI_IN_GPIO(v) (((v)&0xffff)<<0)
   function SIO_GPIO_HI_IN_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   -- #define SIO_GPIO_HI_IN_GPIO_MASK SIO_GPIO_HI_IN_GPIO(ALL1)
   SIO_GPIO_HI_IN_GPIO_MASK : constant uint32_t := SIO_GPIO_HI_IN_GPIO (ALL1);

   -- --  GPIO_OUT Register macros


   -- --  GPIO_HI_OUT Register macros

   -- #define SIO_GPIO_HI_OUT_QSPI_SD(v) (((v)&0xf)<<28)
   function SIO_GPIO_HI_OUT_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   -- #define SIO_GPIO_HI_OUT_QSPI_SD_MASK SIO_GPIO_HI_OUT_QSPI_SD(ALL1)
   SIO_GPIO_HI_OUT_QSPI_SD_MASK : constant uint32_t := SIO_GPIO_HI_OUT_QSPI_SD (ALL1);
   -- #define SIO_GPIO_HI_OUT_QSPI_CSN(v) (((v)&0x1)<<27)
   function SIO_GPIO_HI_OUT_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   -- #define SIO_GPIO_HI_OUT_QSPI_CSN_MASK SIO_GPIO_HI_OUT_QSPI_CSN(ALL1)
   SIO_GPIO_HI_OUT_QSPI_CSN_MASK : constant uint32_t := SIO_GPIO_HI_OUT_QSPI_CSN (ALL1);
   -- #define SIO_GPIO_HI_OUT_QSPI_SCK(v) (((v)&0x1)<<26)
   function SIO_GPIO_HI_OUT_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   -- #define SIO_GPIO_HI_OUT_QSPI_SCK_MASK SIO_GPIO_HI_OUT_QSPI_SCK(ALL1)
   SIO_GPIO_HI_OUT_QSPI_SCK_MASK : constant uint32_t := SIO_GPIO_HI_OUT_QSPI_SCK (ALL1);
   -- #define SIO_GPIO_HI_OUT_USB_DM(v) (((v)&0x1)<<25)
   function SIO_GPIO_HI_OUT_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   -- #define SIO_GPIO_HI_OUT_USB_DM_MASK SIO_GPIO_HI_OUT_USB_DM(ALL1)
   SIO_GPIO_HI_OUT_USB_DM_MASK : constant uint32_t := SIO_GPIO_HI_OUT_USB_DM (ALL1);
   -- #define SIO_GPIO_HI_OUT_USB_DP(v) (((v)&0x1)<<24)
   function SIO_GPIO_HI_OUT_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   -- #define SIO_GPIO_HI_OUT_USB_DP_MASK SIO_GPIO_HI_OUT_USB_DP(ALL1)
   SIO_GPIO_HI_OUT_USB_DP_MASK : constant uint32_t := SIO_GPIO_HI_OUT_USB_DP (ALL1);
   -- #define SIO_GPIO_HI_OUT_GPIO(v) (((v)&0xffff)<<0)
   function SIO_GPIO_HI_OUT_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   -- #define SIO_GPIO_HI_OUT_GPIO_MASK SIO_GPIO_HI_OUT_GPIO(ALL1)
   SIO_GPIO_HI_OUT_GPIO_MASK : constant uint32_t := SIO_GPIO_HI_OUT_GPIO (ALL1);
   -- #define SIO_GPIO_HI_OUT_SET_QSPI_SD(v) (((v)&0xf)<<28)
   function SIO_GPIO_HI_OUT_SET_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   -- #define SIO_GPIO_HI_OUT_SET_QSPI_SD_MASK SIO_GPIO_HI_OUT_SET_QSPI_SD(ALL1)
   SIO_GPIO_HI_OUT_SET_QSPI_SD_MASK : constant uint32_t := SIO_GPIO_HI_OUT_SET_QSPI_SD (ALL1);
   -- #define SIO_GPIO_HI_OUT_SET_QSPI_CSN(v) (((v)&0x1)<<27)
   function SIO_GPIO_HI_OUT_SET_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   -- #define SIO_GPIO_HI_OUT_SET_QSPI_CSN_MASK SIO_GPIO_HI_OUT_SET_QSPI_CSN(ALL1)
   SIO_GPIO_HI_OUT_SET_QSPI_CSN_MASK : constant uint32_t := SIO_GPIO_HI_OUT_SET_QSPI_CSN (ALL1);
   -- #define SIO_GPIO_HI_OUT_SET_QSPI_SCK(v) (((v)&0x1)<<26)
   function SIO_GPIO_HI_OUT_SET_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   -- #define SIO_GPIO_HI_OUT_SET_QSPI_SCK_MASK SIO_GPIO_HI_OUT_SET_QSPI_SCK(ALL1)
   SIO_GPIO_HI_OUT_SET_QSPI_SCK_MASK : constant uint32_t := SIO_GPIO_HI_OUT_SET_QSPI_SCK (ALL1);
   -- #define SIO_GPIO_HI_OUT_SET_USB_DM(v) (((v)&0x1)<<25)
   function SIO_GPIO_HI_OUT_SET_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   -- #define SIO_GPIO_HI_OUT_SET_USB_DM_MASK SIO_GPIO_HI_OUT_SET_USB_DM(ALL1)
   SIO_GPIO_HI_OUT_SET_USB_DM_MASK : constant uint32_t := SIO_GPIO_HI_OUT_SET_USB_DM (ALL1);
   -- #define SIO_GPIO_HI_OUT_SET_USB_DP(v) (((v)&0x1)<<24)
   function SIO_GPIO_HI_OUT_SET_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   -- #define SIO_GPIO_HI_OUT_SET_USB_DP_MASK SIO_GPIO_HI_OUT_SET_USB_DP(ALL1)
   SIO_GPIO_HI_OUT_SET_USB_DP_MASK : constant uint32_t := SIO_GPIO_HI_OUT_SET_USB_DP (ALL1);
   -- #define SIO_GPIO_HI_OUT_SET_GPIO(v) (((v)&0xffff)<<0)
   function SIO_GPIO_HI_OUT_SET_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   -- #define SIO_GPIO_HI_OUT_SET_GPIO_MASK SIO_GPIO_HI_OUT_SET_GPIO(ALL1)
   SIO_GPIO_HI_OUT_SET_GPIO_MASK : constant uint32_t := SIO_GPIO_HI_OUT_SET_GPIO (ALL1);
   -- #define SIO_GPIO_HI_OUT_CLR_QSPI_SD(v) (((v)&0xf)<<28)
   function SIO_GPIO_HI_OUT_CLR_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   -- #define SIO_GPIO_HI_OUT_CLR_QSPI_SD_MASK SIO_GPIO_HI_OUT_CLR_QSPI_SD(ALL1)
   SIO_GPIO_HI_OUT_CLR_QSPI_SD_MASK : constant uint32_t := SIO_GPIO_HI_OUT_CLR_QSPI_SD (ALL1);
   -- #define SIO_GPIO_HI_OUT_CLR_QSPI_CSN(v) (((v)&0x1)<<27)
   function SIO_GPIO_HI_OUT_CLR_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   -- #define SIO_GPIO_HI_OUT_CLR_QSPI_CSN_MASK SIO_GPIO_HI_OUT_CLR_QSPI_CSN(ALL1)
   SIO_GPIO_HI_OUT_CLR_QSPI_CSN_MASK : constant uint32_t := SIO_GPIO_HI_OUT_CLR_QSPI_CSN (ALL1);
   -- #define SIO_GPIO_HI_OUT_CLR_QSPI_SCK(v) (((v)&0x1)<<26)
   function SIO_GPIO_HI_OUT_CLR_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   -- #define SIO_GPIO_HI_OUT_CLR_QSPI_SCK_MASK SIO_GPIO_HI_OUT_CLR_QSPI_SCK(ALL1)
   SIO_GPIO_HI_OUT_CLR_QSPI_SCK_MASK : constant uint32_t := SIO_GPIO_HI_OUT_CLR_QSPI_SCK (ALL1);
   -- #define SIO_GPIO_HI_OUT_CLR_USB_DM(v) (((v)&0x1)<<25)
   function SIO_GPIO_HI_OUT_CLR_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   -- #define SIO_GPIO_HI_OUT_CLR_USB_DM_MASK SIO_GPIO_HI_OUT_CLR_USB_DM(ALL1)
   SIO_GPIO_HI_OUT_CLR_USB_DM_MASK : constant uint32_t := SIO_GPIO_HI_OUT_CLR_USB_DM (ALL1);
   -- #define SIO_GPIO_HI_OUT_CLR_USB_DP(v) (((v)&0x1)<<24)
   function SIO_GPIO_HI_OUT_CLR_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   -- #define SIO_GPIO_HI_OUT_CLR_USB_DP_MASK SIO_GPIO_HI_OUT_CLR_USB_DP(ALL1)
   SIO_GPIO_HI_OUT_CLR_USB_DP_MASK : constant uint32_t := SIO_GPIO_HI_OUT_CLR_USB_DP (ALL1);
   -- #define SIO_GPIO_HI_OUT_CLR_GPIO(v) (((v)&0xffff)<<0)
   function SIO_GPIO_HI_OUT_CLR_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   -- #define SIO_GPIO_HI_OUT_CLR_GPIO_MASK SIO_GPIO_HI_OUT_CLR_GPIO(ALL1)
   SIO_GPIO_HI_OUT_CLR_GPIO_MASK : constant uint32_t := SIO_GPIO_HI_OUT_CLR_GPIO (ALL1);
   -- #define SIO_GPIO_HI_OUT_XOR_QSPI_SD(v) (((v)&0xf)<<28)
   function SIO_GPIO_HI_OUT_XOR_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   -- #define SIO_GPIO_HI_OUT_XOR_QSPI_SD_MASK SIO_GPIO_HI_OUT_XOR_QSPI_SD(ALL1)
   SIO_GPIO_HI_OUT_XOR_QSPI_SD_MASK : constant uint32_t := SIO_GPIO_HI_OUT_XOR_QSPI_SD (ALL1);
   -- #define SIO_GPIO_HI_OUT_XOR_QSPI_CSN(v) (((v)&0x1)<<27)
   function SIO_GPIO_HI_OUT_XOR_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   -- #define SIO_GPIO_HI_OUT_XOR_QSPI_CSN_MASK SIO_GPIO_HI_OUT_XOR_QSPI_CSN(ALL1)
   SIO_GPIO_HI_OUT_XOR_QSPI_CSN_MASK : constant uint32_t := SIO_GPIO_HI_OUT_XOR_QSPI_CSN (ALL1);
   -- #define SIO_GPIO_HI_OUT_XOR_QSPI_SCK(v) (((v)&0x1)<<26)
   function SIO_GPIO_HI_OUT_XOR_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   -- #define SIO_GPIO_HI_OUT_XOR_QSPI_SCK_MASK SIO_GPIO_HI_OUT_XOR_QSPI_SCK(ALL1)
   SIO_GPIO_HI_OUT_XOR_QSPI_SCK_MASK : constant uint32_t := SIO_GPIO_HI_OUT_XOR_QSPI_SCK (ALL1);
   -- #define SIO_GPIO_HI_OUT_XOR_USB_DM(v) (((v)&0x1)<<25)
   function SIO_GPIO_HI_OUT_XOR_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   -- #define SIO_GPIO_HI_OUT_XOR_USB_DM_MASK SIO_GPIO_HI_OUT_XOR_USB_DM(ALL1)
   SIO_GPIO_HI_OUT_XOR_USB_DM_MASK : constant uint32_t := SIO_GPIO_HI_OUT_XOR_USB_DM (ALL1);
   -- #define SIO_GPIO_HI_OUT_XOR_USB_DP(v) (((v)&0x1)<<24)
   function SIO_GPIO_HI_OUT_XOR_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   -- #define SIO_GPIO_HI_OUT_XOR_USB_DP_MASK SIO_GPIO_HI_OUT_XOR_USB_DP(ALL1)
   SIO_GPIO_HI_OUT_XOR_USB_DP_MASK : constant uint32_t := SIO_GPIO_HI_OUT_XOR_USB_DP (ALL1);
   -- #define SIO_GPIO_HI_OUT_XOR_GPIO(v) (((v)&0xffff)<<0)
   function SIO_GPIO_HI_OUT_XOR_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   -- #define SIO_GPIO_HI_OUT_XOR_GPIO_MASK SIO_GPIO_HI_OUT_XOR_GPIO(ALL1)
   SIO_GPIO_HI_OUT_XOR_GPIO_MASK : constant uint32_t := SIO_GPIO_HI_OUT_XOR_GPIO (ALL1);

   --  GPIO_OUT_SET Register macros

   --  GPIO_HI_OUT_SET Register macros

   --  GPIO_OE Register macros

   --  GPIO_HI_OE Register macros

   function SIO_GPIO_HI_OE_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_QSPI_SD_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_QSPI_SD (ALL1);

   function SIO_GPIO_HI_OE_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_QSPI_CSN_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_QSPI_CSN (ALL1);

   function SIO_GPIO_HI_OE_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_QSPI_SCK_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_QSPI_SCK (ALL1);

   function SIO_GPIO_HI_OE_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_USB_DM_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_USB_DM (ALL1);

   function SIO_GPIO_HI_OE_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_USB_DP_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_USB_DP (ALL1);

   function SIO_GPIO_HI_OE_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_GPIO_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_GPIO (ALL1);

   function SIO_GPIO_HI_OE_SET_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SD_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_QSPI_SD (ALL1);

   function SIO_GPIO_HI_OE_SET_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_CSN_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_QSPI_CSN (ALL1);

   function SIO_GPIO_HI_OE_SET_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SCK_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_QSPI_SCK (ALL1);

   function SIO_GPIO_HI_OE_SET_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DM_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_USB_DM (ALL1);

   function SIO_GPIO_HI_OE_SET_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DP_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_USB_DP (ALL1);

   function SIO_GPIO_HI_OE_SET_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_SET_GPIO_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_GPIO (ALL1);

   function SIO_GPIO_HI_OE_CLR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SD_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_QSPI_SD (ALL1);

   function SIO_GPIO_HI_OE_CLR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_CSN_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_QSPI_CSN (ALL1);

   function SIO_GPIO_HI_OE_CLR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SCK_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_QSPI_SCK (ALL1);

   function SIO_GPIO_HI_OE_CLR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DM_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_USB_DM (ALL1);

   function SIO_GPIO_HI_OE_CLR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DP_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_USB_DP (ALL1);

   function SIO_GPIO_HI_OE_CLR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_CLR_GPIO_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_GPIO (ALL1);

   function SIO_GPIO_HI_OE_XOR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SD_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_QSPI_SD (ALL1);

   function SIO_GPIO_HI_OE_XOR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_CSN_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_QSPI_CSN (ALL1);

   function SIO_GPIO_HI_OE_XOR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SCK_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_QSPI_SCK (ALL1);

   function SIO_GPIO_HI_OE_XOR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DM_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_USB_DM (ALL1);

   function SIO_GPIO_HI_OE_XOR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DP_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_USB_DP (ALL1);

   function SIO_GPIO_HI_OE_XOR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_XOR_GPIO_MASK : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_GPIO (ALL1);

   --  GPIO_OE_SET Register macros

   --  GPIO_HI_OE_SET Register macros

   --  Note: The C original repeats these definitions here.
   function SIO_GPIO_HI_OE_SET_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_QSPI_SD_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_SET_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_QSPI_CSN_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_SET_QSPI_SCK_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SCK_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_QSPI_SCK_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_SET_USB_DM_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DM_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_USB_DM_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_SET_USB_DP_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DP_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_USB_DP_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_SET_GPIO_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_SET_GPIO_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_SET_GPIO_Duplicate (ALL1);

   --  GPIO_OE_CLR Register macros

   --  GPIO_HI_OE_CLR Register macros

   --  Note: The C original repeats these definitions here.
   function SIO_GPIO_HI_OE_CLR_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_QSPI_SD_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_CLR_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_QSPI_CSN_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_CLR_QSPI_SCK_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SCK_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_QSPI_SCK_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_CLR_USB_DM_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DM_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_USB_DM_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_CLR_USB_DP_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DP_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_USB_DP_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_CLR_GPIO_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_CLR_GPIO_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_CLR_GPIO_Duplicate (ALL1);

   --  GPIO_OE_XOR Register macros

   --  GPIO_HI_OE_XOR Register macros

   --  Note: The C original repeats these definitions here.
   function SIO_GPIO_HI_OE_XOR_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_QSPI_SD_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_XOR_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_QSPI_CSN_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_XOR_QSPI_SCK_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SCK_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_QSPI_SCK_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_XOR_USB_DM_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DM_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_USB_DM_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_XOR_USB_DP_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DP_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_USB_DP_Duplicate (ALL1);

   function SIO_GPIO_HI_OE_XOR_GPIO_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_XOR_GPIO_MASK_Duplicate : constant Unsigned_32 := SIO_GPIO_HI_OE_XOR_GPIO_Duplicate (ALL1);

   --  FIFO_ST Register macros

   function SIO_FIFO_ST_ROE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3)) with Inline;
   SIO_FIFO_ST_ROE_MASK : constant Unsigned_32 := SIO_FIFO_ST_ROE (ALL1);

   function SIO_FIFO_ST_WOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2)) with Inline;
   SIO_FIFO_ST_WOF_MASK : constant Unsigned_32 := SIO_FIFO_ST_WOF (ALL1);

   function SIO_FIFO_ST_RDY (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_FIFO_ST_RDY_MASK : constant Unsigned_32 := SIO_FIFO_ST_RDY (ALL1);

   function SIO_FIFO_ST_VLD (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_FIFO_ST_VLD_MASK : constant Unsigned_32 := SIO_FIFO_ST_VLD (ALL1);

   --  FIFO_WR Register macros

   --  FIFO_RD Register macros

   --  SPINLOCK_ST Register macros

   --  INTERP0_ACCUM0 Register macros

   --  INTERP0_ACCUM1 Register macros

   --  INTERP0_BASE0 Register macros

   --  INTERP0_BASE1 Register macros

   --  INTERP0_BASE2 Register macros

   --  INTERP0_POP_LANE0 Register macros

   --  INTERP0_POP_LANE1 Register macros

   --  INTERP0_POP_FULL Register macros

   --  INTERP0_PEEK_LANE0 Register macros

   --  INTERP0_PEEK_LANE1 Register macros

   --  INTERP0_PEEK_FULL Register macros

   --  INTERP0_CTRL_LANE0 Register macros

   function SIO_INTERP0_CTRL_LANE0_OVERF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_INTERP0_CTRL_LANE0_OVERF_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_OVERF (ALL1);

   function SIO_INTERP0_CTRL_LANE0_OVERF1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_INTERP0_CTRL_LANE0_OVERF1_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_OVERF1 (ALL1);

   function SIO_INTERP0_CTRL_LANE0_OVERF0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23)) with Inline;
   SIO_INTERP0_CTRL_LANE0_OVERF0_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_OVERF0 (ALL1);

   function SIO_INTERP0_CTRL_LANE0_BLEND (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21)) with Inline;
   SIO_INTERP0_CTRL_LANE0_BLEND_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_BLEND (ALL1);

   function SIO_INTERP0_CTRL_LANE0_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP0_CTRL_LANE0_FORCE_MSB_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_FORCE_MSB (ALL1);

   function SIO_INTERP0_CTRL_LANE0_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP0_CTRL_LANE0_ADD_RAW_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_ADD_RAW (ALL1);

   function SIO_INTERP0_CTRL_LANE0_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP0_CTRL_LANE0_CROSS_RESULT_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_CROSS_RESULT (ALL1);

   function SIO_INTERP0_CTRL_LANE0_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP0_CTRL_LANE0_CROSS_INPUT_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_CROSS_INPUT (ALL1);

   function SIO_INTERP0_CTRL_LANE0_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP0_CTRL_LANE0_SIGNED_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_SIGNED (ALL1);

   function SIO_INTERP0_CTRL_LANE0_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP0_CTRL_LANE0_MASK_MSB_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_MASK_MSB (ALL1);

   function SIO_INTERP0_CTRL_LANE0_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP0_CTRL_LANE0_MASK_LSB_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_MASK_LSB (ALL1);

   function SIO_INTERP0_CTRL_LANE0_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP0_CTRL_LANE0_SHIFT_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE0_SHIFT (ALL1);

   --  INTERP0_CTRL_LANE1 Register macros

   function SIO_INTERP0_CTRL_LANE1_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP0_CTRL_LANE1_FORCE_MSB_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_FORCE_MSB (ALL1);

   function SIO_INTERP0_CTRL_LANE1_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP0_CTRL_LANE1_ADD_RAW_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_ADD_RAW (ALL1);

   function SIO_INTERP0_CTRL_LANE1_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP0_CTRL_LANE1_CROSS_RESULT_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_CROSS_RESULT (ALL1);

   function SIO_INTERP0_CTRL_LANE1_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP0_CTRL_LANE1_CROSS_INPUT_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_CROSS_INPUT (ALL1);

   function SIO_INTERP0_CTRL_LANE1_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP0_CTRL_LANE1_SIGNED_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_SIGNED (ALL1);

   function SIO_INTERP0_CTRL_LANE1_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP0_CTRL_LANE1_MASK_MSB_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_MASK_MSB (ALL1);

   function SIO_INTERP0_CTRL_LANE1_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP0_CTRL_LANE1_MASK_LSB_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_MASK_LSB (ALL1);

   function SIO_INTERP0_CTRL_LANE1_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP0_CTRL_LANE1_SHIFT_MASK : constant Unsigned_32 := SIO_INTERP0_CTRL_LANE1_SHIFT (ALL1);

   --  INTERP0_ACCUM0_ADD Register macros

   --  INTERP0_ACCUM1_ADD Register macros

   --  INTERP0_BASE_1AND0 Register macros

   --  INTERP1_ACCUM0 Register macros

   --  INTERP1_ACCUM1 Register macros

   --  INTERP1_BASE0 Register macros

   --  INTERP1_BASE1 Register macros

   --  INTERP1_BASE2 Register macros

   --  INTERP1_POP_LANE0 Register macros

   --  INTERP1_POP_LANE1 Register macros

   --  INTERP1_POP_FULL Register macros

   --  INTERP1_PEEK_LANE0 Register macros

   --  INTERP1_PEEK_LANE1 Register macros

   --  INTERP1_PEEK_FULL Register macros

   --  INTERP1_CTRL_LANE0 Register macros

   function SIO_INTERP1_CTRL_LANE0_OVERF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_INTERP1_CTRL_LANE0_OVERF_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_OVERF (ALL1);

   function SIO_INTERP1_CTRL_LANE0_OVERF1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_INTERP1_CTRL_LANE0_OVERF1_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_OVERF1 (ALL1);

   function SIO_INTERP1_CTRL_LANE0_OVERF0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23)) with Inline;
   SIO_INTERP1_CTRL_LANE0_OVERF0_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_OVERF0 (ALL1);

   function SIO_INTERP1_CTRL_LANE0_CLAMP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22)) with Inline;
   SIO_INTERP1_CTRL_LANE0_CLAMP_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_CLAMP (ALL1);

   function SIO_INTERP1_CTRL_LANE0_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP1_CTRL_LANE0_FORCE_MSB_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_FORCE_MSB (ALL1);

   function SIO_INTERP1_CTRL_LANE0_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP1_CTRL_LANE0_ADD_RAW_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_ADD_RAW (ALL1);

   function SIO_INTERP1_CTRL_LANE0_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP1_CTRL_LANE0_CROSS_RESULT_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_CROSS_RESULT (ALL1);

   function SIO_INTERP1_CTRL_LANE0_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP1_CTRL_LANE0_CROSS_INPUT_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_CROSS_INPUT (ALL1);

   function SIO_INTERP1_CTRL_LANE0_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP1_CTRL_LANE0_SIGNED_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_SIGNED (ALL1);

   function SIO_INTERP1_CTRL_LANE0_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP1_CTRL_LANE0_MASK_MSB_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_MASK_MSB (ALL1);

   function SIO_INTERP1_CTRL_LANE0_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP1_CTRL_LANE0_MASK_LSB_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_MASK_LSB (ALL1);

   function SIO_INTERP1_CTRL_LANE0_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP1_CTRL_LANE0_SHIFT_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE0_SHIFT (ALL1);

   --  INTERP1_CTRL_LANE1 Register macros

   function SIO_INTERP1_CTRL_LANE1_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP1_CTRL_LANE1_FORCE_MSB_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_FORCE_MSB (ALL1);

   function SIO_INTERP1_CTRL_LANE1_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP1_CTRL_LANE1_ADD_RAW_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_ADD_RAW (ALL1);

   function SIO_INTERP1_CTRL_LANE1_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP1_CTRL_LANE1_CROSS_RESULT_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_CROSS_RESULT (ALL1);

   function SIO_INTERP1_CTRL_LANE1_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP1_CTRL_LANE1_CROSS_INPUT_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_CROSS_INPUT (ALL1);

   function SIO_INTERP1_CTRL_LANE1_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP1_CTRL_LANE1_SIGNED_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_SIGNED (ALL1);

   function SIO_INTERP1_CTRL_LANE1_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP1_CTRL_LANE1_MASK_MSB_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_MASK_MSB (ALL1);

   function SIO_INTERP1_CTRL_LANE1_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP1_CTRL_LANE1_MASK_LSB_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_MASK_LSB (ALL1);

   function SIO_INTERP1_CTRL_LANE1_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP1_CTRL_LANE1_SHIFT_MASK : constant Unsigned_32 := SIO_INTERP1_CTRL_LANE1_SHIFT (ALL1);

   --  INTERP1_ACCUM0_ADD Register macros

   --  INTERP1_ACCUM1_ADD Register macros

   --  INTERP1_BASE_1AND0 Register macros

   --  SPINLOCK0 Register macros
   --  SPINLOCK1 Register macros
   --  SPINLOCK2 Register macros
   --  SPINLOCK3 Register macros
   --  SPINLOCK4 Register macros
   --  SPINLOCK5 Register macros
   --  SPINLOCK6 Register macros
   --  SPINLOCK7 Register macros
   --  SPINLOCK8 Register macros
   --  SPINLOCK9 Register macros
   --  SPINLOCK10 Register macros
   --  SPINLOCK11 Register macros
   --  SPINLOCK12 Register macros
   --  SPINLOCK13 Register macros
   --  SPINLOCK14 Register macros
   --  SPINLOCK15 Register macros
   --  SPINLOCK16 Register macros
   --  SPINLOCK17 Register macros
   --  SPINLOCK18 Register macros
   --  SPINLOCK19 Register macros
   --  SPINLOCK20 Register macros
   --  SPINLOCK21 Register macros
   --  SPINLOCK22 Register macros
   --  SPINLOCK23 Register macros
   --  SPINLOCK24 Register macros
   --  SPINLOCK25 Register macros
   --  SPINLOCK26 Register macros
   --  SPINLOCK27 Register macros
   --  SPINLOCK28 Register macros
   --  SPINLOCK29 Register macros
   --  SPINLOCK30 Register macros
   --  SPINLOCK31 Register macros

   --  DOORBELL_OUT_SET Register macros

   --  DOORBELL_OUT_CLR Register macros

   --  DOORBELL_IN_SET Register macros

   --  DOORBELL_IN_CLR Register macros

   --  PERI_NONSEC Register macros

   function SIO_PERI_NONSEC_TMDS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5)) with Inline;
   SIO_PERI_NONSEC_TMDS_MASK : constant Unsigned_32 := SIO_PERI_NONSEC_TMDS (ALL1);

   function SIO_PERI_NONSEC_INTERP1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_PERI_NONSEC_INTERP1_MASK : constant Unsigned_32 := SIO_PERI_NONSEC_INTERP1 (ALL1);

   function SIO_PERI_NONSEC_INTERP0 (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_PERI_NONSEC_INTERP0_MASK : constant Unsigned_32 := SIO_PERI_NONSEC_INTERP0 (ALL1);

   --  RISCV_SOFTIRQ Register macros

   function SIO_RISCV_SOFTIRQ_CORE1_CLR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9)) with Inline;
   SIO_RISCV_SOFTIRQ_CORE1_CLR_MASK : constant Unsigned_32 := SIO_RISCV_SOFTIRQ_CORE1_CLR (ALL1);

   function SIO_RISCV_SOFTIRQ_CORE0_CLR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8)) with Inline;
   SIO_RISCV_SOFTIRQ_CORE0_CLR_MASK : constant Unsigned_32 := SIO_RISCV_SOFTIRQ_CORE0_CLR (ALL1);

   function SIO_RISCV_SOFTIRQ_CORE1_SET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_RISCV_SOFTIRQ_CORE1_SET_MASK : constant Unsigned_32 := SIO_RISCV_SOFTIRQ_CORE1_SET (ALL1);

   function SIO_RISCV_SOFTIRQ_CORE0_SET (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_RISCV_SOFTIRQ_CORE0_SET_MASK : constant Unsigned_32 := SIO_RISCV_SOFTIRQ_CORE0_SET (ALL1);

   --  MTIME_CTRL Register macros

   function SIO_MTIME_CTRL_DBGPAUSE_CORE1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3)) with Inline;
   SIO_MTIME_CTRL_DBGPAUSE_CORE1_MASK : constant Unsigned_32 := SIO_MTIME_CTRL_DBGPAUSE_CORE1 (ALL1);

   function SIO_MTIME_CTRL_DBGPAUSE_CORE0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2)) with Inline;
   SIO_MTIME_CTRL_DBGPAUSE_CORE0_MASK : constant Unsigned_32 := SIO_MTIME_CTRL_DBGPAUSE_CORE0 (ALL1);

   function SIO_MTIME_CTRL_FULLSPEED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_MTIME_CTRL_FULLSPEED_MASK : constant Unsigned_32 := SIO_MTIME_CTRL_FULLSPEED (ALL1);

   function SIO_MTIME_CTRL_EN (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_MTIME_CTRL_EN_MASK : constant Unsigned_32 := SIO_MTIME_CTRL_EN (ALL1);

   --  MTIME Register macros

   --  Note: The C original repeats the CTRL macros under the MTIME header.
   function SIO_MTIME_DBGPAUSE_CORE1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3)) with Inline;
   SIO_MTIME_DBGPAUSE_CORE1_MASK : constant Unsigned_32 := SIO_MTIME_DBGPAUSE_CORE1 (ALL1);

   function SIO_MTIME_DBGPAUSE_CORE0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2)) with Inline;
   SIO_MTIME_DBGPAUSE_CORE0_MASK : constant Unsigned_32 := SIO_MTIME_DBGPAUSE_CORE0 (ALL1);

   function SIO_MTIME_FULLSPEED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_MTIME_FULLSPEED_MASK : constant Unsigned_32 := SIO_MTIME_FULLSPEED (ALL1);

   function SIO_MTIME_EN (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_MTIME_EN_MASK : constant Unsigned_32 := SIO_MTIME_EN (ALL1);

   --  MTIMEH Register macros

   --  MTIMECMP Register macros

   --  MTIMECMPH Register macros

   --  TMDS_CTRL Register macros

   function SIO_TMDS_CTRL_CLEAR_BALANCE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 28)) with Inline;
   SIO_TMDS_CTRL_CLEAR_BALANCE_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_CLEAR_BALANCE (ALL1);

   function SIO_TMDS_CTRL_PIX2_NOSHIFT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_TMDS_CTRL_PIX2_NOSHIFT_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_PIX2_NOSHIFT (ALL1);

   function SIO_TMDS_CTRL_PIX_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 24)) with Inline;
   SIO_TMDS_CTRL_PIX_SHIFT_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_PIX_SHIFT (ALL1);

   function SIO_TMDS_CTRL_INTERLEAVE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23)) with Inline;
   SIO_TMDS_CTRL_INTERLEAVE_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_INTERLEAVE (ALL1);

   function SIO_TMDS_CTRL_L2_NBITS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 18)) with Inline;
   SIO_TMDS_CTRL_L2_NBITS_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_L2_NBITS (ALL1);

   function SIO_TMDS_CTRL_L1_NBITS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 15)) with Inline;
   SIO_TMDS_CTRL_L1_NBITS_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_L1_NBITS (ALL1);

   function SIO_TMDS_CTRL_L0_NBITS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 12)) with Inline;
   SIO_TMDS_CTRL_L0_NBITS_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_L0_NBITS (ALL1);

   function SIO_TMDS_CTRL_L2_ROT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 8)) with Inline;
   SIO_TMDS_CTRL_L2_ROT_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_L2_ROT (ALL1);

   function SIO_TMDS_CTRL_L1_ROT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 4)) with Inline;
   SIO_TMDS_CTRL_L1_ROT_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_L1_ROT (ALL1);

   function SIO_TMDS_CTRL_L0_ROT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#F#) with Inline;
   SIO_TMDS_CTRL_L0_ROT_MASK : constant Unsigned_32 := SIO_TMDS_CTRL_L0_ROT (ALL1);

   --  TMDS_WDATA Register macros

   --  TMDS_PEEK_SINGLE Register macros

   --  TMDS_POP_SINGLE Register macros

   --  TMDS_PEEK_DOUBLE_L0 Register macros

   --  TMDS_POP_DOUBLE_L0 Register macros

   --  TMDS_PEEK_DOUBLE_L1 Register macros

   --  TMDS_POP_DOUBLE_L1 Register macros

   --  TMDS_PEEK_DOUBLE_L2 Register macros

   --  TMDS_POP_DOUBLE_L2 Register macros

   --  CPUID Register macros

   --  GPIO_IN Register macros

   --  GPIO_HI_IN Register macros

   function SIO_NONSEC_GPIO_HI_IN_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_QSPI_SD_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_IN_QSPI_SD (ALL1);

   function SIO_NONSEC_GPIO_HI_IN_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_QSPI_CSN_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_IN_QSPI_CSN (ALL1);

   function SIO_NONSEC_GPIO_HI_IN_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_QSPI_SCK_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_IN_QSPI_SCK (ALL1);

   function SIO_NONSEC_GPIO_HI_IN_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_USB_DM_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_IN_USB_DM (ALL1);

   function SIO_NONSEC_GPIO_HI_IN_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_USB_DP_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_IN_USB_DP (ALL1);

   function SIO_NONSEC_GPIO_HI_IN_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_IN_GPIO_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_IN_GPIO (ALL1);

   --  GPIO_OUT Register macros

   --  GPIO_HI_OUT Register macros

   function SIO_NONSEC_GPIO_HI_OUT_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_QSPI_SD_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_QSPI_SD (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_QSPI_CSN_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_QSPI_CSN (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_QSPI_SCK_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_QSPI_SCK (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_USB_DM_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_USB_DM (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_USB_DP_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_USB_DP (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_GPIO_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_GPIO (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SCK_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SCK (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_SET_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_USB_DM_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_SET_USB_DM (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_SET_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_USB_DP_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_SET_USB_DP (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_SET_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_GPIO_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_SET_GPIO (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SD_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SD (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_CSN_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_CSN (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SCK_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SCK (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DM_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DM (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DP_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DP (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_CLR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_GPIO_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_CLR_GPIO (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SD_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SD (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_CSN_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_CSN (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SCK_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SCK (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DM_MASK : constant Unsigned_32 := SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DM (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DP_MASK : constant Unsigned_32 :=
     SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DP (ALL1);

   function SIO_NONSEC_GPIO_HI_OUT_XOR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_GPIO_MASK : constant Unsigned_32 :=
     SIO_NONSEC_GPIO_HI_OUT_XOR_GPIO (ALL1);

   --  GPIO_OUT_SET Register macros

   --  GPIO_HI_OUT_SET Register macros

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_MASK_Duplicate : constant Unsigned_32 :=
     SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_Duplicate (ALL1);

   --  Note: The input C snippet ended with a partial macro for SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN.
   --  It is completed here based on the established pattern to provide valid code.
   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 :=
     SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_Duplicate (ALL1);

end RP2350_SIO;
