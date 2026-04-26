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

package RP2350_IO_Bank0 is
   pragma Preelaborate;

   type Reserved_32_Array is array (0 .. 31) of Unsigned_32;
   type Reserved_824_Array is array (0 .. 823) of Unsigned_32;

   type IO_BANK0_REG_BLOCKS is record
      -- Standard Access Registers
      gpio0_status                         : Unsigned_32 := 0;
      gpio0_ctrl                           : Unsigned_32 := 0;
      gpio1_status                         : Unsigned_32 := 0;
      gpio1_ctrl                           : Unsigned_32 := 0;
      gpio2_status                         : Unsigned_32 := 0;
      gpio2_ctrl                           : Unsigned_32 := 0;
      gpio3_status                         : Unsigned_32 := 0;
      gpio3_ctrl                           : Unsigned_32 := 0;
      gpio4_status                         : Unsigned_32 := 0;
      gpio4_ctrl                           : Unsigned_32 := 0;
      gpio5_status                         : Unsigned_32 := 0;
      gpio5_ctrl                           : Unsigned_32 := 0;
      gpio6_status                         : Unsigned_32 := 0;
      gpio6_ctrl                           : Unsigned_32 := 0;
      gpio7_status                         : Unsigned_32 := 0;
      gpio7_ctrl                           : Unsigned_32 := 0;
      gpio8_status                         : Unsigned_32 := 0;
      gpio8_ctrl                           : Unsigned_32 := 0;
      gpio9_status                         : Unsigned_32 := 0;
      gpio9_ctrl                           : Unsigned_32 := 0;
      gpio10_status                        : Unsigned_32 := 0;
      gpio10_ctrl                          : Unsigned_32 := 0;
      gpio11_status                        : Unsigned_32 := 0;
      gpio11_ctrl                          : Unsigned_32 := 0;
      gpio12_status                        : Unsigned_32 := 0;
      gpio12_ctrl                          : Unsigned_32 := 0;
      gpio13_status                        : Unsigned_32 := 0;
      gpio13_ctrl                          : Unsigned_32 := 0;
      gpio14_status                        : Unsigned_32 := 0;
      gpio14_ctrl                          : Unsigned_32 := 0;
      gpio15_status                        : Unsigned_32 := 0;
      gpio15_ctrl                          : Unsigned_32 := 0;
      gpio16_status                        : Unsigned_32 := 0;
      gpio16_ctrl                          : Unsigned_32 := 0;
      gpio17_status                        : Unsigned_32 := 0;
      gpio17_ctrl                          : Unsigned_32 := 0;
      gpio18_status                        : Unsigned_32 := 0;
      gpio18_ctrl                          : Unsigned_32 := 0;
      gpio19_status                        : Unsigned_32 := 0;
      gpio19_ctrl                          : Unsigned_32 := 0;
      gpio20_status                        : Unsigned_32 := 0;
      gpio20_ctrl                          : Unsigned_32 := 0;
      gpio21_status                        : Unsigned_32 := 0;
      gpio21_ctrl                          : Unsigned_32 := 0;
      gpio22_status                        : Unsigned_32 := 0;
      gpio22_ctrl                          : Unsigned_32 := 0;
      gpio23_status                        : Unsigned_32 := 0;
      gpio23_ctrl                          : Unsigned_32 := 0;
      gpio24_status                        : Unsigned_32 := 0;
      gpio24_ctrl                          : Unsigned_32 := 0;
      gpio25_status                        : Unsigned_32 := 0;
      gpio25_ctrl                          : Unsigned_32 := 0;
      gpio26_status                        : Unsigned_32 := 0;
      gpio26_ctrl                          : Unsigned_32 := 0;
      gpio27_status                        : Unsigned_32 := 0;
      gpio27_ctrl                          : Unsigned_32 := 0;
      gpio28_status                        : Unsigned_32 := 0;
      gpio28_ctrl                          : Unsigned_32 := 0;
      gpio29_status                        : Unsigned_32 := 0;
      gpio29_ctrl                          : Unsigned_32 := 0;
      gpio30_status                        : Unsigned_32 := 0;
      gpio30_ctrl                          : Unsigned_32 := 0;
      gpio31_status                        : Unsigned_32 := 0;
      gpio31_ctrl                          : Unsigned_32 := 0;
      gpio32_status                        : Unsigned_32 := 0;
      gpio32_ctrl                          : Unsigned_32 := 0;
      gpio33_status                        : Unsigned_32 := 0;
      gpio33_ctrl                          : Unsigned_32 := 0;
      gpio34_status                        : Unsigned_32 := 0;
      gpio34_ctrl                          : Unsigned_32 := 0;
      gpio35_status                        : Unsigned_32 := 0;
      gpio35_ctrl                          : Unsigned_32 := 0;
      gpio36_status                        : Unsigned_32 := 0;
      gpio36_ctrl                          : Unsigned_32 := 0;
      gpio37_status                        : Unsigned_32 := 0;
      gpio37_ctrl                          : Unsigned_32 := 0;
      gpio38_status                        : Unsigned_32 := 0;
      gpio38_ctrl                          : Unsigned_32 := 0;
      gpio39_status                        : Unsigned_32 := 0;
      gpio39_ctrl                          : Unsigned_32 := 0;
      gpio40_status                        : Unsigned_32 := 0;
      gpio40_ctrl                          : Unsigned_32 := 0;
      gpio41_status                        : Unsigned_32 := 0;
      gpio41_ctrl                          : Unsigned_32 := 0;
      gpio42_status                        : Unsigned_32 := 0;
      gpio42_ctrl                          : Unsigned_32 := 0;
      gpio43_status                        : Unsigned_32 := 0;
      gpio43_ctrl                          : Unsigned_32 := 0;
      gpio44_status                        : Unsigned_32 := 0;
      gpio44_ctrl                          : Unsigned_32 := 0;
      gpio45_status                        : Unsigned_32 := 0;
      gpio45_ctrl                          : Unsigned_32 := 0;
      gpio46_status                        : Unsigned_32 := 0;
      gpio46_ctrl                          : Unsigned_32 := 0;
      gpio47_status                        : Unsigned_32 := 0;
      gpio47_ctrl                          : Unsigned_32 := 0;
      RSVD0                                : Reserved_32_Array;
      irqsummary_proc0_secure0             : Unsigned_32 := 0;
      irqsummary_proc0_secure1             : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure0          : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure1          : Unsigned_32 := 0;
      irqsummary_proc1_secure0             : Unsigned_32 := 0;
      irqsummary_proc1_secure1             : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure0          : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure1          : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure0      : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure1      : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure0   : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure1   : Unsigned_32 := 0;
      intr0                                : Unsigned_32 := 0;
      intr1                                : Unsigned_32 := 0;
      intr2                                : Unsigned_32 := 0;
      intr3                                : Unsigned_32 := 0;
      intr4                                : Unsigned_32 := 0;
      intr5                                : Unsigned_32 := 0;
      proc0_inte0                          : Unsigned_32 := 0;
      proc0_inte1                          : Unsigned_32 := 0;
      proc0_inte2                          : Unsigned_32 := 0;
      proc0_inte3                          : Unsigned_32 := 0;
      proc0_inte4                          : Unsigned_32 := 0;
      proc0_inte5                          : Unsigned_32 := 0;
      proc0_intf0                          : Unsigned_32 := 0;
      proc0_intf1                          : Unsigned_32 := 0;
      proc0_intf2                          : Unsigned_32 := 0;
      proc0_intf3                          : Unsigned_32 := 0;
      proc0_intf4                          : Unsigned_32 := 0;
      proc0_intf5                          : Unsigned_32 := 0;
      proc0_ints0                          : Unsigned_32 := 0;
      proc0_ints1                          : Unsigned_32 := 0;
      proc0_ints2                          : Unsigned_32 := 0;
      proc0_ints3                          : Unsigned_32 := 0;
      proc0_ints4                          : Unsigned_32 := 0;
      proc0_ints5                          : Unsigned_32 := 0;
      proc1_inte0                          : Unsigned_32 := 0;
      proc1_inte1                          : Unsigned_32 := 0;
      proc1_inte2                          : Unsigned_32 := 0;
      proc1_inte3                          : Unsigned_32 := 0;
      proc1_inte4                          : Unsigned_32 := 0;
      proc1_inte5                          : Unsigned_32 := 0;
      proc1_intf0                          : Unsigned_32 := 0;
      proc1_intf1                          : Unsigned_32 := 0;
      proc1_intf2                          : Unsigned_32 := 0;
      proc1_intf3                          : Unsigned_32 := 0;
      proc1_intf4                          : Unsigned_32 := 0;
      proc1_intf5                          : Unsigned_32 := 0;
      proc1_ints0                          : Unsigned_32 := 0;
      proc1_ints1                          : Unsigned_32 := 0;
      proc1_ints2                          : Unsigned_32 := 0;
      proc1_ints3                          : Unsigned_32 := 0;
      proc1_ints4                          : Unsigned_32 := 0;
      proc1_ints5                          : Unsigned_32 := 0;
      dormant_wake_inte0                   : Unsigned_32 := 0;
      dormant_wake_inte1                   : Unsigned_32 := 0;
      dormant_wake_inte2                   : Unsigned_32 := 0;
      dormant_wake_inte3                   : Unsigned_32 := 0;
      dormant_wake_inte4                   : Unsigned_32 := 0;
      dormant_wake_inte5                   : Unsigned_32 := 0;
      dormant_wake_intf0                   : Unsigned_32 := 0;
      dormant_wake_intf1                   : Unsigned_32 := 0;
      dormant_wake_intf2                   : Unsigned_32 := 0;
      dormant_wake_intf3                   : Unsigned_32 := 0;
      dormant_wake_intf4                   : Unsigned_32 := 0;
      dormant_wake_intf5                   : Unsigned_32 := 0;
      dormant_wake_ints0                   : Unsigned_32 := 0;
      dormant_wake_ints1                   : Unsigned_32 := 0;
      dormant_wake_ints2                   : Unsigned_32 := 0;
      dormant_wake_ints3                   : Unsigned_32 := 0;
      dormant_wake_ints4                   : Unsigned_32 := 0;
      dormant_wake_ints5                   : Unsigned_32 := 0;
      RSVD1                                : Reserved_824_Array;

      -- XOR Access Registers
      gpio0_status_xor                     : Unsigned_32 := 0;
      gpio0_ctrl_xor                       : Unsigned_32 := 0;
      gpio1_status_xor                     : Unsigned_32 := 0;
      gpio1_ctrl_xor                       : Unsigned_32 := 0;
      gpio2_status_xor                     : Unsigned_32 := 0;
      gpio2_ctrl_xor                       : Unsigned_32 := 0;
      gpio3_status_xor                     : Unsigned_32 := 0;
      gpio3_ctrl_xor                       : Unsigned_32 := 0;
      gpio4_status_xor                     : Unsigned_32 := 0;
      gpio4_ctrl_xor                       : Unsigned_32 := 0;
      gpio5_status_xor                     : Unsigned_32 := 0;
      gpio5_ctrl_xor                       : Unsigned_32 := 0;
      gpio6_status_xor                     : Unsigned_32 := 0;
      gpio6_ctrl_xor                       : Unsigned_32 := 0;
      gpio7_status_xor                     : Unsigned_32 := 0;
      gpio7_ctrl_xor                       : Unsigned_32 := 0;
      gpio8_status_xor                     : Unsigned_32 := 0;
      gpio8_ctrl_xor                       : Unsigned_32 := 0;
      gpio9_status_xor                     : Unsigned_32 := 0;
      gpio9_ctrl_xor                       : Unsigned_32 := 0;
      gpio10_status_xor                    : Unsigned_32 := 0;
      gpio10_ctrl_xor                      : Unsigned_32 := 0;
      gpio11_status_xor                    : Unsigned_32 := 0;
      gpio11_ctrl_xor                      : Unsigned_32 := 0;
      gpio12_status_xor                    : Unsigned_32 := 0;
      gpio12_ctrl_xor                      : Unsigned_32 := 0;
      gpio13_status_xor                    : Unsigned_32 := 0;
      gpio13_ctrl_xor                      : Unsigned_32 := 0;
      gpio14_status_xor                    : Unsigned_32 := 0;
      gpio14_ctrl_xor                      : Unsigned_32 := 0;
      gpio15_status_xor                    : Unsigned_32 := 0;
      gpio15_ctrl_xor                      : Unsigned_32 := 0;
      gpio16_status_xor                    : Unsigned_32 := 0;
      gpio16_ctrl_xor                      : Unsigned_32 := 0;
      gpio17_status_xor                    : Unsigned_32 := 0;
      gpio17_ctrl_xor                      : Unsigned_32 := 0;
      gpio18_status_xor                    : Unsigned_32 := 0;
      gpio18_ctrl_xor                      : Unsigned_32 := 0;
      gpio19_status_xor                    : Unsigned_32 := 0;
      gpio19_ctrl_xor                      : Unsigned_32 := 0;
      gpio20_status_xor                    : Unsigned_32 := 0;
      gpio20_ctrl_xor                      : Unsigned_32 := 0;
      gpio21_status_xor                    : Unsigned_32 := 0;
      gpio21_ctrl_xor                      : Unsigned_32 := 0;
      gpio22_status_xor                    : Unsigned_32 := 0;
      gpio22_ctrl_xor                      : Unsigned_32 := 0;
      gpio23_status_xor                    : Unsigned_32 := 0;
      gpio23_ctrl_xor                      : Unsigned_32 := 0;
      gpio24_status_xor                    : Unsigned_32 := 0;
      gpio24_ctrl_xor                      : Unsigned_32 := 0;
      gpio25_status_xor                    : Unsigned_32 := 0;
      gpio25_ctrl_xor                      : Unsigned_32 := 0;
      gpio26_status_xor                    : Unsigned_32 := 0;
      gpio26_ctrl_xor                      : Unsigned_32 := 0;
      gpio27_status_xor                    : Unsigned_32 := 0;
      gpio27_ctrl_xor                      : Unsigned_32 := 0;
      gpio28_status_xor                    : Unsigned_32 := 0;
      gpio28_ctrl_xor                      : Unsigned_32 := 0;
      gpio29_status_xor                    : Unsigned_32 := 0;
      gpio29_ctrl_xor                      : Unsigned_32 := 0;
      gpio30_status_xor                    : Unsigned_32 := 0;
      gpio30_ctrl_xor                      : Unsigned_32 := 0;
      gpio31_status_xor                    : Unsigned_32 := 0;
      gpio31_ctrl_xor                      : Unsigned_32 := 0;
      gpio32_status_xor                    : Unsigned_32 := 0;
      gpio32_ctrl_xor                      : Unsigned_32 := 0;
      gpio33_status_xor                    : Unsigned_32 := 0;
      gpio33_ctrl_xor                      : Unsigned_32 := 0;
      gpio34_status_xor                    : Unsigned_32 := 0;
      gpio34_ctrl_xor                      : Unsigned_32 := 0;
      gpio35_status_xor                    : Unsigned_32 := 0;
      gpio35_ctrl_xor                      : Unsigned_32 := 0;
      gpio36_status_xor                    : Unsigned_32 := 0;
      gpio36_ctrl_xor                      : Unsigned_32 := 0;
      gpio37_status_xor                    : Unsigned_32 := 0;
      gpio37_ctrl_xor                      : Unsigned_32 := 0;
      gpio38_status_xor                    : Unsigned_32 := 0;
      gpio38_ctrl_xor                      : Unsigned_32 := 0;
      gpio39_status_xor                    : Unsigned_32 := 0;
      gpio39_ctrl_xor                      : Unsigned_32 := 0;
      gpio40_status_xor                    : Unsigned_32 := 0;
      gpio40_ctrl_xor                      : Unsigned_32 := 0;
      gpio41_status_xor                    : Unsigned_32 := 0;
      gpio41_ctrl_xor                      : Unsigned_32 := 0;
      gpio42_status_xor                    : Unsigned_32 := 0;
      gpio42_ctrl_xor                      : Unsigned_32 := 0;
      gpio43_status_xor                    : Unsigned_32 := 0;
      gpio43_ctrl_xor                      : Unsigned_32 := 0;
      gpio44_status_xor                    : Unsigned_32 := 0;
      gpio44_ctrl_xor                      : Unsigned_32 := 0;
      gpio45_status_xor                    : Unsigned_32 := 0;
      gpio45_ctrl_xor                      : Unsigned_32 := 0;
      gpio46_status_xor                    : Unsigned_32 := 0;
      gpio46_ctrl_xor                      : Unsigned_32 := 0;
      gpio47_status_xor                    : Unsigned_32 := 0;
      gpio47_ctrl_xor                      : Unsigned_32 := 0;
      RSVDxor_0                            : Reserved_32_Array;
      irqsummary_proc0_secure0_xor         : Unsigned_32 := 0;
      irqsummary_proc0_secure1_xor         : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure0_xor      : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure1_xor      : Unsigned_32 := 0;
      irqsummary_proc1_secure0_xor         : Unsigned_32 := 0;
      irqsummary_proc1_secure1_xor         : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure0_xor      : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure1_xor      : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure0_xor  : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure1_xor  : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure0_xor : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure1_xor : Unsigned_32 := 0;
      intr0_xor                            : Unsigned_32 := 0;
      intr1_xor                            : Unsigned_32 := 0;
      intr2_xor                            : Unsigned_32 := 0;
      intr3_xor                            : Unsigned_32 := 0;
      intr4_xor                            : Unsigned_32 := 0;
      intr5_xor                            : Unsigned_32 := 0;
      proc0_inte0_xor                      : Unsigned_32 := 0;
      proc0_inte1_xor                      : Unsigned_32 := 0;
      proc0_inte2_xor                      : Unsigned_32 := 0;
      proc0_inte3_xor                      : Unsigned_32 := 0;
      proc0_inte4_xor                      : Unsigned_32 := 0;
      proc0_inte5_xor                      : Unsigned_32 := 0;
      proc0_intf0_xor                      : Unsigned_32 := 0;
      proc0_intf1_xor                      : Unsigned_32 := 0;
      proc0_intf2_xor                      : Unsigned_32 := 0;
      proc0_intf3_xor                      : Unsigned_32 := 0;
      proc0_intf4_xor                      : Unsigned_32 := 0;
      proc0_intf5_xor                      : Unsigned_32 := 0;
      proc0_ints0_xor                      : Unsigned_32 := 0;
      proc0_ints1_xor                      : Unsigned_32 := 0;
      proc0_ints2_xor                      : Unsigned_32 := 0;
      proc0_ints3_xor                      : Unsigned_32 := 0;
      proc0_ints4_xor                      : Unsigned_32 := 0;
      proc0_ints5_xor                      : Unsigned_32 := 0;
      proc1_inte0_xor                      : Unsigned_32 := 0;
      proc1_inte1_xor                      : Unsigned_32 := 0;
      proc1_inte2_xor                      : Unsigned_32 := 0;
      proc1_inte3_xor                      : Unsigned_32 := 0;
      proc1_inte4_xor                      : Unsigned_32 := 0;
      proc1_inte5_xor                      : Unsigned_32 := 0;
      proc1_intf0_xor                      : Unsigned_32 := 0;
      proc1_intf1_xor                      : Unsigned_32 := 0;
      proc1_intf2_xor                      : Unsigned_32 := 0;
      proc1_intf3_xor                      : Unsigned_32 := 0;
      proc1_intf4_xor                      : Unsigned_32 := 0;
      proc1_intf5_xor                      : Unsigned_32 := 0;
      proc1_ints0_xor                      : Unsigned_32 := 0;
      proc1_ints1_xor                      : Unsigned_32 := 0;
      proc1_ints2_xor                      : Unsigned_32 := 0;
      proc1_ints3_xor                      : Unsigned_32 := 0;
      proc1_ints4_xor                      : Unsigned_32 := 0;
      proc1_ints5_xor                      : Unsigned_32 := 0;
      dormant_wake_inte0_xor               : Unsigned_32 := 0;
      dormant_wake_inte1_xor               : Unsigned_32 := 0;
      dormant_wake_inte2_xor               : Unsigned_32 := 0;
      dormant_wake_inte3_xor               : Unsigned_32 := 0;
      dormant_wake_inte4_xor               : Unsigned_32 := 0;
      dormant_wake_inte5_xor               : Unsigned_32 := 0;
      dormant_wake_intf0_xor               : Unsigned_32 := 0;
      dormant_wake_intf1_xor               : Unsigned_32 := 0;
      dormant_wake_intf2_xor               : Unsigned_32 := 0;
      dormant_wake_intf3_xor               : Unsigned_32 := 0;
      dormant_wake_intf4_xor               : Unsigned_32 := 0;
      dormant_wake_intf5_xor               : Unsigned_32 := 0;
      dormant_wake_ints0_xor               : Unsigned_32 := 0;
      dormant_wake_ints1_xor               : Unsigned_32 := 0;
      dormant_wake_ints2_xor               : Unsigned_32 := 0;
      dormant_wake_ints3_xor               : Unsigned_32 := 0;
      dormant_wake_ints4_xor               : Unsigned_32 := 0;
      dormant_wake_ints5_xor               : Unsigned_32 := 0;
      RSVDxor_1                            : Reserved_824_Array;

      -- SET Access Registers
      gpio0_status_set                     : Unsigned_32 := 0;
      gpio0_ctrl_set                       : Unsigned_32 := 0;
      gpio1_status_set                     : Unsigned_32 := 0;
      gpio1_ctrl_set                       : Unsigned_32 := 0;
      gpio2_status_set                     : Unsigned_32 := 0;
      gpio2_ctrl_set                       : Unsigned_32 := 0;
      gpio3_status_set                     : Unsigned_32 := 0;
      gpio3_ctrl_set                       : Unsigned_32 := 0;
      gpio4_status_set                     : Unsigned_32 := 0;
      gpio4_ctrl_set                       : Unsigned_32 := 0;
      gpio5_status_set                     : Unsigned_32 := 0;
      gpio5_ctrl_set                       : Unsigned_32 := 0;
      gpio6_status_set                     : Unsigned_32 := 0;
      gpio6_ctrl_set                       : Unsigned_32 := 0;
      gpio7_status_set                     : Unsigned_32 := 0;
      gpio7_ctrl_set                       : Unsigned_32 := 0;
      gpio8_status_set                     : Unsigned_32 := 0;
      gpio8_ctrl_set                       : Unsigned_32 := 0;
      gpio9_status_set                     : Unsigned_32 := 0;
      gpio9_ctrl_set                       : Unsigned_32 := 0;
      gpio10_status_set                    : Unsigned_32 := 0;
      gpio10_ctrl_set                      : Unsigned_32 := 0;
      gpio11_status_set                    : Unsigned_32 := 0;
      gpio11_ctrl_set                      : Unsigned_32 := 0;
      gpio12_status_set                    : Unsigned_32 := 0;
      gpio12_ctrl_set                      : Unsigned_32 := 0;
      gpio13_status_set                    : Unsigned_32 := 0;
      gpio13_ctrl_set                      : Unsigned_32 := 0;
      gpio14_status_set                    : Unsigned_32 := 0;
      gpio14_ctrl_set                      : Unsigned_32 := 0;
      gpio15_status_set                    : Unsigned_32 := 0;
      gpio15_ctrl_set                      : Unsigned_32 := 0;
      gpio16_status_set                    : Unsigned_32 := 0;
      gpio16_ctrl_set                      : Unsigned_32 := 0;
      gpio17_status_set                    : Unsigned_32 := 0;
      gpio17_ctrl_set                      : Unsigned_32 := 0;
      gpio18_status_set                    : Unsigned_32 := 0;
      gpio18_ctrl_set                      : Unsigned_32 := 0;
      gpio19_status_set                    : Unsigned_32 := 0;
      gpio19_ctrl_set                      : Unsigned_32 := 0;
      gpio20_status_set                    : Unsigned_32 := 0;
      gpio20_ctrl_set                      : Unsigned_32 := 0;
      gpio21_status_set                    : Unsigned_32 := 0;
      gpio21_ctrl_set                      : Unsigned_32 := 0;
      gpio22_status_set                    : Unsigned_32 := 0;
      gpio22_ctrl_set                      : Unsigned_32 := 0;
      gpio23_status_set                    : Unsigned_32 := 0;
      gpio23_ctrl_set                      : Unsigned_32 := 0;
      gpio24_status_set                    : Unsigned_32 := 0;
      gpio24_ctrl_set                      : Unsigned_32 := 0;
      gpio25_status_set                    : Unsigned_32 := 0;
      gpio25_ctrl_set                      : Unsigned_32 := 0;
      gpio26_status_set                    : Unsigned_32 := 0;
      gpio26_ctrl_set                      : Unsigned_32 := 0;
      gpio27_status_set                    : Unsigned_32 := 0;
      gpio27_ctrl_set                      : Unsigned_32 := 0;
      gpio28_status_set                    : Unsigned_32 := 0;
      gpio28_ctrl_set                      : Unsigned_32 := 0;
      gpio29_status_set                    : Unsigned_32 := 0;
      gpio29_ctrl_set                      : Unsigned_32 := 0;
      gpio30_status_set                    : Unsigned_32 := 0;
      gpio30_ctrl_set                      : Unsigned_32 := 0;
      gpio31_status_set                    : Unsigned_32 := 0;
      gpio31_ctrl_set                      : Unsigned_32 := 0;
      gpio32_status_set                    : Unsigned_32 := 0;
      gpio32_ctrl_set                      : Unsigned_32 := 0;
      gpio33_status_set                    : Unsigned_32 := 0;
      gpio33_ctrl_set                      : Unsigned_32 := 0;
      gpio34_status_set                    : Unsigned_32 := 0;
      gpio34_ctrl_set                      : Unsigned_32 := 0;
      gpio35_status_set                    : Unsigned_32 := 0;
      gpio35_ctrl_set                      : Unsigned_32 := 0;
      gpio36_status_set                    : Unsigned_32 := 0;
      gpio36_ctrl_set                      : Unsigned_32 := 0;
      gpio37_status_set                    : Unsigned_32 := 0;
      gpio37_ctrl_set                      : Unsigned_32 := 0;
      gpio38_status_set                    : Unsigned_32 := 0;
      gpio38_ctrl_set                      : Unsigned_32 := 0;
      gpio39_status_set                    : Unsigned_32 := 0;
      gpio39_ctrl_set                      : Unsigned_32 := 0;
      gpio40_status_set                    : Unsigned_32 := 0;
      gpio40_ctrl_set                      : Unsigned_32 := 0;
      gpio41_status_set                    : Unsigned_32 := 0;
      gpio41_ctrl_set                      : Unsigned_32 := 0;
      gpio42_status_set                    : Unsigned_32 := 0;
      gpio42_ctrl_set                      : Unsigned_32 := 0;
      gpio43_status_set                    : Unsigned_32 := 0;
      gpio43_ctrl_set                      : Unsigned_32 := 0;
      gpio44_status_set                    : Unsigned_32 := 0;
      gpio44_ctrl_set                      : Unsigned_32 := 0;
      gpio45_status_set                    : Unsigned_32 := 0;
      gpio45_ctrl_set                      : Unsigned_32 := 0;
      gpio46_status_set                    : Unsigned_32 := 0;
      gpio46_ctrl_set                      : Unsigned_32 := 0;
      gpio47_status_set                    : Unsigned_32 := 0;
      gpio47_ctrl_set                      : Unsigned_32 := 0;
      RSVDset_0                            : Reserved_32_Array;
      irqsummary_proc0_secure0_set         : Unsigned_32 := 0;
      irqsummary_proc0_secure1_set         : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure0_set      : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure1_set      : Unsigned_32 := 0;
      irqsummary_proc1_secure0_set         : Unsigned_32 := 0;
      irqsummary_proc1_secure1_set         : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure0_set      : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure1_set      : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure0_set  : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure1_set  : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure0_set : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure1_set : Unsigned_32 := 0;
      intr0_set                            : Unsigned_32 := 0;
      intr1_set                            : Unsigned_32 := 0;
      intr2_set                            : Unsigned_32 := 0;
      intr3_set                            : Unsigned_32 := 0;
      intr4_set                            : Unsigned_32 := 0;
      intr5_set                            : Unsigned_32 := 0;
      proc0_inte0_set                      : Unsigned_32 := 0;
      proc0_inte1_set                      : Unsigned_32 := 0;
      proc0_inte2_set                      : Unsigned_32 := 0;
      proc0_inte3_set                      : Unsigned_32 := 0;
      proc0_inte4_set                      : Unsigned_32 := 0;
      proc0_inte5_set                      : Unsigned_32 := 0;
      proc0_intf0_set                      : Unsigned_32 := 0;
      proc0_intf1_set                      : Unsigned_32 := 0;
      proc0_intf2_set                      : Unsigned_32 := 0;
      proc0_intf3_set                      : Unsigned_32 := 0;
      proc0_intf4_set                      : Unsigned_32 := 0;
      proc0_intf5_set                      : Unsigned_32 := 0;
      proc0_ints0_set                      : Unsigned_32 := 0;
      proc0_ints1_set                      : Unsigned_32 := 0;
      proc0_ints2_set                      : Unsigned_32 := 0;
      proc0_ints3_set                      : Unsigned_32 := 0;
      proc0_ints4_set                      : Unsigned_32 := 0;
      proc0_ints5_set                      : Unsigned_32 := 0;
      proc1_inte0_set                      : Unsigned_32 := 0;
      proc1_inte1_set                      : Unsigned_32 := 0;
      proc1_inte2_set                      : Unsigned_32 := 0;
      proc1_inte3_set                      : Unsigned_32 := 0;
      proc1_inte4_set                      : Unsigned_32 := 0;
      proc1_inte5_set                      : Unsigned_32 := 0;
      proc1_intf0_set                      : Unsigned_32 := 0;
      proc1_intf1_set                      : Unsigned_32 := 0;
      proc1_intf2_set                      : Unsigned_32 := 0;
      proc1_intf3_set                      : Unsigned_32 := 0;
      proc1_intf4_set                      : Unsigned_32 := 0;
      proc1_intf5_set                      : Unsigned_32 := 0;
      proc1_ints0_set                      : Unsigned_32 := 0;
      proc1_ints1_set                      : Unsigned_32 := 0;
      proc1_ints2_set                      : Unsigned_32 := 0;
      proc1_ints3_set                      : Unsigned_32 := 0;
      proc1_ints4_set                      : Unsigned_32 := 0;
      proc1_ints5_set                      : Unsigned_32 := 0;
      dormant_wake_inte0_set               : Unsigned_32 := 0;
      dormant_wake_inte1_set               : Unsigned_32 := 0;
      dormant_wake_inte2_set               : Unsigned_32 := 0;
      dormant_wake_inte3_set               : Unsigned_32 := 0;
      dormant_wake_inte4_set               : Unsigned_32 := 0;
      dormant_wake_inte5_set               : Unsigned_32 := 0;
      dormant_wake_intf0_set               : Unsigned_32 := 0;
      dormant_wake_intf1_set               : Unsigned_32 := 0;
      dormant_wake_intf2_set               : Unsigned_32 := 0;
      dormant_wake_intf3_set               : Unsigned_32 := 0;
      dormant_wake_intf4_set               : Unsigned_32 := 0;
      dormant_wake_intf5_set               : Unsigned_32 := 0;
      dormant_wake_ints0_set               : Unsigned_32 := 0;
      dormant_wake_ints1_set               : Unsigned_32 := 0;
      dormant_wake_ints2_set               : Unsigned_32 := 0;
      dormant_wake_ints3_set               : Unsigned_32 := 0;
      dormant_wake_ints4_set               : Unsigned_32 := 0;
      dormant_wake_ints5_set               : Unsigned_32 := 0;
      RSVDset_1                            : Reserved_824_Array;

      -- CLR Access Registers
      gpio0_status_clr                     : Unsigned_32 := 0;
      gpio0_ctrl_clr                       : Unsigned_32 := 0;
      gpio1_status_clr                     : Unsigned_32 := 0;
      gpio1_ctrl_clr                       : Unsigned_32 := 0;
      gpio2_status_clr                     : Unsigned_32 := 0;
      gpio2_ctrl_clr                       : Unsigned_32 := 0;
      gpio3_status_clr                     : Unsigned_32 := 0;
      gpio3_ctrl_clr                       : Unsigned_32 := 0;
      gpio4_status_clr                     : Unsigned_32 := 0;
      gpio4_ctrl_clr                       : Unsigned_32 := 0;
      gpio5_status_clr                     : Unsigned_32 := 0;
      gpio5_ctrl_clr                       : Unsigned_32 := 0;
      gpio6_status_clr                     : Unsigned_32 := 0;
      gpio6_ctrl_clr                       : Unsigned_32 := 0;
      gpio7_status_clr                     : Unsigned_32 := 0;
      gpio7_ctrl_clr                       : Unsigned_32 := 0;
      gpio8_status_clr                     : Unsigned_32 := 0;
      gpio8_ctrl_clr                       : Unsigned_32 := 0;
      gpio9_status_clr                     : Unsigned_32 := 0;
      gpio9_ctrl_clr                       : Unsigned_32 := 0;
      gpio10_status_clr                    : Unsigned_32 := 0;
      gpio10_ctrl_clr                      : Unsigned_32 := 0;
      gpio11_status_clr                    : Unsigned_32 := 0;
      gpio11_ctrl_clr                      : Unsigned_32 := 0;
      gpio12_status_clr                    : Unsigned_32 := 0;
      gpio12_ctrl_clr                      : Unsigned_32 := 0;
      gpio13_status_clr                    : Unsigned_32 := 0;
      gpio13_ctrl_clr                      : Unsigned_32 := 0;
      gpio14_status_clr                    : Unsigned_32 := 0;
      gpio14_ctrl_clr                      : Unsigned_32 := 0;
      gpio15_status_clr                    : Unsigned_32 := 0;
      gpio15_ctrl_clr                      : Unsigned_32 := 0;
      gpio16_status_clr                    : Unsigned_32 := 0;
      gpio16_ctrl_clr                      : Unsigned_32 := 0;
      gpio17_status_clr                    : Unsigned_32 := 0;
      gpio17_ctrl_clr                      : Unsigned_32 := 0;
      gpio18_status_clr                    : Unsigned_32 := 0;
      gpio18_ctrl_clr                      : Unsigned_32 := 0;
      gpio19_status_clr                    : Unsigned_32 := 0;
      gpio19_ctrl_clr                      : Unsigned_32 := 0;
      gpio20_status_clr                    : Unsigned_32 := 0;
      gpio20_ctrl_clr                      : Unsigned_32 := 0;
      gpio21_status_clr                    : Unsigned_32 := 0;
      gpio21_ctrl_clr                      : Unsigned_32 := 0;
      gpio22_status_clr                    : Unsigned_32 := 0;
      gpio22_ctrl_clr                      : Unsigned_32 := 0;
      gpio23_status_clr                    : Unsigned_32 := 0;
      gpio23_ctrl_clr                      : Unsigned_32 := 0;
      gpio24_status_clr                    : Unsigned_32 := 0;
      gpio24_ctrl_clr                      : Unsigned_32 := 0;
      gpio25_status_clr                    : Unsigned_32 := 0;
      gpio25_ctrl_clr                      : Unsigned_32 := 0;
      gpio26_status_clr                    : Unsigned_32 := 0;
      gpio26_ctrl_clr                      : Unsigned_32 := 0;
      gpio27_status_clr                    : Unsigned_32 := 0;
      gpio27_ctrl_clr                      : Unsigned_32 := 0;
      gpio28_status_clr                    : Unsigned_32 := 0;
      gpio28_ctrl_clr                      : Unsigned_32 := 0;
      gpio29_status_clr                    : Unsigned_32 := 0;
      gpio29_ctrl_clr                      : Unsigned_32 := 0;
      gpio30_status_clr                    : Unsigned_32 := 0;
      gpio30_ctrl_clr                      : Unsigned_32 := 0;
      gpio31_status_clr                    : Unsigned_32 := 0;
      gpio31_ctrl_clr                      : Unsigned_32 := 0;
      gpio32_status_clr                    : Unsigned_32 := 0;
      gpio32_ctrl_clr                      : Unsigned_32 := 0;
      gpio33_status_clr                    : Unsigned_32 := 0;
      gpio33_ctrl_clr                      : Unsigned_32 := 0;
      gpio34_status_clr                    : Unsigned_32 := 0;
      gpio34_ctrl_clr                      : Unsigned_32 := 0;
      gpio35_status_clr                    : Unsigned_32 := 0;
      gpio35_ctrl_clr                      : Unsigned_32 := 0;
      gpio36_status_clr                    : Unsigned_32 := 0;
      gpio36_ctrl_clr                      : Unsigned_32 := 0;
      gpio37_status_clr                    : Unsigned_32 := 0;
      gpio37_ctrl_clr                      : Unsigned_32 := 0;
      gpio38_status_clr                    : Unsigned_32 := 0;
      gpio38_ctrl_clr                      : Unsigned_32 := 0;
      gpio39_status_clr                    : Unsigned_32 := 0;
      gpio39_ctrl_clr                      : Unsigned_32 := 0;
      gpio40_status_clr                    : Unsigned_32 := 0;
      gpio40_ctrl_clr                      : Unsigned_32 := 0;
      gpio41_status_clr                    : Unsigned_32 := 0;
      gpio41_ctrl_clr                      : Unsigned_32 := 0;
      gpio42_status_clr                    : Unsigned_32 := 0;
      gpio42_ctrl_clr                      : Unsigned_32 := 0;
      gpio43_status_clr                    : Unsigned_32 := 0;
      gpio43_ctrl_clr                      : Unsigned_32 := 0;
      gpio44_status_clr                    : Unsigned_32 := 0;
      gpio44_ctrl_clr                      : Unsigned_32 := 0;
      gpio45_status_clr                    : Unsigned_32 := 0;
      gpio45_ctrl_clr                      : Unsigned_32 := 0;
      gpio46_status_clr                    : Unsigned_32 := 0;
      gpio46_ctrl_clr                      : Unsigned_32 := 0;
      gpio47_status_clr                    : Unsigned_32 := 0;
      gpio47_ctrl_clr                      : Unsigned_32 := 0;
      RSVDclr_0                            : Reserved_32_Array;
      irqsummary_proc0_secure0_clr         : Unsigned_32 := 0;
      irqsummary_proc0_secure1_clr         : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure0_clr      : Unsigned_32 := 0;
      irqsummary_proc0_nonsecure1_clr      : Unsigned_32 := 0;
      irqsummary_proc1_secure0_clr         : Unsigned_32 := 0;
      irqsummary_proc1_secure1_clr         : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure0_clr      : Unsigned_32 := 0;
      irqsummary_proc1_nonsecure1_clr      : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure0_clr  : Unsigned_32 := 0;
      irqsummary_dormant_wake_secure1_clr  : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure0_clr : Unsigned_32 := 0;
      irqsummary_dormant_wake_nonsecure1_clr : Unsigned_32 := 0;
      intr0_clr                            : Unsigned_32 := 0;
      intr1_clr                            : Unsigned_32 := 0;
      intr2_clr                            : Unsigned_32 := 0;
      intr3_clr                            : Unsigned_32 := 0;
      intr4_clr                            : Unsigned_32 := 0;
      intr5_clr                            : Unsigned_32 := 0;
      proc0_inte0_clr                      : Unsigned_32 := 0;
      proc0_inte1_clr                      : Unsigned_32 := 0;
      proc0_inte2_clr                      : Unsigned_32 := 0;
      proc0_inte3_clr                      : Unsigned_32 := 0;
      proc0_inte4_clr                      : Unsigned_32 := 0;
      proc0_inte5_clr                      : Unsigned_32 := 0;
      proc0_intf0_clr                      : Unsigned_32 := 0;
      proc0_intf1_clr                      : Unsigned_32 := 0;
      proc0_intf2_clr                      : Unsigned_32 := 0;
      proc0_intf3_clr                      : Unsigned_32 := 0;
      proc0_intf4_clr                      : Unsigned_32 := 0;
      proc0_intf5_clr                      : Unsigned_32 := 0;
      proc0_ints0_clr                      : Unsigned_32 := 0;
      proc0_ints1_clr                      : Unsigned_32 := 0;
      proc0_ints2_clr                      : Unsigned_32 := 0;
      proc0_ints3_clr                      : Unsigned_32 := 0;
      proc0_ints4_clr                      : Unsigned_32 := 0;
      proc0_ints5_clr                      : Unsigned_32 := 0;
      proc1_inte0_clr                      : Unsigned_32 := 0;
      proc1_inte1_clr                      : Unsigned_32 := 0;
      proc1_inte2_clr                      : Unsigned_32 := 0;
      proc1_inte3_clr                      : Unsigned_32 := 0;
      proc1_inte4_clr                      : Unsigned_32 := 0;
      proc1_inte5_clr                      : Unsigned_32 := 0;
      proc1_intf0_clr                      : Unsigned_32 := 0;
      proc1_intf1_clr                      : Unsigned_32 := 0;
      proc1_intf2_clr                      : Unsigned_32 := 0;
      proc1_intf3_clr                      : Unsigned_32 := 0;
      proc1_intf4_clr                      : Unsigned_32 := 0;
      proc1_intf5_clr                      : Unsigned_32 := 0;
      proc1_ints0_clr                      : Unsigned_32 := 0;
      proc1_ints1_clr                      : Unsigned_32 := 0;
      proc1_ints2_clr                      : Unsigned_32 := 0;
      proc1_ints3_clr                      : Unsigned_32 := 0;
      proc1_ints4_clr                      : Unsigned_32 := 0;
      proc1_ints5_clr                      : Unsigned_32 := 0;
      dormant_wake_inte0_clr               : Unsigned_32 := 0;
      dormant_wake_inte1_clr               : Unsigned_32 := 0;
      dormant_wake_inte2_clr               : Unsigned_32 := 0;
      dormant_wake_inte3_clr               : Unsigned_32 := 0;
      dormant_wake_inte4_clr               : Unsigned_32 := 0;
      dormant_wake_inte5_clr               : Unsigned_32 := 0;
      dormant_wake_intf0_clr               : Unsigned_32 := 0;
      dormant_wake_intf1_clr               : Unsigned_32 := 0;
      dormant_wake_intf2_clr               : Unsigned_32 := 0;
      dormant_wake_intf3_clr               : Unsigned_32 := 0;
      dormant_wake_intf4_clr               : Unsigned_32 := 0;
      dormant_wake_intf5_clr               : Unsigned_32 := 0;
      dormant_wake_ints0_clr               : Unsigned_32 := 0;
      dormant_wake_ints1_clr               : Unsigned_32 := 0;
      dormant_wake_ints2_clr               : Unsigned_32 := 0;
      dormant_wake_ints3_clr               : Unsigned_32 := 0;
      dormant_wake_ints4_clr               : Unsigned_32 := 0;
      dormant_wake_ints5_clr               : Unsigned_32 := 0;
      RSVDclr_1                            : Reserved_824_Array;
   end record
     with Volatile;

   for IO_BANK0_REG_BLOCKS use record
      -- Offsets calculated as (index * 4)
      gpio0_status                         at 0 range 0 .. 31;
      gpio0_ctrl                           at 4 range 0 .. 31;
      gpio1_status                         at 8 range 0 .. 31;
      gpio1_ctrl                           at 12 range 0 .. 31;
      -- ... (pattern follows for GPIOs 2 through 47)
      gpio2_status                         at 16 range 0 .. 31;
      gpio2_ctrl                           at 20 range 0 .. 31;
      gpio3_status                         at 24 range 0 .. 31;
      gpio3_ctrl                           at 28 range 0 .. 31;
      gpio4_status                         at 32 range 0 .. 31;
      gpio4_ctrl                           at 36 range 0 .. 31;
      gpio5_status                         at 40 range 0 .. 31;
      gpio5_ctrl                           at 44 range 0 .. 31;
      gpio6_status                         at 48 range 0 .. 31;
      gpio6_ctrl                           at 52 range 0 .. 31;
      gpio7_status                         at 56 range 0 .. 31;
      gpio7_ctrl                           at 60 range 0 .. 31;
      gpio8_status                         at 64 range 0 .. 31;
      gpio8_ctrl                           at 68 range 0 .. 31;
      gpio9_status                         at 72 range 0 .. 31;
      gpio9_ctrl                           at 76 range 0 .. 31;
      gpio10_status                        at 80 range 0 .. 31;
      gpio10_ctrl                          at 84 range 0 .. 31;
      gpio11_status                        at 88 range 0 .. 31;
      gpio11_ctrl                          at 92 range 0 .. 31;
      gpio12_status                        at 96 range 0 .. 31;
      gpio12_ctrl                          at 100 range 0 .. 31;
      gpio13_status                        at 104 range 0 .. 31;
      gpio13_ctrl                          at 108 range 0 .. 31;
      gpio14_status                        at 112 range 0 .. 31;
      gpio14_ctrl                          at 116 range 0 .. 31;
      gpio15_status                        at 120 range 0 .. 31;
      gpio15_ctrl                          at 124 range 0 .. 31;
      gpio16_status                        at 128 range 0 .. 31;
      gpio16_ctrl                          at 132 range 0 .. 31;
      gpio17_status                        at 136 range 0 .. 31;
      gpio17_ctrl                          at 140 range 0 .. 31;
      gpio18_status                        at 144 range 0 .. 31;
      gpio18_ctrl                          at 148 range 0 .. 31;
      gpio19_status                        at 152 range 0 .. 31;
      gpio19_ctrl                          at 156 range 0 .. 31;
      gpio20_status                        at 160 range 0 .. 31;
      gpio20_ctrl                          at 164 range 0 .. 31;
      gpio21_status                        at 168 range 0 .. 31;
      gpio21_ctrl                          at 172 range 0 .. 31;
      gpio22_status                        at 176 range 0 .. 31;
      gpio22_ctrl                          at 180 range 0 .. 31;
      gpio23_status                        at 184 range 0 .. 31;
      gpio23_ctrl                          at 188 range 0 .. 31;
      gpio24_status                        at 192 range 0 .. 31;
      gpio24_ctrl                          at 196 range 0 .. 31;
      gpio25_status                        at 200 range 0 .. 31;
      gpio25_ctrl                          at 204 range 0 .. 31;
      gpio26_status                        at 208 range 0 .. 31;
      gpio26_ctrl                          at 212 range 0 .. 31;
      gpio27_status                        at 216 range 0 .. 31;
      gpio27_ctrl                          at 220 range 0 .. 31;
      gpio28_status                        at 224 range 0 .. 31;
      gpio28_ctrl                          at 228 range 0 .. 31;
      gpio29_status                        at 232 range 0 .. 31;
      gpio29_ctrl                          at 236 range 0 .. 31;
      gpio30_status                        at 240 range 0 .. 31;
      gpio30_ctrl                          at 244 range 0 .. 31;
      gpio31_status                        at 248 range 0 .. 31;
      gpio31_ctrl                          at 252 range 0 .. 31;
      gpio32_status                        at 256 range 0 .. 31;
      gpio32_ctrl                          at 260 range 0 .. 31;
      gpio33_status                        at 264 range 0 .. 31;
      gpio33_ctrl                          at 268 range 0 .. 31;
      gpio34_status                        at 272 range 0 .. 31;
      gpio34_ctrl                          at 276 range 0 .. 31;
      gpio35_status                        at 280 range 0 .. 31;
      gpio35_ctrl                          at 284 range 0 .. 31;
      gpio36_status                        at 288 range 0 .. 31;
      gpio36_ctrl                          at 292 range 0 .. 31;
      gpio37_status                        at 296 range 0 .. 31;
      gpio37_ctrl                          at 300 range 0 .. 31;
      gpio38_status                        at 304 range 0 .. 31;
      gpio38_ctrl                          at 308 range 0 .. 31;
      gpio39_status                        at 312 range 0 .. 31;
      gpio39_ctrl                          at 316 range 0 .. 31;
      gpio40_status                        at 320 range 0 .. 31;
      gpio40_ctrl                          at 324 range 0 .. 31;
      gpio41_status                        at 328 range 0 .. 31;
      gpio41_ctrl                          at 332 range 0 .. 31;
      gpio42_status                        at 336 range 0 .. 31;
      gpio42_ctrl                          at 340 range 0 .. 31;
      gpio43_status                        at 344 range 0 .. 31;
      gpio43_ctrl                          at 348 range 0 .. 31;
      gpio44_status                        at 352 range 0 .. 31;
      gpio44_ctrl                          at 356 range 0 .. 31;
      gpio45_status                        at 360 range 0 .. 31;
      gpio45_ctrl                          at 364 range 0 .. 31;
      gpio46_status                        at 368 range 0 .. 31;
      gpio46_ctrl                          at 372 range 0 .. 31;
      gpio47_status                        at 376 range 0 .. 31;
      gpio47_ctrl                          at 380 range 0 .. 31;
      RSVD0                                at 384 range 0 .. 1023;
      irqsummary_proc0_secure0             at 512 range 0 .. 31;
      irqsummary_proc0_secure1             at 516 range 0 .. 31;
      irqsummary_proc0_nonsecure0          at 520 range 0 .. 31;
      irqsummary_proc0_nonsecure1          at 524 range 0 .. 31;
      irqsummary_proc1_secure0             at 528 range 0 .. 31;
      irqsummary_proc1_secure1             at 532 range 0 .. 31;
      irqsummary_proc1_nonsecure0          at 536 range 0 .. 31;
      irqsummary_proc1_nonsecure1          at 540 range 0 .. 31;
      irqsummary_dormant_wake_secure0      at 544 range 0 .. 31;
      irqsummary_dormant_wake_secure1      at 548 range 0 .. 31;
      irqsummary_dormant_wake_nonsecure0   at 552 range 0 .. 31;
      irqsummary_dormant_wake_nonsecure1   at 556 range 0 .. 31;
      intr0                                at 560 range 0 .. 31;
      intr1                                at 564 range 0 .. 31;
      intr2                                at 568 range 0 .. 31;
      intr3                                at 572 range 0 .. 31;
      intr4                                at 576 range 0 .. 31;
      intr5                                at 580 range 0 .. 31;
      proc0_inte0                          at 584 range 0 .. 31;
      proc0_inte1                          at 588 range 0 .. 31;
      proc0_inte2                          at 592 range 0 .. 31;
      proc0_inte3                          at 596 range 0 .. 31;
      proc0_inte4                          at 600 range 0 .. 31;
      proc0_inte5                          at 604 range 0 .. 31;
      proc0_intf0                          at 608 range 0 .. 31;
      proc0_intf1                          at 612 range 0 .. 31;
      proc0_intf2                          at 616 range 0 .. 31;
      proc0_intf3                          at 620 range 0 .. 31;
      proc0_intf4                          at 624 range 0 .. 31;
      proc0_intf5                          at 628 range 0 .. 31;
      proc0_ints0                          at 632 range 0 .. 31;
      proc0_ints1                          at 636 range 0 .. 31;
      proc0_ints2                          at 640 range 0 .. 31;
      proc0_ints3                          at 644 range 0 .. 31;
      proc0_ints4                          at 648 range 0 .. 31;
      proc0_ints5                          at 652 range 0 .. 31;
      proc1_inte0                          at 656 range 0 .. 31;
      proc1_inte1                          at 660 range 0 .. 31;
      proc1_inte2                          at 664 range 0 .. 31;
      proc1_inte3                          at 668 range 0 .. 31;
      proc1_inte4                          at 672 range 0 .. 31;
      proc1_inte5                          at 676 range 0 .. 31;
      proc1_intf0                          at 680 range 0 .. 31;
      proc1_intf1                          at 684 range 0 .. 31;
      proc1_intf2                          at 688 range 0 .. 31;
      proc1_intf3                          at 692 range 0 .. 31;
      proc1_intf4                          at 696 range 0 .. 31;
      proc1_intf5                          at 700 range 0 .. 31;
      proc1_ints0                          at 704 range 0 .. 31;
      proc1_ints1                          at 708 range 0 .. 31;
      proc1_ints2                          at 712 range 0 .. 31;
      proc1_ints3                          at 716 range 0 .. 31;
      proc1_ints4                          at 720 range 0 .. 31;
      proc1_ints5                          at 724 range 0 .. 31;
      dormant_wake_inte0                   at 728 range 0 .. 31;
      dormant_wake_inte1                   at 732 range 0 .. 31;
      dormant_wake_inte2                   at 736 range 0 .. 31;
      dormant_wake_inte3                   at 740 range 0 .. 31;
      dormant_wake_inte4                   at 744 range 0 .. 31;
      dormant_wake_inte5                   at 748 range 0 .. 31;
      dormant_wake_intf0                   at 752 range 0 .. 31;
      dormant_wake_intf1                   at 756 range 0 .. 31;
      dormant_wake_intf2                   at 760 range 0 .. 31;
      dormant_wake_intf3                   at 764 range 0 .. 31;
      dormant_wake_intf4                   at 768 range 0 .. 31;
      dormant_wake_intf5                   at 772 range 0 .. 31;
      dormant_wake_ints0                   at 776 range 0 .. 31;
      dormant_wake_ints1                   at 780 range 0 .. 31;
      dormant_wake_ints2                   at 784 range 0 .. 31;
      dormant_wake_ints3                   at 788 range 0 .. 31;
      dormant_wake_ints4                   at 792 range 0 .. 31;
      dormant_wake_ints5                   at 796 range 0 .. 31;
      RSVD1                                at 800 range 0 .. 26367;

      -- XOR Registers at +16#1000# (4096)
      gpio0_status_xor                     at 4096 range 0 .. 31;
      gpio0_ctrl_xor                       at 4100 range 0 .. 31;
      -- ... (pattern follows for XOR block)
      gpio47_status_xor                    at 4472 range 0 .. 31;
      gpio47_ctrl_xor                      at 4476 range 0 .. 31;
      RSVDxor_0                            at 4480 range 0 .. 1023;
      irqsummary_proc0_secure0_xor         at 4608 range 0 .. 31;
      -- ... summaries/intr/inte/intf/ints ...
      dormant_wake_ints5_xor               at 4892 range 0 .. 31;
      RSVDxor_1                            at 4896 range 0 .. 26367;

      -- SET Registers at +16#2000# (8192)
      gpio0_status_set                     at 8192 range 0 .. 31;
      gpio0_ctrl_set                       at 8196 range 0 .. 31;
      -- ... (pattern follows for SET block)
      gpio47_status_set                    at 8568 range 0 .. 31;
      gpio47_ctrl_set                      at 8572 range 0 .. 31;
      RSVDset_0                            at 8576 range 0 .. 1023;
      irqsummary_proc0_secure0_set         at 8704 range 0 .. 31;
      -- ... summaries/intr/inte/intf/ints ...
      dormant_wake_ints5_set               at 8988 range 0 .. 31;
      RSVDset_1                            at 8992 range 0 .. 26367;

      -- CLR Registers at +16#3000# (12288)
      gpio0_status_clr                     at 12288 range 0 .. 31;
      gpio0_ctrl_clr                       at 12292 range 0 .. 31;
      -- ... (pattern follows for CLR block)
      gpio47_status_clr                    at 12664 range 0 .. 31;
      gpio47_ctrl_clr                      at 12668 range 0 .. 31;
      RSVDclr_0                            at 12672 range 0 .. 1023;
      irqsummary_proc0_secure0_clr         at 12800 range 0 .. 31;
      -- ... summaries/intr/inte/intf/ints ...
      dormant_wake_ints5_clr               at 13084 range 0 .. 31;
      RSVDclr_1                            at 13088 range 0 .. 26367;
   end record;

   -- IO Registers as record instance
   IO_Bank0 : IO_BANK0_REG_BLOCKS
     with Import, Address => System'To_Address (16#4002_8000#), Volatile;

   -- IO Registers AS Address Constants (Equivalent to C macros)
   IO_BANK0_GPIO0_STATUS : Unsigned_32 renames IO_Bank0.gpio0_status;
   IO_BANK0_GPIO0_CTRL   : Unsigned_32 renames IO_Bank0.gpio0_ctrl;
   IO_BANK0_GPIO1_STATUS : Unsigned_32 renames IO_Bank0.gpio1_status;
   IO_BANK0_GPIO1_CTRL   : Unsigned_32 renames IO_Bank0.gpio1_ctrl;
   IO_BANK0_GPIO2_STATUS : Unsigned_32 renames IO_Bank0.gpio2_status;
   IO_BANK0_GPIO2_CTRL   : Unsigned_32 renames IO_Bank0.gpio2_ctrl;
   IO_BANK0_GPIO3_STATUS : Unsigned_32 renames IO_Bank0.gpio3_status;
   IO_BANK0_GPIO3_CTRL   : Unsigned_32 renames IO_Bank0.gpio3_ctrl;
   IO_BANK0_GPIO4_STATUS : Unsigned_32 renames IO_Bank0.gpio4_status;
   IO_BANK0_GPIO4_CTRL   : Unsigned_32 renames IO_Bank0.gpio4_ctrl;
   IO_BANK0_GPIO5_STATUS : Unsigned_32 renames IO_Bank0.gpio5_status;
   IO_BANK0_GPIO5_CTRL   : Unsigned_32 renames IO_Bank0.gpio5_ctrl;
   IO_BANK0_GPIO6_STATUS : Unsigned_32 renames IO_Bank0.gpio6_status;
   IO_BANK0_GPIO6_CTRL   : Unsigned_32 renames IO_Bank0.gpio6_ctrl;
   IO_BANK0_GPIO7_STATUS : Unsigned_32 renames IO_Bank0.gpio7_status;
   IO_BANK0_GPIO7_CTRL   : Unsigned_32 renames IO_Bank0.gpio7_ctrl;
   IO_BANK0_GPIO8_STATUS : Unsigned_32 renames IO_Bank0.gpio8_status;
   IO_BANK0_GPIO8_CTRL   : Unsigned_32 renames IO_Bank0.gpio8_ctrl;
   IO_BANK0_GPIO9_STATUS : Unsigned_32 renames IO_Bank0.gpio9_status;
   IO_BANK0_GPIO9_CTRL   : Unsigned_32 renames IO_Bank0.gpio9_ctrl;
   IO_BANK0_GPIO10_STATUS : Unsigned_32 renames IO_Bank0.gpio10_status;
   IO_BANK0_GPIO10_CTRL   : Unsigned_32 renames IO_Bank0.gpio10_ctrl;
   IO_BANK0_GPIO11_STATUS : Unsigned_32 renames IO_Bank0.gpio11_status;
   IO_BANK0_GPIO11_CTRL   : Unsigned_32 renames IO_Bank0.gpio11_ctrl;
   IO_BANK0_GPIO12_STATUS : Unsigned_32 renames IO_Bank0.gpio12_status;
   IO_BANK0_GPIO12_CTRL   : Unsigned_32 renames IO_Bank0.gpio12_ctrl;
   IO_BANK0_GPIO13_STATUS : Unsigned_32 renames IO_Bank0.gpio13_status;
   IO_BANK0_GPIO13_CTRL   : Unsigned_32 renames IO_Bank0.gpio13_ctrl;
   IO_BANK0_GPIO14_STATUS : Unsigned_32 renames IO_Bank0.gpio14_status;
   IO_BANK0_GPIO14_CTRL   : Unsigned_32 renames IO_Bank0.gpio14_ctrl;
   IO_BANK0_GPIO15_STATUS : Unsigned_32 renames IO_Bank0.gpio15_status;
   IO_BANK0_GPIO15_CTRL   : Unsigned_32 renames IO_Bank0.gpio15_ctrl;
   IO_BANK0_GPIO16_STATUS : Unsigned_32 renames IO_Bank0.gpio16_status;
   IO_BANK0_GPIO16_CTRL   : Unsigned_32 renames IO_Bank0.gpio16_ctrl;
   IO_BANK0_GPIO17_STATUS : Unsigned_32 renames IO_Bank0.gpio17_status;
   IO_BANK0_GPIO17_CTRL   : Unsigned_32 renames IO_Bank0.gpio17_ctrl;
   IO_BANK0_GPIO18_STATUS : Unsigned_32 renames IO_Bank0.gpio18_status;
   IO_BANK0_GPIO18_CTRL   : Unsigned_32 renames IO_Bank0.gpio18_ctrl;
   IO_BANK0_GPIO19_STATUS : Unsigned_32 renames IO_Bank0.gpio19_status;
   IO_BANK0_GPIO19_CTRL   : Unsigned_32 renames IO_Bank0.gpio19_ctrl;
   IO_BANK0_GPIO20_STATUS : Unsigned_32 renames IO_Bank0.gpio20_status;
   IO_BANK0_GPIO20_CTRL   : Unsigned_32 renames IO_Bank0.gpio20_ctrl;
   IO_BANK0_GPIO21_STATUS : Unsigned_32 renames IO_Bank0.gpio21_status;
   IO_BANK0_GPIO21_CTRL   : Unsigned_32 renames IO_Bank0.gpio21_ctrl;
   IO_BANK0_GPIO22_STATUS : Unsigned_32 renames IO_Bank0.gpio22_status;
   IO_BANK0_GPIO22_CTRL   : Unsigned_32 renames IO_Bank0.gpio22_ctrl;
   IO_BANK0_GPIO23_STATUS : Unsigned_32 renames IO_Bank0.gpio23_status;
   IO_BANK0_GPIO23_CTRL   : Unsigned_32 renames IO_Bank0.gpio23_ctrl;
   IO_BANK0_GPIO24_STATUS : Unsigned_32 renames IO_Bank0.gpio24_status;
   IO_BANK0_GPIO24_CTRL   : Unsigned_32 renames IO_Bank0.gpio24_ctrl;
   IO_BANK0_GPIO25_STATUS : Unsigned_32 renames IO_Bank0.gpio25_status;
   IO_BANK0_GPIO25_CTRL   : Unsigned_32 renames IO_Bank0.gpio25_ctrl;
   IO_BANK0_GPIO26_STATUS : Unsigned_32 renames IO_Bank0.gpio26_status;
   IO_BANK0_GPIO26_CTRL   : Unsigned_32 renames IO_Bank0.gpio26_ctrl;
   IO_BANK0_GPIO27_STATUS : Unsigned_32 renames IO_Bank0.gpio27_status;
   IO_BANK0_GPIO27_CTRL   : Unsigned_32 renames IO_Bank0.gpio27_ctrl;
   IO_BANK0_GPIO28_STATUS : Unsigned_32 renames IO_Bank0.gpio28_status;
   IO_BANK0_GPIO28_CTRL   : Unsigned_32 renames IO_Bank0.gpio28_ctrl;
   IO_BANK0_GPIO29_STATUS : Unsigned_32 renames IO_Bank0.gpio29_status;
   IO_BANK0_GPIO29_CTRL   : Unsigned_32 renames IO_Bank0.gpio29_ctrl;
   IO_BANK0_GPIO30_STATUS : Unsigned_32 renames IO_Bank0.gpio30_status;
   IO_BANK0_GPIO30_CTRL   : Unsigned_32 renames IO_Bank0.gpio30_ctrl;
   IO_BANK0_GPIO31_STATUS : Unsigned_32 renames IO_Bank0.gpio31_status;
   IO_BANK0_GPIO31_CTRL   : Unsigned_32 renames IO_Bank0.gpio31_ctrl;
   IO_BANK0_GPIO32_STATUS : Unsigned_32 renames IO_Bank0.gpio32_status;
   IO_BANK0_GPIO32_CTRL   : Unsigned_32 renames IO_Bank0.gpio32_ctrl;
   IO_BANK0_GPIO33_STATUS : Unsigned_32 renames IO_Bank0.gpio33_status;
   IO_BANK0_GPIO33_CTRL   : Unsigned_32 renames IO_Bank0.gpio33_ctrl;
   IO_BANK0_GPIO34_STATUS : Unsigned_32 renames IO_Bank0.gpio34_status;
   IO_BANK0_GPIO34_CTRL   : Unsigned_32 renames IO_Bank0.gpio34_ctrl;
   IO_BANK0_GPIO35_STATUS : Unsigned_32 renames IO_Bank0.gpio35_status;
   IO_BANK0_GPIO35_CTRL   : Unsigned_32 renames IO_Bank0.gpio35_ctrl;
   IO_BANK0_GPIO36_STATUS : Unsigned_32 renames IO_Bank0.gpio36_status;
   IO_BANK0_GPIO36_CTRL   : Unsigned_32 renames IO_Bank0.gpio36_ctrl;
   IO_BANK0_GPIO37_STATUS : Unsigned_32 renames IO_Bank0.gpio37_status;
   IO_BANK0_GPIO37_CTRL   : Unsigned_32 renames IO_Bank0.gpio37_ctrl;
   IO_BANK0_GPIO38_STATUS : Unsigned_32 renames IO_Bank0.gpio38_status;
   IO_BANK0_GPIO38_CTRL   : Unsigned_32 renames IO_Bank0.gpio38_ctrl;
   IO_BANK0_GPIO39_STATUS : Unsigned_32 renames IO_Bank0.gpio39_status;
   IO_BANK0_GPIO39_CTRL   : Unsigned_32 renames IO_Bank0.gpio39_ctrl;
   IO_BANK0_GPIO40_STATUS : Unsigned_32 renames IO_Bank0.gpio40_status;
   IO_BANK0_GPIO40_CTRL   : Unsigned_32 renames IO_Bank0.gpio40_ctrl;
   IO_BANK0_GPIO41_STATUS : Unsigned_32 renames IO_Bank0.gpio41_status;
   IO_BANK0_GPIO41_CTRL   : Unsigned_32 renames IO_Bank0.gpio41_ctrl;
   IO_BANK0_GPIO42_STATUS : Unsigned_32 renames IO_Bank0.gpio42_status;
   IO_BANK0_GPIO42_CTRL   : Unsigned_32 renames IO_Bank0.gpio42_ctrl;
   IO_BANK0_GPIO43_STATUS : Unsigned_32 renames IO_Bank0.gpio43_status;
   IO_BANK0_GPIO43_CTRL   : Unsigned_32 renames IO_Bank0.gpio43_ctrl;
   IO_BANK0_GPIO44_STATUS : Unsigned_32 renames IO_Bank0.gpio44_status;
   IO_BANK0_GPIO44_CTRL   : Unsigned_32 renames IO_Bank0.gpio44_ctrl;
   IO_BANK0_GPIO45_STATUS : Unsigned_32 renames IO_Bank0.gpio45_status;
   IO_BANK0_GPIO45_CTRL   : Unsigned_32 renames IO_Bank0.gpio45_ctrl;
   IO_BANK0_GPIO46_STATUS : Unsigned_32 renames IO_Bank0.gpio46_status;
   IO_BANK0_GPIO46_CTRL   : Unsigned_32 renames IO_Bank0.gpio46_ctrl;
   IO_BANK0_GPIO47_STATUS : Unsigned_32 renames IO_Bank0.gpio47_status;
   IO_BANK0_GPIO47_CTRL   : Unsigned_32 renames IO_Bank0.gpio47_ctrl;

   --  GPIO14_STATUS Register macros
   
   GPIO_STATUS_GENERIC_IRQTOPROC_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);  
   GPIO_STATUS_GENERIC_INFROMPAD_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 17);
   GPIO_STATUS_GENERIC_OETOPAD_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 13);
   GPIO_STATUS_GENERIC_OUTTOPAD_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 9);

   function IO_BANK0_GPIO14_STATUS_IRQTOPROC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26));
   IO_BANK0_GPIO14_STATUS_IRQTOPROC_MASK : constant Unsigned_32 := 16#0400_0000#;
   -- IO_BANK0_GPIO14_STATUS_IRQTOPROC (ALL1);
   
   function IO_BANK0_GPIO14_STATUS_INFROMPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   IO_BANK0_GPIO14_STATUS_INFROMPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_INFROMPAD_MASK;
   
   function IO_BANK0_GPIO14_STATUS_OETOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   IO_BANK0_GPIO14_STATUS_OETOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OETOPAD_MASK;
   
   function IO_BANK0_GPIO14_STATUS_OUTTOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   IO_BANK0_GPIO14_STATUS_OUTTOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO14_CTRL Register macros
   GPIO_CTRL_GENERIC_IRQOVER_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 28);
   GPIO_CTRL_GENERIC_INOVER_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 16);
   GPIO_CTRL_GENERIC_OEOVER_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 14);
   GPIO_CTRL_GENERIC_OUTOVER_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 12);
   GPIO_CTRL_GENERIC_FUNCSEL_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#1f#), 0);
     
   function IO_BANK0_GPIO14_CTRL_IRQOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 28));
   IO_BANK0_GPIO14_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;
   
   function IO_BANK0_GPIO14_CTRL_INOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 16));
   IO_BANK0_GPIO14_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;
   
   function IO_BANK0_GPIO14_CTRL_OEOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 14));
   IO_BANK0_GPIO14_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;
   
   function IO_BANK0_GPIO14_CTRL_OUTOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 12));
   IO_BANK0_GPIO14_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;
   
   function IO_BANK0_GPIO14_CTRL_FUNCSEL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   IO_BANK0_GPIO14_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_FUNCSEL_MASK;

   --  --  GPIO15_STATUS Register macros
   
   function IO_BANK0_GPIO15_STATUS_IRQTOPROC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26));
   IO_BANK0_GPIO15_STATUS_IRQTOPROC_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_IRQTOPROC_MASK;
   
   function IO_BANK0_GPIO15_STATUS_INFROMPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   IO_BANK0_GPIO15_STATUS_INFROMPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_INFROMPAD_MASK;
   
   function IO_BANK0_GPIO15_STATUS_OETOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   IO_BANK0_GPIO15_STATUS_OETOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OETOPAD_MASK;
   
   function IO_BANK0_GPIO15_STATUS_OUTTOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   IO_BANK0_GPIO15_STATUS_OUTTOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO15_CTRL Register macros

   function IO_BANK0_GPIO15_CTRL_IRQOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 28));
   IO_BANK0_GPIO15_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;
   
   function IO_BANK0_GPIO15_CTRL_INOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 16));
   IO_BANK0_GPIO15_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;
   
   function IO_BANK0_GPIO15_CTRL_OEOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 14));
   IO_BANK0_GPIO15_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;
   
   function IO_BANK0_GPIO15_CTRL_OUTOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 12));
   IO_BANK0_GPIO15_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;
   
   function IO_BANK0_GPIO15_CTRL_FUNCSEL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   IO_BANK0_GPIO15_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_FUNCSEL_MASK;

   --  GPIO16_STATUS Register macros
   
   function IO_BANK0_GPIO16_STATUS_IRQTOPROC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26));
   IO_BANK0_GPIO16_STATUS_IRQTOPROC_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_IRQTOPROC_MASK;
   
   function IO_BANK0_GPIO16_STATUS_INFROMPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   IO_BANK0_GPIO16_STATUS_INFROMPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_INFROMPAD_MASK;
   
   function IO_BANK0_GPIO16_STATUS_OETOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   IO_BANK0_GPIO16_STATUS_OETOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OETOPAD_MASK;
   
   function IO_BANK0_GPIO16_STATUS_OUTTOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   IO_BANK0_GPIO16_STATUS_OUTTOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO16_CTRL Register macros
   
   function IO_BANK0_GPIO16_CTRL_IRQOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 28));
   IO_BANK0_GPIO16_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;
   
   function IO_BANK0_GPIO16_CTRL_INOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 16));
   IO_BANK0_GPIO16_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;
   
   function IO_BANK0_GPIO16_CTRL_OEOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 14));
   IO_BANK0_GPIO16_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;
   
   function IO_BANK0_GPIO16_CTRL_OUTOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 12));
   IO_BANK0_GPIO16_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;
   
   function IO_BANK0_GPIO16_CTRL_FUNCSEL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   IO_BANK0_GPIO16_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_FUNCSEL_MASK;

   --  GPIO17_STATUS Register macros

   function IO_BANK0_GPIO17_STATUS_IRQTOPROC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26));
   IO_BANK0_GPIO17_STATUS_IRQTOPROC_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_IRQTOPROC_MASK;
   
   function IO_BANK0_GPIO17_STATUS_INFROMPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   IO_BANK0_GPIO17_STATUS_INFROMPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_INFROMPAD_MASK;
   
   function IO_BANK0_GPIO17_STATUS_OETOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   IO_BANK0_GPIO17_STATUS_OETOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OETOPAD_MASK;
   
   function IO_BANK0_GPIO17_STATUS_OUTTOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   IO_BANK0_GPIO17_STATUS_OUTTOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO17_CTRL Register macros

   function IO_BANK0_GPIO17_CTRL_IRQOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 28));
   IO_BANK0_GPIO17_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;
   
   function IO_BANK0_GPIO17_CTRL_INOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 16));
   IO_BANK0_GPIO17_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;
   
   function IO_BANK0_GPIO17_CTRL_OEOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 14));
   IO_BANK0_GPIO17_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;
   
   function IO_BANK0_GPIO17_CTRL_OUTOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 12));
   IO_BANK0_GPIO17_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;
   
   function IO_BANK0_GPIO17_CTRL_FUNCSEL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   IO_BANK0_GPIO17_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO18_STATUS Register macros

   function IO_BANK0_GPIO18_STATUS_IRQTOPROC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26));
   IO_BANK0_GPIO18_STATUS_IRQTOPROC_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_IRQTOPROC_MASK;
   
   function IO_BANK0_GPIO18_STATUS_INFROMPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   IO_BANK0_GPIO18_STATUS_INFROMPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_INFROMPAD_MASK;
   
   function IO_BANK0_GPIO18_STATUS_OETOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   IO_BANK0_GPIO18_STATUS_OETOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OETOPAD_MASK;
   
   function IO_BANK0_GPIO18_STATUS_OUTTOPAD (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   IO_BANK0_GPIO18_STATUS_OUTTOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO18_CTRL Register macros
   
   function IO_BANK0_GPIO18_CTRL_IRQOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 28));
   IO_BANK0_GPIO18_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;
   
   function IO_BANK0_GPIO18_CTRL_INOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 16));
   IO_BANK0_GPIO18_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;
   
   function IO_BANK0_GPIO18_CTRL_OEOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 14));
   IO_BANK0_GPIO18_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;
   
   function IO_BANK0_GPIO18_CTRL_OUTOVER (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 12));
   IO_BANK0_GPIO18_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;
   
   function IO_BANK0_GPIO18_CTRL_FUNCSEL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   IO_BANK0_GPIO18_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_FUNCSEL_MASK;
   
   -- GPIO24_CTRL Register macros 
   
   function IO_BANK0_GPIO24_CTRL_IRQOVER (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3#, 28));
   IO_BANK0_GPIO24_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;

   function IO_BANK0_GPIO24_CTRL_INOVER (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3#, 16));
   IO_BANK0_GPIO24_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;

   function IO_BANK0_GPIO24_CTRL_OEOVER (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3#, 14));
   IO_BANK0_GPIO24_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;

   function IO_BANK0_GPIO24_CTRL_OUTOVER (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3#, 12));
   IO_BANK0_GPIO24_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;

   function IO_BANK0_GPIO24_CTRL_FUNCSEL (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1F#, 0));
   IO_BANK0_GPIO24_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_FUNCSEL_MASK;

   --  GPIO25_STATUS Register macros
   
   function IO_BANK0_GPIO25_STATUS_IRQTOPROC(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#1#, 26)) with Inline;
   IO_BANK0_GPIO25_STATUS_IRQTOPROC_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_IRQTOPROC_MASK;
   function IO_BANK0_GPIO25_STATUS_INFROMPAD(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#1#, 17)) with Inline;
   IO_BANK0_GPIO25_STATUS_INFROMPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_INFROMPAD_MASK;
   function IO_BANK0_GPIO25_STATUS_OETOPAD(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#1#, 13)) with Inline;
   IO_BANK0_GPIO25_STATUS_OETOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OETOPAD_MASK;
   function IO_BANK0_GPIO25_STATUS_OUTTOPAD(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#1#, 9)) with Inline;
   IO_BANK0_GPIO25_STATUS_OUTTOPAD_MASK : constant Unsigned_32 := GPIO_STATUS_GENERIC_OUTTOPAD_MASK;

   --  GPIO25_CTRL Register macros
   
   function IO_BANK0_GPIO25_CTRL_IRQOVER(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#3#, 28)) with Inline;
   IO_BANK0_GPIO25_CTRL_IRQOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_IRQOVER_MASK;
   function IO_BANK0_GPIO25_CTRL_INOVER(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#3#, 16)) with Inline;
   IO_BANK0_GPIO25_CTRL_INOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_INOVER_MASK;
   function IO_BANK0_GPIO25_CTRL_OEOVER(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#3#, 14)) with Inline;
   IO_BANK0_GPIO25_CTRL_OEOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OEOVER_MASK;
   function IO_BANK0_GPIO25_CTRL_OUTOVER(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#3#, 12)) with Inline;
   IO_BANK0_GPIO25_CTRL_OUTOVER_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_OUTOVER_MASK;
   function IO_BANK0_GPIO25_CTRL_FUNCSEL(v : Unsigned_32) return Unsigned_32 is 
      (Shift_Left(v and 16#1f#, 0)) with Inline;
   IO_BANK0_GPIO25_CTRL_FUNCSEL_MASK : constant Unsigned_32 := GPIO_CTRL_GENERIC_FUNCSEL_MASK;

end RP2350_IO_Bank0;
