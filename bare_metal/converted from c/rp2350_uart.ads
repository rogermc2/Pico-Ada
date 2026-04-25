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

package RP2350_UART is

   ALL1 : constant Unsigned_32 := 16#FFFF_FFFF#;

   type Unsigned_32_Array is array (Natural range <>) of Unsigned_32;

   type UART0_REG_BLOCKS is record
      uartdr           : Unsigned_32 := 0;
      uartrsr          : Unsigned_32 := 0;
      RSVD0            : Unsigned_32_Array (0 .. 3);
      uartfr           : Unsigned_32 := 0;
      RSVD1            : Unsigned_32 := 0;
      uartilpr         : Unsigned_32 := 0;
      uartibrd         : Unsigned_32 := 0;
      uartfbrd         : Unsigned_32 := 0;
      uartlcr_h        : Unsigned_32 := 0;
      uartcr           : Unsigned_32 := 0;
      uartifls         : Unsigned_32 := 0;
      uartimsc         : Unsigned_32 := 0;
      uartris          : Unsigned_32 := 0;
      uartmis          : Unsigned_32 := 0;
      uarticr          : Unsigned_32 := 0;
      uartdmacr        : Unsigned_32 := 0;
      RSVD2            : Unsigned_32_Array (0 .. 996);
      uartperiphid0    : Unsigned_32 := 0;
      uartperiphid1    : Unsigned_32 := 0;
      uartperiphid2    : Unsigned_32 := 0;
      uartperiphid3    : Unsigned_32 := 0;
      uartpcellid0     : Unsigned_32 := 0;
      uartpcellid1     : Unsigned_32 := 0;
      uartpcellid2     : Unsigned_32 := 0;
      uartpcellid3     : Unsigned_32 := 0;
      uartdr_xor       : Unsigned_32 := 0;
      uartrsr_xor      : Unsigned_32 := 0;
      RSVDxor_0        : Unsigned_32_Array (0 .. 3);
      uartfr_xor       : Unsigned_32 := 0;
      RSVDxor_1        : Unsigned_32 := 0;
      uartilpr_xor     : Unsigned_32 := 0;
      uartibrd_xor     : Unsigned_32 := 0;
      uartfbrd_xor     : Unsigned_32 := 0;
      uartlcr_h_xor    : Unsigned_32 := 0;
      uartcr_xor       : Unsigned_32 := 0;
      uartifls_xor     : Unsigned_32 := 0;
      uartimsc_xor     : Unsigned_32 := 0;
      uartris_xor      : Unsigned_32 := 0;
      uartmis_xor      : Unsigned_32 := 0;
      uarticr_xor      : Unsigned_32 := 0;
      uartdmacr_xor    : Unsigned_32 := 0;
      RSVDxor_2        : Unsigned_32_Array (0 .. 996);
      uartperiphid0_xor : Unsigned_32 := 0;
      uartperiphid1_xor : Unsigned_32 := 0;
      uartperiphid2_xor : Unsigned_32 := 0;
      uartperiphid3_xor : Unsigned_32 := 0;
      uartpcellid0_xor : Unsigned_32 := 0;
      uartpcellid1_xor : Unsigned_32 := 0;
      uartpcellid2_xor : Unsigned_32 := 0;
      uartpcellid3_xor : Unsigned_32 := 0;
      uartdr_set       : Unsigned_32 := 0;
      uartrsr_set      : Unsigned_32 := 0;
      RSVDset_0        : Unsigned_32_Array (0 .. 3);
      uartfr_set       : Unsigned_32 := 0;
      RSVDset_1        : Unsigned_32 := 0;
      uartilpr_set     : Unsigned_32 := 0;
      uartibrd_set     : Unsigned_32 := 0;
      uartfbrd_set     : Unsigned_32 := 0;
      uartlcr_h_set    : Unsigned_32 := 0;
      uartcr_set       : Unsigned_32 := 0;
      uartifls_set     : Unsigned_32 := 0;
      uartimsc_set     : Unsigned_32 := 0;
      uartris_set      : Unsigned_32 := 0;
      uartmis_set      : Unsigned_32 := 0;
      uarticr_set      : Unsigned_32 := 0;
      uartdmacr_set    : Unsigned_32 := 0;
      RSVDset_2        : Unsigned_32_Array (0 .. 996);
      uartperiphid0_set : Unsigned_32 := 0;
      uartperiphid1_set : Unsigned_32 := 0;
      uartperiphid2_set : Unsigned_32 := 0;
      uartperiphid3_set : Unsigned_32 := 0;
      uartpcellid0_set : Unsigned_32 := 0;
      uartpcellid1_set : Unsigned_32 := 0;
      uartpcellid2_set : Unsigned_32 := 0;
      uartpcellid3_set : Unsigned_32 := 0;
      uartdr_clr       : Unsigned_32 := 0;
      uartrsr_clr      : Unsigned_32 := 0;
      RSVDclr_0        : Unsigned_32_Array (0 .. 3);
      uartfr_clr       : Unsigned_32 := 0;
      RSVDclr_1        : Unsigned_32 := 0;
      uartilpr_clr     : Unsigned_32 := 0;
      uartibrd_clr     : Unsigned_32 := 0;
      uartfbrd_clr     : Unsigned_32 := 0;
      uartlcr_h_clr    : Unsigned_32 := 0;
      uartcr_clr       : Unsigned_32 := 0;
      uartifls_clr     : Unsigned_32 := 0;
      uartimsc_clr     : Unsigned_32 := 0;
      uartris_clr      : Unsigned_32 := 0;
      uartmis_clr      : Unsigned_32 := 0;
      uarticr_clr      : Unsigned_32 := 0;
      uartdmacr_clr    : Unsigned_32 := 0;
      RSVDclr_2        : Unsigned_32_Array (0 .. 996);
      uartperiphid0_clr : Unsigned_32 := 0;
      uartperiphid1_clr : Unsigned_32 := 0;
      uartperiphid2_clr : Unsigned_32 := 0;
      uartperiphid3_clr : Unsigned_32 := 0;
      uartpcellid0_clr : Unsigned_32 := 0;
      uartpcellid1_clr : Unsigned_32 := 0;
      uartpcellid2_clr : Unsigned_32 := 0;
      uartpcellid3_clr : Unsigned_32 := 0;
   end record with
     Pack,
     Convention => C,
     Volatile;

   type UART1_REG_BLOCKS is record
      uartdr           : Unsigned_32 := 0;
      uartrsr          : Unsigned_32 := 0;
      RSVD0            : Unsigned_32_Array (0 .. 3);
      uartfr           : Unsigned_32 := 0;
      RSVD1            : Unsigned_32 := 0;
      uartilpr         : Unsigned_32 := 0;
      uartibrd         : Unsigned_32 := 0;
      uartfbrd         : Unsigned_32 := 0;
      uartlcr_h        : Unsigned_32 := 0;
      uartcr           : Unsigned_32 := 0;
      uartifls         : Unsigned_32 := 0;
      uartimsc         : Unsigned_32 := 0;
      uartris          : Unsigned_32 := 0;
      uartmis          : Unsigned_32 := 0;
      uarticr          : Unsigned_32 := 0;
      uartdmacr        : Unsigned_32 := 0;
      RSVD2            : Unsigned_32_Array (0 .. 996);
      uartperiphid0    : Unsigned_32 := 0;
      uartperiphid1    : Unsigned_32 := 0;
      uartperiphid2    : Unsigned_32 := 0;
      uartperiphid3    : Unsigned_32 := 0;
      uartpcellid0     : Unsigned_32 := 0;
      uartpcellid1     : Unsigned_32 := 0;
      uartpcellid2     : Unsigned_32 := 0;
      uartpcellid3     : Unsigned_32 := 0;
      uartdr_xor       : Unsigned_32 := 0;
      uartrsr_xor      : Unsigned_32 := 0;
      RSVDxor_0        : Unsigned_32_Array (0 .. 3);
      uartfr_xor       : Unsigned_32 := 0;
      RSVDxor_1        : Unsigned_32 := 0;
      uartilpr_xor     : Unsigned_32 := 0;
      uartibrd_xor     : Unsigned_32 := 0;
      uartfbrd_xor     : Unsigned_32 := 0;
      uartlcr_h_xor    : Unsigned_32 := 0;
      uartcr_xor       : Unsigned_32 := 0;
      uartifls_xor     : Unsigned_32 := 0;
      uartimsc_xor     : Unsigned_32 := 0;
      uartris_xor      : Unsigned_32 := 0;
      uartmis_xor      : Unsigned_32 := 0;
      uarticr_xor      : Unsigned_32 := 0;
      uartdmacr_xor    : Unsigned_32 := 0;
      RSVDxor_2        : Unsigned_32_Array (0 .. 996);
      uartperiphid0_xor : Unsigned_32 := 0;
      uartperiphid1_xor : Unsigned_32 := 0;
      uartperiphid2_xor : Unsigned_32 := 0;
      uartperiphid3_xor : Unsigned_32 := 0;
      uartpcellid0_xor : Unsigned_32 := 0;
      uartpcellid1_xor : Unsigned_32 := 0;
      uartpcellid2_xor : Unsigned_32 := 0;
      uartpcellid3_xor : Unsigned_32 := 0;
      uartdr_set       : Unsigned_32 := 0;
      uartrsr_set      : Unsigned_32 := 0;
      RSVDset_0        : Unsigned_32_Array (0 .. 3);
      uartfr_set       : Unsigned_32 := 0;
      RSVDset_1        : Unsigned_32 := 0;
      uartilpr_set     : Unsigned_32 := 0;
      uartibrd_set     : Unsigned_32 := 0;
      uartfbrd_set     : Unsigned_32 := 0;
      uartlcr_h_set    : Unsigned_32 := 0;
      uartcr_set       : Unsigned_32 := 0;
      uartifls_set     : Unsigned_32 := 0;
      uartimsc_set     : Unsigned_32 := 0;
      uartris_set      : Unsigned_32 := 0;
      uartmis_set      : Unsigned_32 := 0;
      uarticr_set      : Unsigned_32 := 0;
      uartdmacr_set    : Unsigned_32 := 0;
      RSVDset_2        : Unsigned_32_Array (0 .. 996);
      uartperiphid0_set : Unsigned_32 := 0;
      uartperiphid1_set : Unsigned_32 := 0;
      uartperiphid2_set : Unsigned_32 := 0;
      uartperiphid3_set : Unsigned_32 := 0;
      uartpcellid0_set : Unsigned_32 := 0;
      uartpcellid1_set : Unsigned_32 := 0;
      uartpcellid2_set : Unsigned_32 := 0;
      uartpcellid3_set : Unsigned_32 := 0;
      uartdr_clr       : Unsigned_32 := 0;
      uartrsr_clr      : Unsigned_32 := 0;
      RSVDclr_0        : Unsigned_32_Array (0 .. 3);
      uartfr_clr       : Unsigned_32 := 0;
      RSVDclr_1        : Unsigned_32 := 0;
      uartilpr_clr     : Unsigned_32 := 0;
      uartibrd_clr     : Unsigned_32 := 0;
      uartfbrd_clr     : Unsigned_32 := 0;
      uartlcr_h_clr    : Unsigned_32 := 0;
      uartcr_clr       : Unsigned_32 := 0;
      uartifls_clr     : Unsigned_32 := 0;
      uartimsc_clr     : Unsigned_32 := 0;
      uartris_clr      : Unsigned_32 := 0;
      uartmis_clr      : Unsigned_32 := 0;
      uarticr_clr      : Unsigned_32 := 0;
      uartdmacr_clr    : Unsigned_32 := 0;
      RSVDclr_2        : Unsigned_32_Array (0 .. 996);
      uartperiphid0_clr : Unsigned_32 := 0;
      uartperiphid1_clr : Unsigned_32 := 0;
      uartperiphid2_clr : Unsigned_32 := 0;
      uartperiphid3_clr : Unsigned_32 := 0;
      uartpcellid0_clr : Unsigned_32 := 0;
      uartpcellid1_clr : Unsigned_32 := 0;
      uartpcellid2_clr : Unsigned_32 := 0;
      uartpcellid3_clr : Unsigned_32 := 0;
   end record with
     Pack, Convention => C, Volatile;

   -- IO Registers as struct
   uart0 : UART0_REG_BLOCKS with
     Address => System'To_Address (16#4007_0000#), Volatile;
   pragma Import (Ada, UART0);

   uart1 : UART1_REG_BLOCKS with
     Address => System'To_Address (16#4007_8000#), Volatile;
   pragma Import (Ada, UART1);

   -- IO Registers AS MACROS
   UART0_UARTDR          : Unsigned_32 with Address => System'To_Address (16#4007_0000#), Volatile;
   UART0_UARTRSR         : Unsigned_32 with Address => System'To_Address (16#4007_0004#), Volatile;
   UART0_UARTFR          : Unsigned_32 with Address => System'To_Address (16#4007_0018#), Volatile;
   UART0_UARTILPR        : Unsigned_32 with Address => System'To_Address (16#4007_0020#), Volatile;
   UART0_UARTIBRD        : Unsigned_32 with Address => System'To_Address (16#4007_0024#), Volatile;
   UART0_UARTFBRD        : Unsigned_32 with Address => System'To_Address (16#4007_0028#), Volatile;
   UART0_UARTLCR_H       : Unsigned_32 with Address => System'To_Address (16#4007_002C#), Volatile;
   UART0_UARTCR          : Unsigned_32 with Address => System'To_Address (16#4007_0030#), Volatile;
   UART0_UARTIFLS        : Unsigned_32 with Address => System'To_Address (16#4007_0034#), Volatile;
   UART0_UARTIMSC        : Unsigned_32 with Address => System'To_Address (16#4007_0038#), Volatile;
   UART0_UARTRIS         : Unsigned_32 with Address => System'To_Address (16#4007_003C#), Volatile;
   UART0_UARTMIS         : Unsigned_32 with Address => System'To_Address (16#4007_0040#), Volatile;
   UART0_UARTICR         : Unsigned_32 with Address => System'To_Address (16#4007_0044#), Volatile;
   UART0_UARTDMACR       : Unsigned_32 with Address => System'To_Address (16#4007_0048#), Volatile;
   UART0_UARTPERIPHID0   : Unsigned_32 with Address => System'To_Address (16#4007_0FE0#), Volatile;
   UART0_UARTPERIPHID1   : Unsigned_32 with Address => System'To_Address (16#4007_0FE4#), Volatile;
   UART0_UARTPERIPHID2   : Unsigned_32 with Address => System'To_Address (16#4007_0FE8#), Volatile;
   UART0_UARTPERIPHID3   : Unsigned_32 with Address => System'To_Address (16#4007_0FEC#), Volatile;
   UART0_UARTPCELLID0    : Unsigned_32 with Address => System'To_Address (16#4007_0FF0#), Volatile;
   UART0_UARTPCELLID1    : Unsigned_32 with Address => System'To_Address (16#4007_0FF4#), Volatile;
   UART0_UARTPCELLID2    : Unsigned_32 with Address => System'To_Address (16#4007_0FF8#), Volatile;
   UART0_UARTPCELLID3    : Unsigned_32 with Address => System'To_Address (16#4007_0FFC#), Volatile;

   UART0_UARTDR_XOR      : Unsigned_32 with Address => System'To_Address (16#4007_1000#), Volatile;
   UART0_UARTRSR_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_1004#), Volatile;
   UART0_UARTFR_XOR      : Unsigned_32 with Address => System'To_Address (16#4007_1018#), Volatile;
   UART0_UARTILPR_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_1020#), Volatile;
   UART0_UARTIBRD_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_1024#), Volatile;
   UART0_UARTFBRD_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_1028#), Volatile;
   UART0_UARTLCR_H_XOR   : Unsigned_32 with Address => System'To_Address (16#4007_102C#), Volatile;
   UART0_UARTCR_XOR      : Unsigned_32 with Address => System'To_Address (16#4007_1030#), Volatile;
   UART0_UARTIFLS_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_1034#), Volatile;
   UART0_UARTIMSC_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_1038#), Volatile;
   UART0_UARTRIS_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_103C#), Volatile;
   UART0_UARTMIS_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_1040#), Volatile;
   UART0_UARTICR_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_1044#), Volatile;
   UART0_UARTDMACR_XOR   : Unsigned_32 with Address => System'To_Address (16#4007_1048#), Volatile;
   UART0_UARTPERIPHID0_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FE0#), Volatile;
   UART0_UARTPERIPHID1_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FE4#), Volatile;
   UART0_UARTPERIPHID2_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FE8#), Volatile;
   UART0_UARTPERIPHID3_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FEC#), Volatile;
   UART0_UARTPCELLID0_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FF0#), Volatile;
   UART0_UARTPCELLID1_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FF4#), Volatile;
   UART0_UARTPCELLID2_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FF8#), Volatile;
   UART0_UARTPCELLID3_XOR : Unsigned_32 with Address => System'To_Address (16#4007_1FFC#), Volatile;

   UART0_UARTDR_SET      : Unsigned_32 with Address => System'To_Address (16#4007_2000#), Volatile;
   UART0_UARTRSR_SET     : Unsigned_32 with Address => System'To_Address (16#4007_2004#), Volatile;
   UART0_UARTFR_SET      : Unsigned_32 with Address => System'To_Address (16#4007_2018#), Volatile;
   UART0_UARTILPR_SET    : Unsigned_32 with Address => System'To_Address (16#4007_2020#), Volatile;
   UART0_UARTIBRD_SET    : Unsigned_32 with Address => System'To_Address (16#4007_2024#), Volatile;
   UART0_UARTFBRD_SET    : Unsigned_32 with Address => System'To_Address (16#4007_2028#), Volatile;
   UART0_UARTLCR_H_SET   : Unsigned_32 with Address => System'To_Address (16#4007_202C#), Volatile;
   UART0_UARTCR_SET      : Unsigned_32 with Address => System'To_Address (16#4007_2030#), Volatile;
   UART0_UARTIFLS_SET    : Unsigned_32 with Address => System'To_Address (16#4007_2034#), Volatile;
   UART0_UARTIMSC_SET    : Unsigned_32 with Address => System'To_Address (16#4007_2038#), Volatile;
   UART0_UARTRIS_SET     : Unsigned_32 with Address => System'To_Address (16#4007_203C#), Volatile;
   UART0_UARTMIS_SET     : Unsigned_32 with Address => System'To_Address (16#4007_2040#), Volatile;
   UART0_UARTICR_SET     : Unsigned_32 with Address => System'To_Address (16#4007_2044#), Volatile;
   UART0_UARTDMACR_SET   : Unsigned_32 with Address => System'To_Address (16#4007_2048#), Volatile;
   UART0_UARTPERIPHID0_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FE0#), Volatile;
   UART0_UARTPERIPHID1_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FE4#), Volatile;
   UART0_UARTPERIPHID2_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FE8#), Volatile;
   UART0_UARTPERIPHID3_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FEC#), Volatile;
   UART0_UARTPCELLID0_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FF0#), Volatile;
   UART0_UARTPCELLID1_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FF4#), Volatile;
   UART0_UARTPCELLID2_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FF8#), Volatile;
   UART0_UARTPCELLID3_SET : Unsigned_32 with Address => System'To_Address (16#4007_2FFC#), Volatile;

   UART0_UARTDR_CLR      : Unsigned_32 with Address => System'To_Address (16#4007_3000#), Volatile;
   UART0_UARTRSR_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_3004#), Volatile;
   UART0_UARTFR_CLR      : Unsigned_32 with Address => System'To_Address (16#4007_3018#), Volatile;
   UART0_UARTILPR_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_3020#), Volatile;
   UART0_UARTIBRD_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_3024#), Volatile;
   UART0_UARTFBRD_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_3028#), Volatile;
   UART0_UARTLCR_H_CLR   : Unsigned_32 with Address => System'To_Address (16#4007_302C#), Volatile;
   UART0_UARTCR_CLR      : Unsigned_32 with Address => System'To_Address (16#4007_3030#), Volatile;
   UART0_UARTIFLS_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_3034#), Volatile;
   UART0_UARTIMSC_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_3038#), Volatile;
   UART0_UARTRIS_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_303C#), Volatile;
   UART0_UARTMIS_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_3040#), Volatile;
   UART0_UARTICR_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_3044#), Volatile;
   UART0_UARTDMACR_CLR   : Unsigned_32 with Address => System'To_Address (16#4007_3048#), Volatile;
   UART0_UARTPERIPHID0_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FE0#), Volatile;
   UART0_UARTPERIPHID1_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FE4#), Volatile;
   UART0_UARTPERIPHID2_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FE8#), Volatile;
   UART0_UARTPERIPHID3_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FEC#), Volatile;
   UART0_UARTPCELLID0_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FF0#), Volatile;
   UART0_UARTPCELLID1_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FF4#), Volatile;
   UART0_UARTPCELLID2_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FF8#), Volatile;
   UART0_UARTPCELLID3_CLR : Unsigned_32 with Address => System'To_Address (16#4007_3FFC#), Volatile;

   UART1_UARTDR          : Unsigned_32 with Address => System'To_Address (16#4007_8000#), Volatile;
   UART1_UARTRSR         : Unsigned_32 with Address => System'To_Address (16#4007_8004#), Volatile;
   UART1_UARTFR          : Unsigned_32 with Address => System'To_Address (16#4007_8018#), Volatile;
   UART1_UARTILPR        : Unsigned_32 with Address => System'To_Address (16#4007_8020#), Volatile;
   UART1_UARTIBRD        : Unsigned_32 with Address => System'To_Address (16#4007_8024#), Volatile;
   UART1_UARTFBRD        : Unsigned_32 with Address => System'To_Address (16#4007_8028#), Volatile;
   UART1_UARTLCR_H       : Unsigned_32 with Address => System'To_Address (16#4007_802C#), Volatile;
   UART1_UARTCR          : Unsigned_32 with Address => System'To_Address (16#4007_8030#), Volatile;
   UART1_UARTIFLS        : Unsigned_32 with Address => System'To_Address (16#4007_8034#), Volatile;
   UART1_UARTIMSC        : Unsigned_32 with Address => System'To_Address (16#4007_8038#), Volatile;
   UART1_UARTRIS         : Unsigned_32 with Address => System'To_Address (16#4007_803C#), Volatile;
   UART1_UARTMIS         : Unsigned_32 with Address => System'To_Address (16#4007_8040#), Volatile;
   UART1_UARTICR         : Unsigned_32 with Address => System'To_Address (16#4007_8044#), Volatile;
   UART1_UARTDMACR       : Unsigned_32 with Address => System'To_Address (16#4007_8048#), Volatile;
   UART1_UARTPERIPHID0   : Unsigned_32 with Address => System'To_Address (16#4007_8FE0#), Volatile;
   UART1_UARTPERIPHID1   : Unsigned_32 with Address => System'To_Address (16#4007_8FE4#), Volatile;
   UART1_UARTPERIPHID2   : Unsigned_32 with Address => System'To_Address (16#4007_8FE8#), Volatile;
   UART1_UARTPERIPHID3   : Unsigned_32 with Address => System'To_Address (16#4007_8FEC#), Volatile;
   UART1_UARTPCELLID0    : Unsigned_32 with Address => System'To_Address (16#4007_8FF0#), Volatile;
   UART1_UARTPCELLID1    : Unsigned_32 with Address => System'To_Address (16#4007_8FF4#), Volatile;
   UART1_UARTPCELLID2    : Unsigned_32 with Address => System'To_Address (16#4007_8FF8#), Volatile;
   UART1_UARTPCELLID3    : Unsigned_32 with Address => System'To_Address (16#4007_8FFC#), Volatile;

   UART1_UARTDR_XOR      : Unsigned_32 with Address => System'To_Address (16#4007_9000#), Volatile;
   UART1_UARTRSR_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_9004#), Volatile;
   UART1_UARTFR_XOR      : Unsigned_32 with Address => System'To_Address (16#4007_9018#), Volatile;
   UART1_UARTILPR_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_9020#), Volatile;
   UART1_UARTIBRD_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_9024#), Volatile;
   UART1_UARTFBRD_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_9028#), Volatile;
   UART1_UARTLCR_H_XOR   : Unsigned_32 with Address => System'To_Address (16#4007_902C#), Volatile;
   UART1_UARTCR_XOR      : Unsigned_32 with Address => System'To_Address (16#4007_9030#), Volatile;
   UART1_UARTIFLS_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_9034#), Volatile;
   UART1_UARTIMSC_XOR    : Unsigned_32 with Address => System'To_Address (16#4007_9038#), Volatile;
   UART1_UARTRIS_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_903C#), Volatile;
   UART1_UARTMIS_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_9040#), Volatile;
   UART1_UARTICR_XOR     : Unsigned_32 with Address => System'To_Address (16#4007_9044#), Volatile;
   UART1_UARTDMACR_XOR   : Unsigned_32 with Address => System'To_Address (16#4007_9048#), Volatile;
   UART1_UARTPERIPHID0_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FE0#), Volatile;
   UART1_UARTPERIPHID1_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FE4#), Volatile;
   UART1_UARTPERIPHID2_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FE8#), Volatile;
   UART1_UARTPERIPHID3_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FEC#), Volatile;
   UART1_UARTPCELLID0_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FF0#), Volatile;
   UART1_UARTPCELLID1_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FF4#), Volatile;
   UART1_UARTPCELLID2_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FF8#), Volatile;
   UART1_UARTPCELLID3_XOR : Unsigned_32 with Address => System'To_Address (16#4007_9FFC#), Volatile;

   UART1_UARTDR_SET      : Unsigned_32 with Address => System'To_Address (16#4007_A000#), Volatile;
   UART1_UARTRSR_SET     : Unsigned_32 with Address => System'To_Address (16#4007_A004#), Volatile;
   UART1_UARTFR_SET      : Unsigned_32 with Address => System'To_Address (16#4007_A018#), Volatile;
   UART1_UARTILPR_SET    : Unsigned_32 with Address => System'To_Address (16#4007_A020#), Volatile;
   UART1_UARTIBRD_SET    : Unsigned_32 with Address => System'To_Address (16#4007_A024#), Volatile;
   UART1_UARTFBRD_SET    : Unsigned_32 with Address => System'To_Address (16#4007_A028#), Volatile;
   UART1_UARTLCR_H_SET   : Unsigned_32 with Address => System'To_Address (16#4007_A02C#), Volatile;
   UART1_UARTCR_SET      : Unsigned_32 with Address => System'To_Address (16#4007_A030#), Volatile;
   UART1_UARTIFLS_SET    : Unsigned_32 with Address => System'To_Address (16#4007_A034#), Volatile;
   UART1_UARTIMSC_SET    : Unsigned_32 with Address => System'To_Address (16#4007_A038#), Volatile;
   UART1_UARTRIS_SET     : Unsigned_32 with Address => System'To_Address (16#4007_A03C#), Volatile;
   UART1_UARTMIS_SET     : Unsigned_32 with Address => System'To_Address (16#4007_A040#), Volatile;
   UART1_UARTICR_SET     : Unsigned_32 with Address => System'To_Address (16#4007_A044#), Volatile;
   UART1_UARTDMACR_SET   : Unsigned_32 with Address => System'To_Address (16#4007_A048#), Volatile;
   UART1_UARTPERIPHID0_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFE0#), Volatile;
   UART1_UARTPERIPHID1_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFE4#), Volatile;
   UART1_UARTPERIPHID2_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFE8#), Volatile;
   UART1_UARTPERIPHID3_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFEC#), Volatile;
   UART1_UARTPCELLID0_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFF0#), Volatile;
   UART1_UARTPCELLID1_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFF4#), Volatile;
   UART1_UARTPCELLID2_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFF8#), Volatile;
   UART1_UARTPCELLID3_SET : Unsigned_32 with Address => System'To_Address (16#4007_AFFC#), Volatile;

   UART1_UARTDR_CLR      : Unsigned_32 with Address => System'To_Address (16#4007_B000#), Volatile;
   UART1_UARTRSR_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_B004#), Volatile;
   UART1_UARTFR_CLR      : Unsigned_32 with Address => System'To_Address (16#4007_B018#), Volatile;
   UART1_UARTILPR_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_B020#), Volatile;
   UART1_UARTIBRD_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_B024#), Volatile;
   UART1_UARTFBRD_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_B028#), Volatile;
   UART1_UARTLCR_H_CLR   : Unsigned_32 with Address => System'To_Address (16#4007_B02C#), Volatile;
   UART1_UARTCR_CLR      : Unsigned_32 with Address => System'To_Address (16#4007_B030#), Volatile;
   UART1_UARTIFLS_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_B034#), Volatile;
   UART1_UARTIMSC_CLR    : Unsigned_32 with Address => System'To_Address (16#4007_B038#), Volatile;
   UART1_UARTRIS_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_B03C#), Volatile;
   UART1_UARTMIS_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_B040#), Volatile;
   UART1_UARTICR_CLR     : Unsigned_32 with Address => System'To_Address (16#4007_B044#), Volatile;
   UART1_UARTDMACR_CLR   : Unsigned_32 with Address => System'To_Address (16#4007_B048#), Volatile;
   UART1_UARTPERIPHID0_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFE0#), Volatile;
   UART1_UARTPERIPHID1_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFE4#), Volatile;
   UART1_UARTPERIPHID2_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFE8#), Volatile;
   UART1_UARTPERIPHID3_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFEC#), Volatile;
   UART1_UARTPCELLID0_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFF0#), Volatile;
   UART1_UARTPCELLID1_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFF4#), Volatile;
   UART1_UARTPCELLID2_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFF8#), Volatile;
   UART1_UARTPCELLID3_CLR : Unsigned_32 with Address => System'To_Address (16#4007_BFFC#), Volatile;

   -- UARTDR Register macros
   function UART0_UARTDR_OE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 11));
   UART0_UARTDR_OE_MASK : constant Unsigned_32 := UART0_UARTDR_OE (ALL1);
   function UART0_UARTDR_BE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 10));
   UART0_UARTDR_BE_MASK : constant Unsigned_32 := UART0_UARTDR_BE (ALL1);
   function UART0_UARTDR_PE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 9));
   UART0_UARTDR_PE_MASK : constant Unsigned_32 := UART0_UARTDR_PE (ALL1);
   function UART0_UARTDR_FE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 8));
   UART0_UARTDR_FE_MASK : constant Unsigned_32 := UART0_UARTDR_FE (ALL1);
   function UART0_UARTDR_DATA (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#FF#, 0));
   UART0_UARTDR_DATA_MASK : constant Unsigned_32 := UART0_UARTDR_DATA (ALL1);

   -- UARTRSR Register macros
   function UART0_UARTRSR_OE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 3));
   UART0_UARTRSR_OE_MASK : constant Unsigned_32 := UART0_UARTRSR_OE (ALL1);
   function UART0_UARTRSR_BE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 2));
   UART0_UARTRSR_BE_MASK : constant Unsigned_32 := UART0_UARTRSR_BE (ALL1);
   function UART0_UARTRSR_PE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 1));
   UART0_UARTRSR_PE_MASK : constant Unsigned_32 := UART0_UARTRSR_PE (ALL1);
   function UART0_UARTRSR_FE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 0));
   UART0_UARTRSR_FE_MASK : constant Unsigned_32 := UART0_UARTRSR_FE (ALL1);

   -- UARTFR Register macros
   function UART0_UARTFR_RI (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 8));
   UART0_UARTFR_RI_MASK : constant Unsigned_32 := UART0_UARTFR_RI (ALL1);
   function UART0_UARTFR_TXFE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 7));
   UART0_UARTFR_TXFE_MASK : constant Unsigned_32 := UART0_UARTFR_TXFE (ALL1);
   function UART0_UARTFR_RXFF (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 6));
   UART0_UARTFR_RXFF_MASK : constant Unsigned_32 := UART0_UARTFR_RXFF (ALL1);
   function UART0_UARTFR_TXFF (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 5));
   UART0_UARTFR_TXFF_MASK : constant Unsigned_32 := UART0_UARTFR_TXFF (ALL1);
   function UART0_UARTFR_RXFE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 4));
   UART0_UARTFR_RXFE_MASK : constant Unsigned_32 := UART0_UARTFR_RXFE (ALL1);
   function UART0_UARTFR_BUSY (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 3));
   UART0_UARTFR_BUSY_MASK : constant Unsigned_32 := UART0_UARTFR_BUSY (ALL1);
   function UART0_UARTFR_DCD (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 2));
   UART0_UARTFR_DCD_MASK : constant Unsigned_32 := UART0_UARTFR_DCD (ALL1);
   function UART0_UARTFR_DSR (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 1));
   UART0_UARTFR_DSR_MASK : constant Unsigned_32 := UART0_UARTFR_DSR (ALL1);
   function UART0_UARTFR_CTS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 0));
   UART0_UARTFR_CTS_MASK : constant Unsigned_32 := UART0_UARTFR_CTS (ALL1);

   -- UARTILPR Register macros
   function UART0_UARTILPR_ILPDVSR (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#FF#, 0));
   UART0_UARTILPR_ILPDVSR_MASK : constant Unsigned_32 := UART0_UARTILPR_ILPDVSR (ALL1);

   -- UARTIBRD Register macros
   function UART0_UARTIBRD_BAUD_DIVINT (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#FFFF#, 0));
   UART0_UARTIBRD_BAUD_DIVINT_MASK : constant Unsigned_32 := UART0_UARTIBRD_BAUD_DIVINT (ALL1);

   -- UARTFBRD Register macros
   function UART0_UARTFBRD_BAUD_DIVFRAC (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#3F#, 0));
   UART0_UARTFBRD_BAUD_DIVFRAC_MASK : constant Unsigned_32 := UART0_UARTFBRD_BAUD_DIVFRAC (ALL1);

   -- UARTLCR_H Register macros
   function UART0_UARTLCR_H_SPS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 7));
   UART0_UARTLCR_H_SPS_MASK : constant Unsigned_32 := UART0_UARTLCR_H_SPS (ALL1);
   function UART0_UARTLCR_H_WLEN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#3#, 5));
   UART0_UARTLCR_H_WLEN_MASK : constant Unsigned_32 := UART0_UARTLCR_H_WLEN (ALL1);
   function UART0_UARTLCR_H_FEN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 4));
   UART0_UARTLCR_H_FEN_MASK : constant Unsigned_32 := UART0_UARTLCR_H_FEN (ALL1);
   function UART0_UARTLCR_H_STP2 (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 3));
   UART0_UARTLCR_H_STP2_MASK : constant Unsigned_32 := UART0_UARTLCR_H_STP2 (ALL1);
   function UART0_UARTLCR_H_EPS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 2));
   UART0_UARTLCR_H_EPS_MASK : constant Unsigned_32 := UART0_UARTLCR_H_EPS (ALL1);
   function UART0_UARTLCR_H_PEN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 1));
   UART0_UARTLCR_H_PEN_MASK : constant Unsigned_32 := UART0_UARTLCR_H_PEN (ALL1);
   function UART0_UARTLCR_H_BRK (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 0));
   UART0_UARTLCR_H_BRK_MASK : constant Unsigned_32 := UART0_UARTLCR_H_BRK (ALL1);

   -- UARTCR Register macros
   function UART0_UARTCR_CTSEN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 15));
   UART0_UARTCR_CTSEN_MASK : constant Unsigned_32 := UART0_UARTCR_CTSEN (ALL1);
   function UART0_UARTCR_RTSEN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 14));
   UART0_UARTCR_RTSEN_MASK : constant Unsigned_32 := UART0_UARTCR_RTSEN (ALL1);
   function UART0_UARTCR_OUT2 (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 13));
   UART0_UARTCR_OUT2_MASK : constant Unsigned_32 := UART0_UARTCR_OUT2 (ALL1);
   function UART0_UARTCR_OUT1 (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 12));
   UART0_UARTCR_OUT1_MASK : constant Unsigned_32 := UART0_UARTCR_OUT1 (ALL1);
   function UART0_UARTCR_RTS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 11));
   UART0_UARTCR_RTS_MASK : constant Unsigned_32 := UART0_UARTCR_RTS (ALL1);
   function UART0_UARTCR_DTR (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 10));
   UART0_UARTCR_DTR_MASK : constant Unsigned_32 := UART0_UARTCR_DTR (ALL1);
   function UART0_UARTCR_RXE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 9));
   UART0_UARTCR_RXE_MASK : constant Unsigned_32 := UART0_UARTCR_RXE (ALL1);
   function UART0_UARTCR_TXE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 8));
   UART0_UARTCR_TXE_MASK : constant Unsigned_32 := UART0_UARTCR_TXE (ALL1);
   function UART0_UARTCR_LBE (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 7));
   UART0_UARTCR_LBE_MASK : constant Unsigned_32 := UART0_UARTCR_LBE (ALL1);
   function UART0_UARTCR_SIRLP (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 2));
   UART0_UARTCR_SIRLP_MASK : constant Unsigned_32 := UART0_UARTCR_SIRLP (ALL1);
   function UART0_UARTCR_SIREN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 1));
   UART0_UARTCR_SIREN_MASK : constant Unsigned_32 := UART0_UARTCR_SIREN (ALL1);
   function UART0_UARTCR_UARTEN (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 0));
   UART0_UARTCR_UARTEN_MASK : constant Unsigned_32 := UART0_UARTCR_UARTEN (ALL1);

   -- UARTIFLS Register macros
   function UART0_UARTIFLS_RXIFLSEL (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#7#, 3));
   UART0_UARTIFLS_RXIFLSEL_MASK : constant Unsigned_32 := UART0_UARTIFLS_RXIFLSEL (ALL1);
   function UART0_UARTIFLS_TXIFLSEL (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#7#, 0));
   UART0_UARTIFLS_TXIFLSEL_MASK : constant Unsigned_32 := UART0_UARTIFLS_TXIFLSEL (ALL1);

   -- UARTIMSC Register macros
   function UART0_UARTIMSC_OEIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 10));
   UART0_UARTIMSC_OEIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_OEIM (ALL1);
   function UART0_UARTIMSC_BEIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 9));
   UART0_UARTIMSC_BEIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_BEIM (ALL1);
   function UART0_UARTIMSC_PEIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 8));
   UART0_UARTIMSC_PEIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_PEIM (ALL1);
   function UART0_UARTIMSC_FEIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 7));
   UART0_UARTIMSC_FEIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_FEIM (ALL1);
   function UART0_UARTIMSC_RTIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 6));
   UART0_UARTIMSC_RTIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_RTIM (ALL1);
   function UART0_UARTIMSC_TXIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 5));
   UART0_UARTIMSC_TXIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_TXIM (ALL1);
   function UART0_UARTIMSC_RXIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 4));
   UART0_UARTIMSC_RXIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_RXIM (ALL1);
   function UART0_UARTIMSC_DSRMIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 3));
   UART0_UARTIMSC_DSRMIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_DSRMIM (ALL1);
   function UART0_UARTIMSC_DCDMIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 2));
   UART0_UARTIMSC_DCDMIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_DCDMIM (ALL1);
   function UART0_UARTIMSC_CTSMIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 1));
   UART0_UARTIMSC_CTSMIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_CTSMIM (ALL1);
   function UART0_UARTIMSC_RIMIM (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 0));
   UART0_UARTIMSC_RIMIM_MASK : constant Unsigned_32 := UART0_UARTIMSC_RIMIM (ALL1);

   -- UARTRIS Register macros
   function UART0_UARTRIS_OERIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 10));
   UART0_UARTRIS_OERIS_MASK : constant Unsigned_32 := UART0_UARTRIS_OERIS (ALL1);
   function UART0_UARTRIS_BERIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 9));
   UART0_UARTRIS_BERIS_MASK : constant Unsigned_32 := UART0_UARTRIS_BERIS (ALL1);
   function UART0_UARTRIS_PERIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 8));
   UART0_UARTRIS_PERIS_MASK : constant Unsigned_32 := UART0_UARTRIS_PERIS (ALL1);
   function UART0_UARTRIS_FERIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 7));
   UART0_UARTRIS_FERIS_MASK : constant Unsigned_32 := UART0_UARTRIS_FERIS (ALL1);
   function UART0_UARTRIS_RTRIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 6));
   UART0_UARTRIS_RTRIS_MASK : constant Unsigned_32 := UART0_UARTRIS_RTRIS (ALL1);
   function UART0_UARTRIS_TXRIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 5));
   UART0_UARTRIS_TXRIS_MASK : constant Unsigned_32 := UART0_UARTRIS_TXRIS (ALL1);
   function UART0_UARTRIS_RXRIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 4));
   UART0_UARTRIS_RXRIS_MASK : constant Unsigned_32 := UART0_UARTRIS_RXRIS (ALL1);
   function UART0_UARTRIS_DSRRMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 3));
   UART0_UARTRIS_DSRRMIS_MASK : constant Unsigned_32 := UART0_UARTRIS_DSRRMIS (ALL1);
   function UART0_UARTRIS_DCDRMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 2));
   UART0_UARTRIS_DCDRMIS_MASK : constant Unsigned_32 := UART0_UARTRIS_DCDRMIS (ALL1);
   function UART0_UARTRIS_CTSRMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 1));
   UART0_UARTRIS_CTSRMIS_MASK : constant Unsigned_32 := UART0_UARTRIS_CTSRMIS (ALL1);
   function UART0_UARTRIS_RIRMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 0));
   UART0_UARTRIS_RIRMIS_MASK : constant Unsigned_32 := UART0_UARTRIS_RIRMIS (ALL1);

   -- UARTMIS Register macros
   function UART0_UARTMIS_OEMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 10));
   UART0_UARTMIS_OEMIS_MASK : constant Unsigned_32 := UART0_UARTMIS_OEMIS (ALL1);
   function UART0_UARTMIS_BEMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 9));
   UART0_UARTMIS_BEMIS_MASK : constant Unsigned_32 := UART0_UARTMIS_BEMIS (ALL1);
   function UART0_UARTMIS_PEMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 8));
   UART0_UARTMIS_PEMIS_MASK : constant Unsigned_32 := UART0_UARTMIS_PEMIS (ALL1);
   function UART0_UARTMIS_FEMIS (V : Unsigned_32) return Unsigned_32 is (Shift_Left (V and 16#1#, 7));

end RP2350_UART;
