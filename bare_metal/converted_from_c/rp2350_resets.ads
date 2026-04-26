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
--  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--  DEALINGS IN THE SOFTWARE.

with Interfaces; use Interfaces;
with System;

package RP2350_Resets is

   ALL1 : constant Unsigned_32 := 16#FFFF_FFFF#;

   type RSVD_Array is array (0 .. 1020) of Unsigned_32;

   type RESETS_REG_BLOCKS is record
      reset          : Unsigned_32 := 0;
      wdsel          : Unsigned_32 := 0;
      reset_done     : Unsigned_32 := 0;
      RSVD0          : RSVD_Array;
      reset_xor      : Unsigned_32 := 0;
      wdsel_xor      : Unsigned_32 := 0;
      reset_done_xor : Unsigned_32 := 0;
      RSVDxor_0      : RSVD_Array;
      reset_set      : Unsigned_32 := 0;
      wdsel_set      : Unsigned_32 := 0;
      reset_done_set : Unsigned_32 := 0;
      RSVDset_0      : RSVD_Array;
      reset_clr      : Unsigned_32 := 0;
      wdsel_clr      : Unsigned_32 := 0;
      reset_done_clr : Unsigned_32 := 0;
      RSVDclr_0      : RSVD_Array;
   end record with
     Volatile;

   for RESETS_REG_BLOCKS use record
      reset          at 16#0000# range 0 .. 31;
      wdsel          at 16#0004# range 0 .. 31;
      reset_done     at 16#0008# range 0 .. 31;
      RSVD0          at 16#000C# range 0 .. 32671;
      reset_xor      at 16#1000# range 0 .. 31;
      wdsel_xor      at 16#1004# range 0 .. 31;
      reset_done_xor at 16#1008# range 0 .. 31;
      RSVDxor_0      at 16#100C# range 0 .. 32671;
      reset_set      at 16#2000# range 0 .. 31;
      wdsel_set      at 16#2004# range 0 .. 31;
      reset_done_set at 16#2008# range 0 .. 31;
      RSVDset_0      at 16#200C# range 0 .. 32671;
      reset_clr      at 16#3000# range 0 .. 31;
      wdsel_clr      at 16#3004# range 0 .. 31;
      reset_done_clr at 16#3008# range 0 .. 31;
      RSVDclr_0      at 16#300C# range 0 .. 32671;
   end record;

   --  IO Registers as struct
   resets : RESETS_REG_BLOCKS 
     with Address => System'To_Address(16#4002_0000#),
          Import,
          Volatile;

   --  IO Registers AS MACROS
   RESETS_RESET : Unsigned_32 
     with Address => System'To_Address(16#4002_0000#),
          Import,
          Volatile;

   RESETS_WDSEL : Unsigned_32 
     with Address => System'To_Address(16#4002_0004#),
          Import,
          Volatile;

   RESETS_RESET_DONE : Unsigned_32 
     with Address => System'To_Address(16#4002_0008#),
          Import,
          Volatile;

   RESETS_RESET_XOR : Unsigned_32 
     with Address => System'To_Address(16#4002_1000#),
          Import,
          Volatile;

   RESETS_WDSEL_XOR : Unsigned_32 
     with Address => System'To_Address(16#4002_1004#),
          Import,
          Volatile;

   RESETS_RESET_DONE_XOR : Unsigned_32 
     with Address => System'To_Address(16#4002_1008#),
          Import,
          Volatile;

   RESETS_RESET_SET : Unsigned_32 
     with Address => System'To_Address(16#4002_2000#),
          Import,
          Volatile;

   RESETS_WDSEL_SET : Unsigned_32 
     with Address => System'To_Address(16#4002_2004#),
          Import,
          Volatile;

   RESETS_RESET_DONE_SET : Unsigned_32 
     with Address => System'To_Address(16#4002_2008#),
          Import,
          Volatile;

   RESETS_RESET_CLR : Unsigned_32 
     with Address => System'To_Address(16#4002_3000#),
          Import,
          Volatile;

   RESETS_WDSEL_CLR : Unsigned_32 
     with Address => System'To_Address(16#4002_3004#),
          Import,
          Volatile;

   RESETS_RESET_DONE_CLR : Unsigned_32 
     with Address => System'To_Address(16#4002_3008#),
          Import,
          Volatile;

   --  RESET Register macros
   function RESETS_RESET_USBCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 28));
   RESETS_RESET_USBCTRL_MASK : constant Unsigned_32 := RESETS_RESET_USBCTRL(ALL1);

   function RESETS_RESET_UART1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 27));
   RESETS_RESET_UART1_MASK : constant Unsigned_32 := RESETS_RESET_UART1(ALL1);

   function RESETS_RESET_UART0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 26));
   RESETS_RESET_UART0_MASK : constant Unsigned_32 := RESETS_RESET_UART0(ALL1);

   function RESETS_RESET_TRNG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 25));
   RESETS_RESET_TRNG_MASK : constant Unsigned_32 := RESETS_RESET_TRNG(ALL1);

   function RESETS_RESET_TIMER1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 24));
   RESETS_RESET_TIMER1_MASK : constant Unsigned_32 := RESETS_RESET_TIMER1(ALL1);

   function RESETS_RESET_TIMER0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 23));
   RESETS_RESET_TIMER0_MASK : constant Unsigned_32 := RESETS_RESET_TIMER0(ALL1);

   function RESETS_RESET_TBMAN(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 22));
   RESETS_RESET_TBMAN_MASK : constant Unsigned_32 := RESETS_RESET_TBMAN(ALL1);

   function RESETS_RESET_SYSINFO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 21));
   RESETS_RESET_SYSINFO_MASK : constant Unsigned_32 := RESETS_RESET_SYSINFO(ALL1);

   function RESETS_RESET_SYSCFG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 20));
   RESETS_RESET_SYSCFG_MASK : constant Unsigned_32 := RESETS_RESET_SYSCFG(ALL1);

   function RESETS_RESET_SPI1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 19));
   RESETS_RESET_SPI1_MASK : constant Unsigned_32 := RESETS_RESET_SPI1(ALL1);

   function RESETS_RESET_SPI0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 18));
   RESETS_RESET_SPI0_MASK : constant Unsigned_32 := RESETS_RESET_SPI0(ALL1);

   function RESETS_RESET_SHA256(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 17));
   RESETS_RESET_SHA256_MASK : constant Unsigned_32 := RESETS_RESET_SHA256(ALL1);

   function RESETS_RESET_PWM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 16));
   RESETS_RESET_PWM_MASK : constant Unsigned_32 := RESETS_RESET_PWM(ALL1);

   function RESETS_RESET_PLL_USB(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 15));
   RESETS_RESET_PLL_USB_MASK : constant Unsigned_32 := RESETS_RESET_PLL_USB(ALL1);

   function RESETS_RESET_PLL_SYS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 14));
   RESETS_RESET_PLL_SYS_MASK : constant Unsigned_32 := RESETS_RESET_PLL_SYS(ALL1);

   function RESETS_RESET_PIO2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 13));
   RESETS_RESET_PIO2_MASK : constant Unsigned_32 := RESETS_RESET_PIO2(ALL1);

   function RESETS_RESET_PIO1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 12));
   RESETS_RESET_PIO1_MASK : constant Unsigned_32 := RESETS_RESET_PIO1(ALL1);

   function RESETS_RESET_PIO0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 11));
   RESETS_RESET_PIO0_MASK : constant Unsigned_32 := RESETS_RESET_PIO0(ALL1);

   function RESETS_RESET_PADS_QSPI(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 10));
   RESETS_RESET_PADS_QSPI_MASK : constant Unsigned_32 := RESETS_RESET_PADS_QSPI(ALL1);

   function RESETS_RESET_PADS_BANK0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 9));
   RESETS_RESET_PADS_BANK0_MASK : constant Unsigned_32 := RESETS_RESET_PADS_BANK0(ALL1);

   function RESETS_RESET_JTAG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 8));
   RESETS_RESET_JTAG_MASK : constant Unsigned_32 := RESETS_RESET_JTAG(ALL1);

   function RESETS_RESET_IO_QSPI(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 7));
   RESETS_RESET_IO_QSPI_MASK : constant Unsigned_32 := RESETS_RESET_IO_QSPI(ALL1);

   function RESETS_RESET_IO_BANK0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 6));
   RESETS_RESET_IO_BANK0_MASK : constant Unsigned_32 := RESETS_RESET_IO_BANK0(ALL1);

   function RESETS_RESET_I2C1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 5));
   RESETS_RESET_I2C1_MASK : constant Unsigned_32 := RESETS_RESET_I2C1(ALL1);

   function RESETS_RESET_I2C0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 4));
   RESETS_RESET_I2C0_MASK : constant Unsigned_32 := RESETS_RESET_I2C0(ALL1);

   function RESETS_RESET_HSTX(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 3));
   RESETS_RESET_HSTX_MASK : constant Unsigned_32 := RESETS_RESET_HSTX(ALL1);

   function RESETS_RESET_DMA(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 2));
   RESETS_RESET_DMA_MASK : constant Unsigned_32 := RESETS_RESET_DMA(ALL1);

   function RESETS_RESET_BUSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 1));
   RESETS_RESET_BUSCTRL_MASK : constant Unsigned_32 := RESETS_RESET_BUSCTRL(ALL1);

   function RESETS_RESET_ADC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 0));
   RESETS_RESET_ADC_MASK : constant Unsigned_32 := RESETS_RESET_ADC(ALL1);

   function RESETS_RESET_DONE_USBCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 28));
   RESETS_RESET_DONE_USBCTRL_MASK : constant Unsigned_32 := RESETS_RESET_DONE_USBCTRL(ALL1);

   function RESETS_RESET_DONE_UART1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 27));
   RESETS_RESET_DONE_UART1_MASK : constant Unsigned_32 := RESETS_RESET_DONE_UART1(ALL1);

   function RESETS_RESET_DONE_UART0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 26));
   RESETS_RESET_DONE_UART0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_UART0(ALL1);

   function RESETS_RESET_DONE_TRNG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 25));
   RESETS_RESET_DONE_TRNG_MASK : constant Unsigned_32 := RESETS_RESET_DONE_TRNG(ALL1);

   function RESETS_RESET_DONE_TIMER1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 24));
   RESETS_RESET_DONE_TIMER1_MASK : constant Unsigned_32 := RESETS_RESET_DONE_TIMER1(ALL1);

   function RESETS_RESET_DONE_TIMER0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 23));
   RESETS_RESET_DONE_TIMER0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_TIMER0(ALL1);

   function RESETS_RESET_DONE_TBMAN(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 22));
   RESETS_RESET_DONE_TBMAN_MASK : constant Unsigned_32 := RESETS_RESET_DONE_TBMAN(ALL1);

   function RESETS_RESET_DONE_SYSINFO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 21));
   RESETS_RESET_DONE_SYSINFO_MASK : constant Unsigned_32 := RESETS_RESET_DONE_SYSINFO(ALL1);

   function RESETS_RESET_DONE_SYSCFG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 20));
   RESETS_RESET_DONE_SYSCFG_MASK : constant Unsigned_32 := RESETS_RESET_DONE_SYSCFG(ALL1);

   function RESETS_RESET_DONE_SPI1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 19));
   RESETS_RESET_DONE_SPI1_MASK : constant Unsigned_32 := RESETS_RESET_DONE_SPI1(ALL1);

   function RESETS_RESET_DONE_SPI0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 18));
   RESETS_RESET_DONE_SPI0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_SPI0(ALL1);

   function RESETS_RESET_DONE_SHA256(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 17));
   RESETS_RESET_DONE_SHA256_MASK : constant Unsigned_32 := RESETS_RESET_DONE_SHA256(ALL1);

   function RESETS_RESET_DONE_PWM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 16));
   RESETS_RESET_DONE_PWM_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PWM(ALL1);

   function RESETS_RESET_DONE_PLL_USB(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 15));
   RESETS_RESET_DONE_PLL_USB_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PLL_USB(ALL1);

   function RESETS_RESET_DONE_PLL_SYS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 14));
   RESETS_RESET_DONE_PLL_SYS_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PLL_SYS(ALL1);

   function RESETS_RESET_DONE_PIO2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 13));
   RESETS_RESET_DONE_PIO2_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PIO2(ALL1);

   function RESETS_RESET_DONE_PIO1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 12));
   RESETS_RESET_DONE_PIO1_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PIO1(ALL1);

   function RESETS_RESET_DONE_PIO0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 11));
   RESETS_RESET_DONE_PIO0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PIO0(ALL1);

   function RESETS_RESET_DONE_PADS_QSPI(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 10));
   RESETS_RESET_DONE_PADS_QSPI_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PADS_QSPI(ALL1);

   function RESETS_RESET_DONE_PADS_BANK0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 9));
   RESETS_RESET_DONE_PADS_BANK0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_PADS_BANK0(ALL1);

   function RESETS_RESET_DONE_JTAG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 8));
   RESETS_RESET_DONE_JTAG_MASK : constant Unsigned_32 := RESETS_RESET_DONE_JTAG(ALL1);

   function RESETS_RESET_DONE_IO_QSPI(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 7));
   RESETS_RESET_DONE_IO_QSPI_MASK : constant Unsigned_32 := RESETS_RESET_DONE_IO_QSPI(ALL1);

   function RESETS_RESET_DONE_IO_BANK0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 6));
   RESETS_RESET_DONE_IO_BANK0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_IO_BANK0(ALL1);

   function RESETS_RESET_DONE_I2C1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 5));
   RESETS_RESET_DONE_I2C1_MASK : constant Unsigned_32 := RESETS_RESET_DONE_I2C1(ALL1);

   function RESETS_RESET_DONE_I2C0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 4));
   RESETS_RESET_DONE_I2C0_MASK : constant Unsigned_32 := RESETS_RESET_DONE_I2C0(ALL1);

   function RESETS_RESET_DONE_HSTX(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 3));
   RESETS_RESET_DONE_HSTX_MASK : constant Unsigned_32 := RESETS_RESET_DONE_HSTX(ALL1);

   function RESETS_RESET_DONE_DMA(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 2));
   RESETS_RESET_DONE_DMA_MASK : constant Unsigned_32 := RESETS_RESET_DONE_DMA(ALL1);

   function RESETS_RESET_DONE_BUSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 1));
   RESETS_RESET_DONE_BUSCTRL_MASK : constant Unsigned_32 := RESETS_RESET_DONE_BUSCTRL(ALL1);

   function RESETS_RESET_DONE_ADC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 0));
   RESETS_RESET_DONE_ADC_MASK : constant Unsigned_32 := RESETS_RESET_DONE_ADC(ALL1);

   --  WDSEL Register macros
   function RESETS_WDSEL_USBCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 28));
   RESETS_WDSEL_USBCTRL_MASK : constant Unsigned_32 := RESETS_WDSEL_USBCTRL(ALL1);

   function RESETS_WDSEL_UART1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 27));
   RESETS_WDSEL_UART1_MASK : constant Unsigned_32 := RESETS_WDSEL_UART1(ALL1);

   function RESETS_WDSEL_UART0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 26));
   RESETS_WDSEL_UART0_MASK : constant Unsigned_32 := RESETS_WDSEL_UART0(ALL1);

   function RESETS_WDSEL_TRNG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 25));
   RESETS_WDSEL_TRNG_MASK : constant Unsigned_32 := RESETS_WDSEL_TRNG(ALL1);

   function RESETS_WDSEL_TIMER1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 24));
   RESETS_WDSEL_TIMER1_MASK : constant Unsigned_32 := RESETS_WDSEL_TIMER1(ALL1);

   function RESETS_WDSEL_TIMER0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 23));
   RESETS_WDSEL_TIMER0_MASK : constant Unsigned_32 := RESETS_WDSEL_TIMER0(ALL1);

   function RESETS_WDSEL_TBMAN(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 22));
   RESETS_WDSEL_TBMAN_MASK : constant Unsigned_32 := RESETS_WDSEL_TBMAN(ALL1);

   function RESETS_WDSEL_SYSINFO(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 21));
   RESETS_WDSEL_SYSINFO_MASK : constant Unsigned_32 := RESETS_WDSEL_SYSINFO(ALL1);

   function RESETS_WDSEL_SYSCFG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 20));
   RESETS_WDSEL_SYSCFG_MASK : constant Unsigned_32 := RESETS_WDSEL_SYSCFG(ALL1);

   function RESETS_WDSEL_SPI1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 19));
   RESETS_WDSEL_SPI1_MASK : constant Unsigned_32 := RESETS_WDSEL_SPI1(ALL1);

   function RESETS_WDSEL_SPI0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 18));
   RESETS_WDSEL_SPI0_MASK : constant Unsigned_32 := RESETS_WDSEL_SPI0(ALL1);

   function RESETS_WDSEL_SHA256(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 17));
   RESETS_WDSEL_SHA256_MASK : constant Unsigned_32 := RESETS_WDSEL_SHA256(ALL1);

   function RESETS_WDSEL_PWM(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 16));
   RESETS_WDSEL_PWM_MASK : constant Unsigned_32 := RESETS_WDSEL_PWM(ALL1);

   function RESETS_WDSEL_PLL_USB(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 15));
   RESETS_WDSEL_PLL_USB_MASK : constant Unsigned_32 := RESETS_WDSEL_PLL_USB(ALL1);

   function RESETS_WDSEL_PLL_SYS(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 14));
   RESETS_WDSEL_PLL_SYS_MASK : constant Unsigned_32 := RESETS_WDSEL_PLL_SYS(ALL1);

   function RESETS_WDSEL_PIO2(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 13));
   RESETS_WDSEL_PIO2_MASK : constant Unsigned_32 := RESETS_WDSEL_PIO2(ALL1);

   function RESETS_WDSEL_PIO1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 12));
   RESETS_WDSEL_PIO1_MASK : constant Unsigned_32 := RESETS_WDSEL_PIO1(ALL1);

   function RESETS_WDSEL_PIO0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 11));
   RESETS_WDSEL_PIO0_MASK : constant Unsigned_32 := RESETS_WDSEL_PIO0(ALL1);

   function RESETS_WDSEL_PADS_QSPI(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 10));
   RESETS_WDSEL_PADS_QSPI_MASK : constant Unsigned_32 := RESETS_WDSEL_PADS_QSPI(ALL1);

   function RESETS_WDSEL_PADS_BANK0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 9));
   RESETS_WDSEL_PADS_BANK0_MASK : constant Unsigned_32 := RESETS_WDSEL_PADS_BANK0(ALL1);

   function RESETS_WDSEL_JTAG(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 8));
   RESETS_WDSEL_JTAG_MASK : constant Unsigned_32 := RESETS_WDSEL_JTAG(ALL1);

   function RESETS_WDSEL_IO_QSPI(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 7));
   RESETS_WDSEL_IO_QSPI_MASK : constant Unsigned_32 := RESETS_WDSEL_IO_QSPI(ALL1);

   function RESETS_WDSEL_IO_BANK0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 6));
   RESETS_WDSEL_IO_BANK0_MASK : constant Unsigned_32 := RESETS_WDSEL_IO_BANK0(ALL1);

   function RESETS_WDSEL_I2C1(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 5));
   RESETS_WDSEL_I2C1_MASK : constant Unsigned_32 := RESETS_WDSEL_I2C1(ALL1);

   function RESETS_WDSEL_I2C0(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 4));
   RESETS_WDSEL_I2C0_MASK : constant Unsigned_32 := RESETS_WDSEL_I2C0(ALL1);

   function RESETS_WDSEL_HSTX(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 3));
   RESETS_WDSEL_HSTX_MASK : constant Unsigned_32 := RESETS_WDSEL_HSTX(ALL1);

   function RESETS_WDSEL_DMA(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 2));
   RESETS_WDSEL_DMA_MASK : constant Unsigned_32 := RESETS_WDSEL_DMA(ALL1);

   function RESETS_WDSEL_BUSCTRL(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 1));
   RESETS_WDSEL_BUSCTRL_MASK : constant Unsigned_32 := RESETS_WDSEL_BUSCTRL(ALL1);

   function RESETS_WDSEL_ADC(v : Unsigned_32) return Unsigned_32 is (Shift_Left(v and 1, 0));
   RESETS_WDSEL_ADC_MASK : constant Unsigned_32 := RESETS_WDSEL_ADC(ALL1);

   --  RESET_DONE Register macros (Note: These are identical to the ones above as per original C code)
   --  Redeclared here conceptually to match the C source structure, though in Ada they are already visible.

end RP2350_Resets;
