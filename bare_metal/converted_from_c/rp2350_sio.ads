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
   pragma Preelaborate;

   subtype uint32_t is Unsigned_32;

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

   SIO_CPUID : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000000#);
   SIO_GPIO_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000004#);
   SIO_GPIO_HI_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000008#);
   SIO_GPIO_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000010#);
   SIO_GPIO_HI_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000014#);
   SIO_GPIO_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000018#);
   SIO_GPIO_HI_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d000001c#);
   SIO_GPIO_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000020#);
   SIO_GPIO_HI_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000024#);
   SIO_GPIO_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000028#);
   SIO_GPIO_HI_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d000002c#);
   SIO_GPIO_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000030#);
   SIO_GPIO_HI_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000034#);
   SIO_GPIO_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000038#);
   SIO_GPIO_HI_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d000003c#);
   SIO_GPIO_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000040#);
   SIO_GPIO_HI_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000044#);
   SIO_GPIO_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000048#);
   SIO_GPIO_HI_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d000004c#);
   SIO_FIFO_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000050#);
   SIO_FIFO_WR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000054#);
   SIO_FIFO_RD : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000058#);
   SIO_SPINLOCK_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d000005c#);
   SIO_INTERP0_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000080#);
   SIO_INTERP0_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000084#);
   SIO_INTERP0_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000088#);
   SIO_INTERP0_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000008c#);
   SIO_INTERP0_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000090#);
   SIO_INTERP0_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000094#);
   SIO_INTERP0_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000098#);
   SIO_INTERP0_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d000009c#);
   SIO_INTERP0_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000a0#);
   SIO_INTERP0_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000a4#);
   SIO_INTERP0_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000a8#);
   SIO_INTERP0_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000ac#);
   SIO_INTERP0_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000b0#);
   SIO_INTERP0_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000b4#);
   SIO_INTERP0_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000b8#);
   SIO_INTERP0_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000bc#);
   SIO_INTERP1_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000c0#);
   SIO_INTERP1_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000c4#);
   SIO_INTERP1_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000c8#);
   SIO_INTERP1_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000cc#);
   SIO_INTERP1_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000d0#);
   SIO_INTERP1_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000d4#);
   SIO_INTERP1_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000d8#);
   SIO_INTERP1_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000dc#);
   SIO_INTERP1_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000e0#);
   SIO_INTERP1_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000e4#);
   SIO_INTERP1_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000e8#);
   SIO_INTERP1_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000ec#);
   SIO_INTERP1_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000f0#);
   SIO_INTERP1_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000f4#);
   SIO_INTERP1_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000f8#);
   SIO_INTERP1_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00000fc#);
   SIO_SPINLOCK0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000100#);
   SIO_SPINLOCK1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000104#);
   SIO_SPINLOCK2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000108#);
   SIO_SPINLOCK3 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000010c#);
   SIO_SPINLOCK4 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000110#);
   SIO_SPINLOCK5 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000114#);
   SIO_SPINLOCK6 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000118#);
   SIO_SPINLOCK7 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000011c#);
   SIO_SPINLOCK8 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000120#);
   SIO_SPINLOCK9 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000124#);
   SIO_SPINLOCK10 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000128#);
   SIO_SPINLOCK11 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000012c#);
   SIO_SPINLOCK12 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000130#);
   SIO_SPINLOCK13 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000134#);
   SIO_SPINLOCK14 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000138#);
   SIO_SPINLOCK15 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000013c#);
   SIO_SPINLOCK16 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000140#);
   SIO_SPINLOCK17 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000144#);
   SIO_SPINLOCK18 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000148#);
   SIO_SPINLOCK19 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000014c#);
   SIO_SPINLOCK20 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000150#);
   SIO_SPINLOCK21 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000154#);
   SIO_SPINLOCK22 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000158#);
   SIO_SPINLOCK23 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000015c#);
   SIO_SPINLOCK24 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000160#);
   SIO_SPINLOCK25 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000164#);
   SIO_SPINLOCK26 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000168#);
   SIO_SPINLOCK27 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000016c#);
   SIO_SPINLOCK28 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000170#);
   SIO_SPINLOCK29 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000174#);
   SIO_SPINLOCK30 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000178#);
   SIO_SPINLOCK31 : uint32_t with Import, Volatile, Address => System'To_Address (16#d000017c#);
   SIO_DOORBELL_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000180#);
   SIO_DOORBELL_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000184#);
   SIO_DOORBELL_IN_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000188#);
   SIO_DOORBELL_IN_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d000018c#);
   SIO_PERI_NONSEC : uint32_t with Import, Volatile, Address => System'To_Address (16#d0000190#);
   SIO_RISCV_SOFTIRQ : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001a0#);
   SIO_MTIME_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001a4#);
   SIO_MTIME : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001b0#);
   SIO_MTIMEH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001b4#);
   SIO_MTIMECMP : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001b8#);
   SIO_MTIMECMPH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001bc#);
   SIO_TMDS_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001c0#);
   SIO_TMDS_WDATA : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001c4#);
   SIO_TMDS_PEEK_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001c8#);
   SIO_TMDS_POP_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001cc#);
   SIO_TMDS_PEEK_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001d0#);
   SIO_TMDS_POP_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001d4#);
   SIO_TMDS_PEEK_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001d8#);
   SIO_TMDS_POP_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001dc#);
   SIO_TMDS_PEEK_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001e0#);
   SIO_TMDS_POP_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00001e4#);
   SIO_NONSEC_CPUID : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020000#);
   SIO_NONSEC_GPIO_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020004#);
   SIO_NONSEC_GPIO_HI_IN : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020008#);
   SIO_NONSEC_GPIO_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020010#);
   SIO_NONSEC_GPIO_HI_OUT : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020014#);
   SIO_NONSEC_GPIO_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020018#);
   SIO_NONSEC_GPIO_HI_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d002001c#);
   SIO_NONSEC_GPIO_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020020#);
   SIO_NONSEC_GPIO_HI_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020024#);
   SIO_NONSEC_GPIO_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020028#);
   SIO_NONSEC_GPIO_HI_OUT_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d002002c#);
   SIO_NONSEC_GPIO_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020030#);
   SIO_NONSEC_GPIO_HI_OE : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020034#);
   SIO_NONSEC_GPIO_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020038#);
   SIO_NONSEC_GPIO_HI_OE_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d002003c#);
   SIO_NONSEC_GPIO_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020040#);
   SIO_NONSEC_GPIO_HI_OE_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020044#);
   SIO_NONSEC_GPIO_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020048#);
   SIO_NONSEC_GPIO_HI_OE_XOR : uint32_t with Import, Volatile, Address => System'To_Address (16#d002004c#);
   SIO_NONSEC_FIFO_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020050#);
   SIO_NONSEC_FIFO_WR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020054#);
   SIO_NONSEC_FIFO_RD : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020058#);
   SIO_NONSEC_SPINLOCK_ST : uint32_t with Import, Volatile, Address => System'To_Address (16#d002005c#);
   SIO_NONSEC_INTERP0_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020080#);
   SIO_NONSEC_INTERP0_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020084#);
   SIO_NONSEC_INTERP0_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020088#);
   SIO_NONSEC_INTERP0_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002008c#);
   SIO_NONSEC_INTERP0_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020090#);
   SIO_NONSEC_INTERP0_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020094#);
   SIO_NONSEC_INTERP0_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020098#);
   SIO_NONSEC_INTERP0_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d002009c#);
   SIO_NONSEC_INTERP0_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200a0#);
   SIO_NONSEC_INTERP0_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200a4#);
   SIO_NONSEC_INTERP0_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200a8#);
   SIO_NONSEC_INTERP0_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200ac#);
   SIO_NONSEC_INTERP0_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200b0#);
   SIO_NONSEC_INTERP0_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200b4#);
   SIO_NONSEC_INTERP0_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200b8#);
   SIO_NONSEC_INTERP0_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200bc#);
   SIO_NONSEC_INTERP1_ACCUM0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200c0#);
   SIO_NONSEC_INTERP1_ACCUM1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200c4#);
   SIO_NONSEC_INTERP1_BASE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200c8#);
   SIO_NONSEC_INTERP1_BASE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200cc#);
   SIO_NONSEC_INTERP1_BASE2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200d0#);
   SIO_NONSEC_INTERP1_POP_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200d4#);
   SIO_NONSEC_INTERP1_POP_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200d8#);
   SIO_NONSEC_INTERP1_POP_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200dc#);
   SIO_NONSEC_INTERP1_PEEK_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200e0#);
   SIO_NONSEC_INTERP1_PEEK_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200e4#);
   SIO_NONSEC_INTERP1_PEEK_FULL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200e8#);
   SIO_NONSEC_INTERP1_CTRL_LANE0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200ec#);
   SIO_NONSEC_INTERP1_CTRL_LANE1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200f0#);
   SIO_NONSEC_INTERP1_ACCUM0_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200f4#);
   SIO_NONSEC_INTERP1_ACCUM1_ADD : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200f8#);
   SIO_NONSEC_INTERP1_BASE_1AND0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00200fc#);
   SIO_NONSEC_SPINLOCK0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020100#);
   SIO_NONSEC_SPINLOCK1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020104#);
   SIO_NONSEC_SPINLOCK2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020108#);
   SIO_NONSEC_SPINLOCK3 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002010c#);
   SIO_NONSEC_SPINLOCK4 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020110#);
   SIO_NONSEC_SPINLOCK5 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020114#);
   SIO_NONSEC_SPINLOCK6 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020118#);
   SIO_NONSEC_SPINLOCK7 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002011c#);
   SIO_NONSEC_SPINLOCK8 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020120#);
   SIO_NONSEC_SPINLOCK9 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020124#);
   SIO_NONSEC_SPINLOCK10 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020128#);
   SIO_NONSEC_SPINLOCK11 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002012c#);
   SIO_NONSEC_SPINLOCK12 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020130#);
   SIO_NONSEC_SPINLOCK13 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020134#);
   SIO_NONSEC_SPINLOCK14 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020138#);
   SIO_NONSEC_SPINLOCK15 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002013c#);
   SIO_NONSEC_SPINLOCK16 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020140#);
   SIO_NONSEC_SPINLOCK17 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020144#);
   SIO_NONSEC_SPINLOCK18 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020148#);
   SIO_NONSEC_SPINLOCK19 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002014c#);
   SIO_NONSEC_SPINLOCK20 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020150#);
   SIO_NONSEC_SPINLOCK21 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020154#);
   SIO_NONSEC_SPINLOCK22 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020158#);
   SIO_NONSEC_SPINLOCK23 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002015c#);
   SIO_NONSEC_SPINLOCK24 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020160#);
   SIO_NONSEC_SPINLOCK25 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020164#);
   SIO_NONSEC_SPINLOCK26 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020168#);
   SIO_NONSEC_SPINLOCK27 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002016c#);
   SIO_NONSEC_SPINLOCK28 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020170#);
   SIO_NONSEC_SPINLOCK29 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020174#);
   SIO_NONSEC_SPINLOCK30 : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020178#);
   SIO_NONSEC_SPINLOCK31 : uint32_t with Import, Volatile, Address => System'To_Address (16#d002017c#);
   SIO_NONSEC_DOORBELL_OUT_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020180#);
   SIO_NONSEC_DOORBELL_OUT_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020184#);
   SIO_NONSEC_DOORBELL_IN_SET : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020188#);
   SIO_NONSEC_DOORBELL_IN_CLR : uint32_t with Import, Volatile, Address => System'To_Address (16#d002018c#);
   SIO_NONSEC_PERI_NONSEC : uint32_t with Import, Volatile, Address => System'To_Address (16#d0020190#);
   SIO_NONSEC_RISCV_SOFTIRQ : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201a0#);
   SIO_NONSEC_MTIME_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201a4#);
   SIO_NONSEC_MTIME : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201b0#);
   SIO_NONSEC_MTIMEH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201b4#);
   SIO_NONSEC_MTIMECMP : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201b8#);
   SIO_NONSEC_MTIMECMPH : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201bc#);
   SIO_NONSEC_TMDS_CTRL : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201c0#);
   SIO_NONSEC_TMDS_WDATA : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201c4#);
   SIO_NONSEC_TMDS_PEEK_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201c8#);
   SIO_NONSEC_TMDS_POP_SINGLE : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201cc#);
   SIO_NONSEC_TMDS_PEEK_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201d0#);
   SIO_NONSEC_TMDS_POP_DOUBLE_L0 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201d4#);
   SIO_NONSEC_TMDS_PEEK_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201d8#);
   SIO_NONSEC_TMDS_POP_DOUBLE_L1 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201dc#);
   SIO_NONSEC_TMDS_PEEK_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201e0#);
   SIO_NONSEC_TMDS_POP_DOUBLE_L2 : uint32_t with Import, Volatile, Address => System'To_Address (16#d00201e4#);

   -- CPUID Register macros

   -- GPIO_IN Register macros

   -- GPIO_HI_IN Register macros
   
   HI_INOUT_QSPI_GENERIC_SD_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 28);
   HI_INOUT_QSPI_GENERIC_CSN_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27); 
   HI_INOUT_QSPI_GENERIC_SCK_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);
   HI_INOUT_USB_GENERIC_DM_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);   
   HI_INOUT_USB_GENERIC_DP_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24); 
   HI_INOUT_GENERIC_GPIO_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#ffff#), 0);
     
   function SIO_GPIO_HI_IN_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   SIO_GPIO_HI_IN_QSPI_SD_MASK : constant uint32_t := HI_INOUT_QSPI_GENERIC_SD_MASK;  --  SIO_GPIO_HI_IN_QSPI_SD (ALL1);
   function SIO_GPIO_HI_IN_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   SIO_GPIO_HI_IN_QSPI_CSN_MASK : constant uint32_t := HI_INOUT_QSPI_GENERIC_CSN_MASK;  --  SIO_GPIO_HI_IN_QSPI_CSN (ALL1);
   function SIO_GPIO_HI_IN_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   SIO_GPIO_HI_IN_QSPI_SCK_MASK : constant uint32_t := HI_INOUT_QSPI_GENERIC_SCK_MASK;
   function SIO_GPIO_HI_IN_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   SIO_GPIO_HI_IN_USB_DM_MASK : constant uint32_t := HI_INOUT_USB_GENERIC_DM_MASK;  ---  SIO_GPIO_HI_IN_USB_DM (ALL1);
   function SIO_GPIO_HI_IN_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   SIO_GPIO_HI_IN_USB_DP_MASK : constant uint32_t := HI_INOUT_USB_GENERIC_DP_MASK;
   function SIO_GPIO_HI_IN_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   SIO_GPIO_HI_IN_GPIO_MASK : constant uint32_t := HI_INOUT_GENERIC_GPIO_MASK;  --  SIO_GPIO_HI_IN_GPIO (ALL1);

   -- --  GPIO_OUT Register macros

   -- --  GPIO_HI_OUT Register macros
   
   function SIO_GPIO_HI_OUT_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   SIO_GPIO_HI_OUT_QSPI_SD_MASK : constant uint32_t := HI_INOUT_QSPI_GENERIC_SD_MASK;  --  SIO_GPIO_HI_OUT_QSPI_SD (ALL1);
   function SIO_GPIO_HI_OUT_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   SIO_GPIO_HI_OUT_QSPI_CSN_MASK : constant uint32_t := HI_INOUT_QSPI_GENERIC_CSN_MASK;
   function SIO_GPIO_HI_OUT_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   SIO_GPIO_HI_OUT_QSPI_SCK_MASK : constant uint32_t := HI_INOUT_QSPI_GENERIC_SCK_MASK;
   function SIO_GPIO_HI_OUT_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   SIO_GPIO_HI_OUT_USB_DM_MASK : constant uint32_t := HI_INOUT_USB_GENERIC_DM_MASK;
   function SIO_GPIO_HI_OUT_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   SIO_GPIO_HI_OUT_USB_DP_MASK : constant uint32_t := HI_INOUT_USB_GENERIC_DP_MASK;
   function SIO_GPIO_HI_OUT_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   SIO_GPIO_HI_OUT_GPIO_MASK : constant uint32_t := HI_INOUT_GENERIC_GPIO_MASK;
   
   HI_OUT_SET_QSPI_GENERIC_SD_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 28);
   HI_OUT_SET_QSPI_GENERIC_CSN_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27);
   HI_OUT_SET_QSPI_GENERIC_SCK_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);
   HI_OUT_SET_QSPI_GENERIC_DM_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);  
   HI_OUT_SET_QSPI_GENERIC_DP_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24);
   HI_OUT_SET_GPIO_MASK             : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#ffff#), 0);
   
   HI_OUT_SCLR_QSPI_GENERIC_SD_MASK         : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 28);
   HI_OUT_SCLR_QSPI_GENERIC_CSN_MASK        : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27);
   HI_OUT_SCLR_QSPI_GENERIC_SCK_MASK        : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);
   
   HI_OUT_CLR_USB_GENERIC_DM_MASK           : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);
   HI_OUT_CLR_USB_GENERIC_DP_MASK           : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24);
   
   function SIO_GPIO_HI_OUT_SET_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   SIO_GPIO_HI_OUT_SET_QSPI_SD_MASK : constant uint32_t := HI_OUT_SET_QSPI_GENERIC_SD_MASK; --  SIO_GPIO_HI_OUT_SET_QSPI_SD (ALL1);
   function SIO_GPIO_HI_OUT_SET_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   SIO_GPIO_HI_OUT_SET_QSPI_CSN_MASK : constant uint32_t := HI_OUT_SET_QSPI_GENERIC_CSN_MASK;
   function SIO_GPIO_HI_OUT_SET_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   SIO_GPIO_HI_OUT_SET_QSPI_SCK_MASK : constant uint32_t := HI_OUT_SET_QSPI_GENERIC_SCK_MASK;
   function SIO_GPIO_HI_OUT_SET_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   SIO_GPIO_HI_OUT_SET_USB_DM_MASK : constant uint32_t := HI_OUT_CLR_USB_GENERIC_DM_MASK;
   function SIO_GPIO_HI_OUT_SET_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   SIO_GPIO_HI_OUT_SET_USB_DP_MASK : constant uint32_t := HI_OUT_SET_QSPI_GENERIC_DP_MASK;
   function SIO_GPIO_HI_OUT_SET_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   SIO_GPIO_HI_OUT_SET_GPIO_MASK : constant uint32_t := HI_OUT_SET_GPIO_MASK;
   function SIO_GPIO_HI_OUT_CLR_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   SIO_GPIO_HI_OUT_CLR_QSPI_SD_MASK : constant uint32_t := HI_OUT_SCLR_QSPI_GENERIC_SD_MASK;
   function SIO_GPIO_HI_OUT_CLR_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   SIO_GPIO_HI_OUT_CLR_QSPI_CSN_MASK : constant uint32_t := HI_OUT_SCLR_QSPI_GENERIC_CSN_MASK;
   function SIO_GPIO_HI_OUT_CLR_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   SIO_GPIO_HI_OUT_CLR_QSPI_SCK_MASK : constant uint32_t := HI_OUT_SCLR_QSPI_GENERIC_SCK_MASK;
   
   function SIO_GPIO_HI_OUT_CLR_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25)); 
   SIO_GPIO_HI_OUT_CLR_USB_DM_MASK : constant uint32_t := HI_OUT_CLR_USB_GENERIC_DM_MASK;
   function SIO_GPIO_HI_OUT_CLR_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   SIO_GPIO_HI_OUT_CLR_USB_DP_MASK : constant uint32_t := HI_OUT_CLR_USB_GENERIC_DP_MASK;
   
   HI_OUT_CLR_GPIO_GENERIC_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#ffff#), 0);
   HI_OUT_XOR_QSPI_GENERIC_SD_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 28);
   HI_OUT_XOR_QSPI_GENERIC_CSN_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27);
   HI_OUT_XOR_QSPI_GENERIC_SCK_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);
   
   HI_OUT_XOR_USB_GENERIC_DM_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);
   HI_OUT_XOR_USB_GENERIC_DP_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24);
   HI_OUT_XOR_GPIO_GENERIC_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#ffff#), 0);
   
   function SIO_GPIO_HI_OUT_CLR_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   SIO_GPIO_HI_OUT_CLR_GPIO_MASK : constant uint32_t := HI_OUT_CLR_GPIO_GENERIC_MASK;
   function SIO_GPIO_HI_OUT_XOR_QSPI_SD (v : uint32_t) return uint32_t is (Shift_Left (v and 16#f#, 28));
   SIO_GPIO_HI_OUT_XOR_QSPI_SD_MASK : constant uint32_t := HI_OUT_XOR_QSPI_GENERIC_SD_MASK;
   function SIO_GPIO_HI_OUT_XOR_QSPI_CSN (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 27));
   SIO_GPIO_HI_OUT_XOR_QSPI_CSN_MASK : constant uint32_t := HI_OUT_XOR_QSPI_GENERIC_CSN_MASK;
   function SIO_GPIO_HI_OUT_XOR_QSPI_SCK (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 26));
   SIO_GPIO_HI_OUT_XOR_QSPI_SCK_MASK : constant uint32_t := HI_OUT_XOR_QSPI_GENERIC_SCK_MASK;
   function SIO_GPIO_HI_OUT_XOR_USB_DM (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 25));
   SIO_GPIO_HI_OUT_XOR_USB_DM_MASK : constant uint32_t := HI_OUT_XOR_USB_GENERIC_DM_MASK;
   function SIO_GPIO_HI_OUT_XOR_USB_DP (v : uint32_t) return uint32_t is (Shift_Left (v and 16#1#, 24));
   SIO_GPIO_HI_OUT_XOR_USB_DP_MASK : constant uint32_t := HI_OUT_XOR_USB_GENERIC_DP_MASK;
   function SIO_GPIO_HI_OUT_XOR_GPIO (v : uint32_t) return uint32_t is (Shift_Left (v and 16#ffff#, 0));
   SIO_GPIO_HI_OUT_XOR_GPIO_MASK : constant uint32_t := HI_OUT_XOR_GPIO_GENERIC_MASK;

   --  GPIO_OUT_SET Register macros

   --  GPIO_HI_OUT_SET Register macros

   --  GPIO_OE Register macros

   --  GPIO_HI_OE Register macros

   HI_OE_QSPI_GENERIC_SD_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 28);
   HI_OE_QSPI_GENERIC_CSN_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27);
   HI_OE_QSPI_GENERIC_SCK_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);
   HI_OE_USB_GENERIC_DM_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);
   HI_OE_USB_GENERIC_DP_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24);   
   HI_OE_GENERIC_GPIO_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#FFFF#), 0);
   
   function SIO_GPIO_HI_OE_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_QSPI_SD_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SD_MASK;  --  SIO_GPIO_HI_OE_QSPI_SD (ALL1);

   function SIO_GPIO_HI_OE_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_QSPI_CSN_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_QSPI_SCK_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK;

   function SIO_GPIO_HI_OE_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_USB_DM_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_USB_DP_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;
   
   
   function SIO_GPIO_HI_OE_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_GPIO_MASK : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;

   function SIO_GPIO_HI_OE_SET_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SD_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SD_MASK;

   function SIO_GPIO_HI_OE_SET_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_CSN_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_SET_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SCK_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK;

   function SIO_GPIO_HI_OE_SET_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DM_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_SET_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DP_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;
   
   function SIO_GPIO_HI_OE_SET_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_SET_GPIO_MASK : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;

   function SIO_GPIO_HI_OE_CLR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SD_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SD_MASK;

   function SIO_GPIO_HI_OE_CLR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_CSN_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_CLR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SCK_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK ;

   function SIO_GPIO_HI_OE_CLR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DM_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_CLR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DP_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;

   function SIO_GPIO_HI_OE_CLR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_CLR_GPIO_MASK : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;
   
    function SIO_GPIO_HI_OE_XOR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SD_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SD_MASK;

   function SIO_GPIO_HI_OE_XOR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_CSN_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_XOR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SCK_MASK : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK;

   function SIO_GPIO_HI_OE_XOR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DM_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_XOR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DP_MASK : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;

   function SIO_GPIO_HI_OE_XOR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_XOR_GPIO_MASK : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;

   --  GPIO_OE_SET Register macros

   function SIO_GPIO_HI_OE_SET_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SD_MASK;

   function SIO_GPIO_HI_OE_SET_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_SET_QSPI_SCK_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_SET_QSPI_SCK_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK;

   function SIO_GPIO_HI_OE_SET_USB_DM_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DM_MASK_Duplicate : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_SET_USB_DP_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_SET_USB_DP_MASK_Duplicate : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;

   function SIO_GPIO_HI_OE_SET_GPIO_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_SET_GPIO_MASK_Duplicate : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;

   --  GPIO_OE_CLR Register macros

   --  GPIO_HI_OE_CLR Register macros

   --  Note: The C original repeats these definitions here.

   function SIO_GPIO_HI_OE_CLR_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_CLR_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_CLR_QSPI_SCK_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_CLR_QSPI_SCK_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK;

   function SIO_GPIO_HI_OE_CLR_USB_DM_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DM_MASK_Duplicate : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_CLR_USB_DP_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_CLR_USB_DP_MASK_Duplicate : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;

   function SIO_GPIO_HI_OE_CLR_GPIO_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_CLR_GPIO_MASK_Duplicate : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;

   --  GPIO_OE_XOR Register macros

   --  GPIO_HI_OE_XOR Register macros

   --  Note: The C original repeats these definitions here.
   function SIO_GPIO_HI_OE_XOR_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SD_MASK;

   function SIO_GPIO_HI_OE_XOR_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_CSN_MASK;

   function SIO_GPIO_HI_OE_XOR_QSPI_SCK_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_GPIO_HI_OE_XOR_QSPI_SCK_MASK_Duplicate : constant Unsigned_32 := HI_OE_QSPI_GENERIC_SCK_MASK;

   function SIO_GPIO_HI_OE_XOR_USB_DM_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DM_MASK_Duplicate : constant Unsigned_32 := HI_OE_USB_GENERIC_DM_MASK;

   function SIO_GPIO_HI_OE_XOR_USB_DP_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_GPIO_HI_OE_XOR_USB_DP_MASK_Duplicate : constant Unsigned_32 := HI_OE_USB_GENERIC_DP_MASK;
  
   function SIO_GPIO_HI_OE_XOR_GPIO_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_GPIO_HI_OE_XOR_GPIO_MASK_Duplicate : constant Unsigned_32 := HI_OE_GENERIC_GPIO_MASK;

   --  FIFO_ST Register macros
   FIFO_ST_GENERIC_ROE_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 3);
   FIFO_ST_GENERIC_WOF_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 2);
   FIFO_ST_GENERIC_RDY_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 1);
   FIFO_ST_GENERIC_VLD_MASK   : constant Unsigned_32 := Unsigned_32'(1);

   function SIO_FIFO_ST_ROE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3)) with Inline;
   SIO_FIFO_ST_ROE_MASK : constant Unsigned_32 := FIFO_ST_GENERIC_ROE_MASK;

   function SIO_FIFO_ST_WOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2)) with Inline;
   SIO_FIFO_ST_WOF_MASK : constant Unsigned_32 := FIFO_ST_GENERIC_WOF_MASK;

   function SIO_FIFO_ST_RDY (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_FIFO_ST_RDY_MASK : constant Unsigned_32 := FIFO_ST_GENERIC_RDY_MASK;

   function SIO_FIFO_ST_VLD (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_FIFO_ST_VLD_MASK : constant Unsigned_32 := FIFO_ST_GENERIC_VLD_MASK;

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
  
   INTERP0_CTRL_LANE_GENERIC_OVERF_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);
   INTERP0_CTRL_LANE_GENERIC_OVERF1_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24);
   INTERP0_CTRL_LANE_GENERIC_OVERF0_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 23);
   INTERP0_CTRL_LANE_GENERIC_BLEND_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 21);
   INTERP0_CTRL_LANE_GENERIC_FORCE_MSB_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 19);

   function SIO_INTERP0_CTRL_LANE0_OVERF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_INTERP0_CTRL_LANE0_OVERF_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_OVERF_MASK;  --  SIO_INTERP0_CTRL_LANE0_OVERF (ALL1);

   function SIO_INTERP0_CTRL_LANE0_OVERF1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_INTERP0_CTRL_LANE0_OVERF1_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_OVERF1_MASK;

   function SIO_INTERP0_CTRL_LANE0_OVERF0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23)) with Inline;
   SIO_INTERP0_CTRL_LANE0_OVERF0_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_OVERF0_MASK;

   function SIO_INTERP0_CTRL_LANE0_BLEND (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21)) with Inline;
   SIO_INTERP0_CTRL_LANE0_BLEND_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_BLEND_MASK;

   function SIO_INTERP0_CTRL_LANE0_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline; 
   SIO_INTERP0_CTRL_LANE0_FORCE_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_FORCE_MSB_MASK;

   INTERP0_CTRL_LANE_GENERIC_ADD_RAW_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 18);
   INTERP0_CTRL_LANE_GENERIC_CROSS_RESULT_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 17);
   INTERP0_CTRL_LANE_GENERIC_CROSS_INPUT_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 16);
   INTERP0_CTRL_LANE_GENERIC_SIGNED_MASK       : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 15);
   INTERP0_CTRL_LANE_GENERIC_MSB_MASK          : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#1F#), 10);
   INTERP0_CTRL_LANE_GENERIC_LSB_MASK          : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#1F#), 5);
   INTERP0_CTRL_LANE_GENERIC_SHIFT_MASK        : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#1F#), 0);
   
   function SIO_INTERP0_CTRL_LANE0_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP0_CTRL_LANE0_ADD_RAW_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_ADD_RAW_MASK;

   function SIO_INTERP0_CTRL_LANE0_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP0_CTRL_LANE0_CROSS_RESULT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_RESULT_MASK;

   function SIO_INTERP0_CTRL_LANE0_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP0_CTRL_LANE0_CROSS_INPUT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_INPUT_MASK;

   function SIO_INTERP0_CTRL_LANE0_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP0_CTRL_LANE0_SIGNED_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SIGNED_MASK;

   function SIO_INTERP0_CTRL_LANE0_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP0_CTRL_LANE0_MASK_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_MSB_MASK;

   function SIO_INTERP0_CTRL_LANE0_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP0_CTRL_LANE0_MASK_LSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_LSB_MASK;

   function SIO_INTERP0_CTRL_LANE0_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP0_CTRL_LANE0_SHIFT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SHIFT_MASK;

   --  INTERP0_CTRL_LANE1 Register macros
   
   function SIO_INTERP0_CTRL_LANE1_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP0_CTRL_LANE1_FORCE_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_FORCE_MSB_MASK;

   function SIO_INTERP0_CTRL_LANE1_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP0_CTRL_LANE1_ADD_RAW_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_ADD_RAW_MASK;

   function SIO_INTERP0_CTRL_LANE1_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP0_CTRL_LANE1_CROSS_RESULT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_RESULT_MASK;

   function SIO_INTERP0_CTRL_LANE1_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP0_CTRL_LANE1_CROSS_INPUT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SIGNED_MASK;

   function SIO_INTERP0_CTRL_LANE1_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP0_CTRL_LANE1_SIGNED_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SIGNED_MASK;

   function SIO_INTERP0_CTRL_LANE1_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP0_CTRL_LANE1_MASK_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_MSB_MASK;

   function SIO_INTERP0_CTRL_LANE1_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP0_CTRL_LANE1_MASK_LSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_LSB_MASK;

   function SIO_INTERP0_CTRL_LANE1_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP0_CTRL_LANE1_SHIFT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SHIFT_MASK;

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

    INTERP_CTRL_LANE_GENERIC_CLAMP_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 22);
   
   function SIO_INTERP1_CTRL_LANE0_OVERF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_INTERP1_CTRL_LANE0_OVERF_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_OVERF_MASK;

   function SIO_INTERP1_CTRL_LANE0_OVERF1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_INTERP1_CTRL_LANE0_OVERF1_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_OVERF1_MASK;

   function SIO_INTERP1_CTRL_LANE0_OVERF0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23)) with Inline;
   SIO_INTERP1_CTRL_LANE0_OVERF0_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_OVERF0_MASK;

   function SIO_INTERP1_CTRL_LANE0_CLAMP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22)) with Inline;
   SIO_INTERP1_CTRL_LANE0_CLAMP_MASK : constant Unsigned_32 := INTERP_CTRL_LANE_GENERIC_CLAMP_MASK;

   function SIO_INTERP1_CTRL_LANE0_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP1_CTRL_LANE0_FORCE_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_FORCE_MSB_MASK;

   function SIO_INTERP1_CTRL_LANE0_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP1_CTRL_LANE0_ADD_RAW_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_ADD_RAW_MASK;
   

   function SIO_INTERP1_CTRL_LANE0_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP1_CTRL_LANE0_CROSS_RESULT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_RESULT_MASK;

   function SIO_INTERP1_CTRL_LANE0_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP1_CTRL_LANE0_CROSS_INPUT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_INPUT_MASK;

   function SIO_INTERP1_CTRL_LANE0_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP1_CTRL_LANE0_SIGNED_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SIGNED_MASK;

   function SIO_INTERP1_CTRL_LANE0_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP1_CTRL_LANE0_MASK_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_MSB_MASK;

   function SIO_INTERP1_CTRL_LANE0_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP1_CTRL_LANE0_MASK_LSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_LSB_MASK;

   function SIO_INTERP1_CTRL_LANE0_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP1_CTRL_LANE0_SHIFT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SHIFT_MASK;

   --  INTERP1_CTRL_LANE1 Register macros

   function SIO_INTERP1_CTRL_LANE1_FORCE_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 19)) with Inline;
   SIO_INTERP1_CTRL_LANE1_FORCE_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_FORCE_MSB_MASK;

   function SIO_INTERP1_CTRL_LANE1_ADD_RAW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18)) with Inline;
   SIO_INTERP1_CTRL_LANE1_ADD_RAW_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_ADD_RAW_MASK;

   function SIO_INTERP1_CTRL_LANE1_CROSS_RESULT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17)) with Inline;
   SIO_INTERP1_CTRL_LANE1_CROSS_RESULT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_RESULT_MASK;

   function SIO_INTERP1_CTRL_LANE1_CROSS_INPUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16)) with Inline;
   SIO_INTERP1_CTRL_LANE1_CROSS_INPUT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_CROSS_INPUT_MASK;

   function SIO_INTERP1_CTRL_LANE1_SIGNED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15)) with Inline;
   SIO_INTERP1_CTRL_LANE1_SIGNED_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SIGNED_MASK;
   
   function SIO_INTERP1_CTRL_LANE1_MASK_MSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 10)) with Inline;
   SIO_INTERP1_CTRL_LANE1_MASK_MSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_MSB_MASK;

   function SIO_INTERP1_CTRL_LANE1_MASK_LSB (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1F#, 5)) with Inline;
   SIO_INTERP1_CTRL_LANE1_MASK_LSB_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_LSB_MASK;

   function SIO_INTERP1_CTRL_LANE1_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1F#) with Inline;
   SIO_INTERP1_CTRL_LANE1_SHIFT_MASK : constant Unsigned_32 := INTERP0_CTRL_LANE_GENERIC_SHIFT_MASK;

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
   
   PERI_NONSEC_GENERIC_TMDS_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 5);
   PERI_NONSEC_GENERIC_INTERP1_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 1);
   PERI_NONSEC_GENERIC_INTERP0_MASK : constant Unsigned_32 := Unsigned_32'(1);

   function SIO_PERI_NONSEC_TMDS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5)) with Inline;
   SIO_PERI_NONSEC_TMDS_MASK : constant Unsigned_32 := PERI_NONSEC_GENERIC_TMDS_MASK;  --  SIO_PERI_NONSEC_TMDS (ALL1);

   function SIO_PERI_NONSEC_INTERP1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_PERI_NONSEC_INTERP1_MASK : constant Unsigned_32 :=  PERI_NONSEC_GENERIC_INTERP1_MASK;

   function SIO_PERI_NONSEC_INTERP0 (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_PERI_NONSEC_INTERP0_MASK : constant Unsigned_32 :=  PERI_NONSEC_GENERIC_INTERP0_MASK;

   --  RISCV_SOFTIRQ Register macros

   RISCV_SOFTIRQ_CORE1_GENERIC_CLR_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 9);
   RISCV_SOFTIRQ_CORE0_GENERIC_CLR_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 8);
   RISCV_SOFTIRQ_CORE1_GENERIC_SET_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 1);
   RISCV_SOFTIRQ_CORE0_GENERIC_SET_MASK    : constant Unsigned_32 := Unsigned_32'(1);
   
   function SIO_RISCV_SOFTIRQ_CORE1_CLR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9)) with Inline;
   SIO_RISCV_SOFTIRQ_CORE1_CLR_MASK : constant Unsigned_32 := RISCV_SOFTIRQ_CORE1_GENERIC_CLR_MASK;

   function SIO_RISCV_SOFTIRQ_CORE0_CLR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8)) with Inline;
   SIO_RISCV_SOFTIRQ_CORE0_CLR_MASK : constant Unsigned_32 := RISCV_SOFTIRQ_CORE0_GENERIC_CLR_MASK;

   function SIO_RISCV_SOFTIRQ_CORE1_SET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_RISCV_SOFTIRQ_CORE1_SET_MASK : constant Unsigned_32 := RISCV_SOFTIRQ_CORE1_GENERIC_SET_MASK;

   function SIO_RISCV_SOFTIRQ_CORE0_SET (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_RISCV_SOFTIRQ_CORE0_SET_MASK : constant Unsigned_32 := RISCV_SOFTIRQ_CORE0_GENERIC_SET_MASK;

   --  MTIME_CTRL Register macros
   MTIME_GENERIC_DBGPAUSE_CORE1_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 3);
   MTIME_GENERIC_DBGPAUSE_CORE0_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 2);
   MTIME_GENERIC_FULLSPEED_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 1);
   MTIME_GENERIC_EN_MASK             : constant Unsigned_32 := Unsigned_32'(1);
   
   function SIO_MTIME_CTRL_DBGPAUSE_CORE1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3)) with Inline;
   SIO_MTIME_CTRL_DBGPAUSE_CORE1_MASK : constant Unsigned_32 := MTIME_GENERIC_DBGPAUSE_CORE1_MASK;

   function SIO_MTIME_CTRL_DBGPAUSE_CORE0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2)) with Inline;
   SIO_MTIME_CTRL_DBGPAUSE_CORE0_MASK : constant Unsigned_32 := MTIME_GENERIC_DBGPAUSE_CORE0_MASK;

   function SIO_MTIME_CTRL_FULLSPEED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_MTIME_CTRL_FULLSPEED_MASK : constant Unsigned_32 := MTIME_GENERIC_FULLSPEED_MASK;

   function SIO_MTIME_CTRL_EN (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_MTIME_CTRL_EN_MASK : constant Unsigned_32 := MTIME_GENERIC_EN_MASK;

   --  MTIME Register macros

   --  Note: The C original repeats the CTRL macros under the MTIME header.
   function SIO_MTIME_DBGPAUSE_CORE1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3)) with Inline;
   SIO_MTIME_DBGPAUSE_CORE1_MASK : constant Unsigned_32 := MTIME_GENERIC_DBGPAUSE_CORE1_MASK;

   function SIO_MTIME_DBGPAUSE_CORE0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2)) with Inline;
   SIO_MTIME_DBGPAUSE_CORE0_MASK : constant Unsigned_32 := MTIME_GENERIC_DBGPAUSE_CORE0_MASK;

   function SIO_MTIME_FULLSPEED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1)) with Inline;
   SIO_MTIME_FULLSPEED_MASK : constant Unsigned_32 := MTIME_GENERIC_FULLSPEED_MASK;

   function SIO_MTIME_EN (v : Unsigned_32) return Unsigned_32 is
     (v and 16#1#) with Inline;
   SIO_MTIME_EN_MASK : constant Unsigned_32 := MTIME_GENERIC_EN_MASK;

   --  MTIMEH Register macros

   --  MTIMECMP Register macros

   --  MTIMECMPH Register macros

   --  TMDS_CTRL Register macros
   TMDS_CTRL_GENERIC_CLEAR_BALANCE_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 28);
   TMDS_CTRL_GENERIC_PIX2_NOSHIFT_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27);
   TMDS_CTRL_GENERIC_PIX_SHIFT_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(7), 24);
   TMDS_CTRL_GENERIC_INTERLEAVE_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 23);
   TMDS_CTRL_GENERIC_L2_NBITS_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(7), 18);  
   TMDS_CTRL_GENERIC_L1_NBITS_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(7), 15);
   TMDS_CTRL_GENERIC_L0_NBITS_MASK      : constant Unsigned_32 := Shift_Left (Unsigned_32'(7), 12);
   TMDS_CTRL_GENERIC_L2_ROT_MASK        : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 8);
   TMDS_CTRL_GENERIC_L1_ROT_MASK        : constant Unsigned_32 := Shift_Left (Unsigned_32'(15), 4);
   TMDS_CTRL_GENERIC_L0_ROT_MASK        : constant Unsigned_32 := Unsigned_32'(15);

   function SIO_TMDS_CTRL_CLEAR_BALANCE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 28)) with Inline;
   SIO_TMDS_CTRL_CLEAR_BALANCE_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_CLEAR_BALANCE_MASK;

   function SIO_TMDS_CTRL_PIX2_NOSHIFT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_TMDS_CTRL_PIX2_NOSHIFT_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_PIX2_NOSHIFT_MASK;

   function SIO_TMDS_CTRL_PIX_SHIFT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 24)) with Inline;
   SIO_TMDS_CTRL_PIX_SHIFT_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_PIX_SHIFT_MASK;

   function SIO_TMDS_CTRL_INTERLEAVE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23)) with Inline;
   SIO_TMDS_CTRL_INTERLEAVE_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_INTERLEAVE_MASK;

   function SIO_TMDS_CTRL_L2_NBITS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 18)) with Inline;
   SIO_TMDS_CTRL_L2_NBITS_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_L2_NBITS_MASK;
   
   function SIO_TMDS_CTRL_L1_NBITS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 15)) with Inline;
   SIO_TMDS_CTRL_L1_NBITS_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_L1_NBITS_MASK;

   function SIO_TMDS_CTRL_L0_NBITS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 12)) with Inline;
   SIO_TMDS_CTRL_L0_NBITS_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_L0_NBITS_MASK;

   function SIO_TMDS_CTRL_L2_ROT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 8)) with Inline;
   SIO_TMDS_CTRL_L2_ROT_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_L2_ROT_MASK;

   function SIO_TMDS_CTRL_L1_ROT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 4)) with Inline;
   SIO_TMDS_CTRL_L1_ROT_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_L1_ROT_MASK;

   function SIO_TMDS_CTRL_L0_ROT (v : Unsigned_32) return Unsigned_32 is
     (v and 16#F#) with Inline;
   SIO_TMDS_CTRL_L0_ROT_MASK : constant Unsigned_32 := TMDS_CTRL_GENERIC_L0_ROT_MASK;

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
   SIO_NONSEC_GPIO_HI_IN_QSPI_SD_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SD_MASK;

   function SIO_NONSEC_GPIO_HI_IN_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_QSPI_CSN_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_CSN_MASK;

   function SIO_NONSEC_GPIO_HI_IN_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_QSPI_SCK_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SCK_MASK;

   function SIO_NONSEC_GPIO_HI_IN_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_USB_DM_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DM_MASK;

   function SIO_NONSEC_GPIO_HI_IN_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_IN_USB_DP_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DP_MASK;

   function SIO_NONSEC_GPIO_HI_IN_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_IN_GPIO_MASK : constant Unsigned_32 := HI_INOUT_GENERIC_GPIO_MASK;

   --  GPIO_OUT Register macros

   --  GPIO_HI_OUT Register macros


   function SIO_NONSEC_GPIO_HI_OUT_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_QSPI_SD_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SD_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_QSPI_CSN_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_CSN_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_QSPI_SCK_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SCK_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_USB_DM_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DM_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_USB_DP_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DP_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_GPIO_MASK : constant Unsigned_32 := HI_INOUT_GENERIC_GPIO_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SD_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_CSN_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SCK_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SCK_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_SET_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_USB_DM_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DM_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_SET_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_USB_DP_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DP_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_SET_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_GPIO_MASK : constant Unsigned_32 := HI_INOUT_GENERIC_GPIO_MASK;
   

   function SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SD_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SD_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_CSN_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_CSN_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_QSPI_SCK_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SCK_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DM_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DM_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_USB_DP_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DP_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_CLR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_CLR_GPIO_MASK : constant Unsigned_32 := HI_INOUT_GENERIC_GPIO_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SD_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SD_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_CSN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_CSN_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_CSN_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SCK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_QSPI_SCK_MASK : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SCK_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DM_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DM_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DP (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_USB_DP_MASK : constant Unsigned_32 := HI_INOUT_USB_GENERIC_DP_MASK;

   function SIO_NONSEC_GPIO_HI_OUT_XOR_GPIO (v : Unsigned_32) return Unsigned_32 is
     (v and 16#FFFF#) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_XOR_GPIO_MASK : constant Unsigned_32 := HI_INOUT_GENERIC_GPIO_MASK;

   --  GPIO_OUT_SET Register macros

   --  GPIO_HI_OUT_SET Register macros
   
   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#F#, 28)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_SD_MASK_Duplicate : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_SD_MASK;

   --  Note: The input C snippet ended with a partial macro for SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN.
   --  It is completed here based on the established pattern to provide valid code.
   function SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_Duplicate (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27)) with Inline;
   SIO_NONSEC_GPIO_HI_OUT_SET_QSPI_CSN_MASK_Duplicate : constant Unsigned_32 := HI_INOUT_QSPI_GENERIC_CSN_MASK;

end RP2350_SIO;
