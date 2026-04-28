with Interfaces; use Interfaces;
with System;

package RP2350_USB is
   pragma Preelaborate;

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
    
   GENERIC_7_5_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#7#), 5); 
   GENERIC_F_0_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#F#), 0);  
   GENERIC_F_8_MASK     : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#F#), 8);  
   GENERIC_F_16_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#F#), 16);  
   GENERIC_F_28_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#F#), 28);
   GENERIC_1F_0_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#1F#), 0);
   GENERIC_1F_8_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#1F#), 8);
   GENERIC_3F_10_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#3F#), 10);
   GENERIC_3FF_0_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#3FF#), 0);
   GENERIC_3FF_16_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#3FF#), 16);
   GENERIC_7F_0_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#7F#), 0);
   GENERIC_7FF_0_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#7FF#), 0);
   GENERIC_7FFF_1_MASK  : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#7FFF#), 1);
   GENERIC_3FFFF_0_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#3FFFF#), 0);
   
   GENERIC_1_31_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 31);
   GENERIC_1_30_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 30);
   GENERIC_1_29_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 29);
   GENERIC_1_28_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 28);
   GENERIC_1_27_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 27);
   GENERIC_1_26_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 26);
   GENERIC_1_25_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 25);
   GENERIC_1_24_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 24);
   GENERIC_1_23_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 23);
   GENERIC_1_22_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 22);
   GENERIC_1_21_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 21);
   GENERIC_1_20_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 20);
   GENERIC_1_19_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 19);
   GENERIC_1_18_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 18);
   GENERIC_1_17_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 17);
   GENERIC_1_16_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 16);
   GENERIC_1_15_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 15);
   GENERIC_1_14_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 14);
   GENERIC_1_13_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 13);
   GENERIC_1_12_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 12);
   GENERIC_1_11_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 11);
   GENERIC_1_10_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 10);
   GENERIC_1_9_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 9);
   GENERIC_1_8_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 8);
   GENERIC_1_7_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 7);
   GENERIC_1_6_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 6);
   GENERIC_1_5_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 5);
   GENERIC_1_4_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 4);
   GENERIC_1_3_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 3);
   GENERIC_1_2_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 2);
   GENERIC_1_1_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 1);
   GENERIC_1_0_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(1), 0);

   GENERIC_3_30_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 30);
   GENERIC_3_28_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 28);
   GENERIC_3_26_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 26);
   GENERIC_3_24_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 24);
   GENERIC_3_22_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 22);
   GENERIC_3_20_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 20);
   GENERIC_3_18_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 18);
   GENERIC_3_16_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 16);
   GENERIC_3_14_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 14);
   GENERIC_3_12_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 12);
   GENERIC_3_10_MASK   : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 10);
   GENERIC_3_8_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 8);
   GENERIC_3_6_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 6);
   GENERIC_3_4_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 4);
   GENERIC_3_2_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 2);
   GENERIC_3_0_MASK    : constant Unsigned_32 := Shift_Left (Unsigned_32'(3), 0);

   type RSVD0_Array is array (0 .. 24) of Unsigned_32 with Pack;
   type RSVD1_Array is array (0 .. 953) of Unsigned_32 with Pack;

   type USBCTRL_REG_BLOCKS is record
      addr_endp : Unsigned_32 := 0;
      addr_endp1 : Unsigned_32 := 0;
      addr_endp2 : Unsigned_32 := 0;
      addr_endp3 : Unsigned_32 := 0;
      addr_endp4 : Unsigned_32 := 0;
      addr_endp5 : Unsigned_32 := 0;
      addr_endp6 : Unsigned_32 := 0;
      addr_endp7 : Unsigned_32 := 0;
      addr_endp8 : Unsigned_32 := 0;
      addr_endp9 : Unsigned_32 := 0;
      addr_endp10 : Unsigned_32 := 0;
      addr_endp11 : Unsigned_32 := 0;
      addr_endp12 : Unsigned_32 := 0;
      addr_endp13 : Unsigned_32 := 0;
      addr_endp14 : Unsigned_32 := 0;
      addr_endp15 : Unsigned_32 := 0;
      main_ctrl : Unsigned_32 := 0;
      sof_wr : Unsigned_32 := 0;
      sof_rd : Unsigned_32 := 0;
      sie_ctrl : Unsigned_32 := 0;
      sie_status : Unsigned_32 := 0;
      int_ep_ctrl : Unsigned_32 := 0;
      buff_status : Unsigned_32 := 0;
      buff_cpu_should_handle : Unsigned_32 := 0;
      ep_abort : Unsigned_32 := 0;
      ep_abort_done : Unsigned_32 := 0;
      ep_stall_arm : Unsigned_32 := 0;
      nak_poll : Unsigned_32 := 0;
      ep_status_stall_nak : Unsigned_32 := 0;
      usb_muxing : Unsigned_32 := 0;
      usb_pwr : Unsigned_32 := 0;
      usbphy_direct : Unsigned_32 := 0;
      usbphy_direct_override : Unsigned_32 := 0;
      usbphy_trim : Unsigned_32 := 0;
      linestate_tuning : Unsigned_32 := 0;
      intr : Unsigned_32 := 0;
      inte : Unsigned_32 := 0;
      intf : Unsigned_32 := 0;
      ints : Unsigned_32 := 0;
      RSVD0 : RSVD0_Array;
      sof_timestamp_raw : Unsigned_32 := 0;
      sof_timestamp_last : Unsigned_32 := 0;
      sm_state : Unsigned_32 := 0;
      ep_tx_error : Unsigned_32 := 0;
      ep_rx_error : Unsigned_32 := 0;
      dev_sm_watchdog : Unsigned_32 := 0;
      RSVD1 : RSVD1_Array;
      addr_endp_xor : Unsigned_32 := 0;
      addr_endp1_xor : Unsigned_32 := 0;
      addr_endp2_xor : Unsigned_32 := 0;
      addr_endp3_xor : Unsigned_32 := 0;
      addr_endp4_xor : Unsigned_32 := 0;
      addr_endp5_xor : Unsigned_32 := 0;
      addr_endp6_xor : Unsigned_32 := 0;
      addr_endp7_xor : Unsigned_32 := 0;
      addr_endp8_xor : Unsigned_32 := 0;
      addr_endp9_xor : Unsigned_32 := 0;
      addr_endp10_xor : Unsigned_32 := 0;
      addr_endp11_xor : Unsigned_32 := 0;
      addr_endp12_xor : Unsigned_32 := 0;
      addr_endp13_xor : Unsigned_32 := 0;
      addr_endp14_xor : Unsigned_32 := 0;
      addr_endp15_xor : Unsigned_32 := 0;
      main_ctrl_xor : Unsigned_32 := 0;
      sof_wr_xor : Unsigned_32 := 0;
      sof_rd_xor : Unsigned_32 := 0;
      sie_ctrl_xor : Unsigned_32 := 0;
      sie_status_xor : Unsigned_32 := 0;
      int_ep_ctrl_xor : Unsigned_32 := 0;
      buff_status_xor : Unsigned_32 := 0;
      buff_cpu_should_handle_xor : Unsigned_32 := 0;
      ep_abort_xor : Unsigned_32 := 0;
      ep_abort_done_xor : Unsigned_32 := 0;
      ep_stall_arm_xor : Unsigned_32 := 0;
      nak_poll_xor : Unsigned_32 := 0;
      ep_status_stall_nak_xor : Unsigned_32 := 0;
      usb_muxing_xor : Unsigned_32 := 0;
      usb_pwr_xor : Unsigned_32 := 0;
      usbphy_direct_xor : Unsigned_32 := 0;
      usbphy_direct_override_xor : Unsigned_32 := 0;
      usbphy_trim_xor : Unsigned_32 := 0;
      linestate_tuning_xor : Unsigned_32 := 0;
      intr_xor : Unsigned_32 := 0;
      inte_xor : Unsigned_32 := 0;
      intf_xor : Unsigned_32 := 0;
      ints_xor : Unsigned_32 := 0;
      RSVDxor_0 : RSVD0_Array;
      sof_timestamp_raw_xor : Unsigned_32 := 0;
      sof_timestamp_last_xor : Unsigned_32 := 0;
      sm_state_xor : Unsigned_32 := 0;
      ep_tx_error_xor : Unsigned_32 := 0;
      ep_rx_error_xor : Unsigned_32 := 0;
      dev_sm_watchdog_xor : Unsigned_32 := 0;
      RSVDxor_1 : RSVD1_Array;
      addr_endp_set : Unsigned_32 := 0;
      addr_endp1_set : Unsigned_32 := 0;
      addr_endp2_set : Unsigned_32 := 0;
      addr_endp3_set : Unsigned_32 := 0;
      addr_endp4_set : Unsigned_32 := 0;
      addr_endp5_set : Unsigned_32 := 0;
      addr_endp6_set : Unsigned_32 := 0;
      addr_endp7_set : Unsigned_32 := 0;
      addr_endp8_set : Unsigned_32 := 0;
      addr_endp9_set : Unsigned_32 := 0;
      addr_endp10_set : Unsigned_32 := 0;
      addr_endp11_set : Unsigned_32 := 0;
      addr_endp12_set : Unsigned_32 := 0;
      addr_endp13_set : Unsigned_32 := 0;
      addr_endp14_set : Unsigned_32 := 0;
      addr_endp15_set : Unsigned_32 := 0;
      main_ctrl_set : Unsigned_32 := 0;
      sof_wr_set : Unsigned_32 := 0;
      sof_rd_set : Unsigned_32 := 0;
      sie_ctrl_set : Unsigned_32 := 0;
      sie_status_set : Unsigned_32 := 0;
      int_ep_ctrl_set : Unsigned_32 := 0;
      buff_status_set : Unsigned_32 := 0;
      buff_cpu_should_handle_set : Unsigned_32 := 0;
      ep_abort_set : Unsigned_32 := 0;
      ep_abort_done_set : Unsigned_32 := 0;
      ep_stall_arm_set : Unsigned_32 := 0;
      nak_poll_set : Unsigned_32 := 0;
      ep_status_stall_nak_set : Unsigned_32 := 0;
      usb_muxing_set : Unsigned_32 := 0;
      usb_pwr_set : Unsigned_32 := 0;
      usbphy_direct_set : Unsigned_32 := 0;
      usbphy_direct_override_set : Unsigned_32 := 0;
      usbphy_trim_set : Unsigned_32 := 0;
      linestate_tuning_set : Unsigned_32 := 0;
      intr_set : Unsigned_32 := 0;
      inte_set : Unsigned_32 := 0;
      intf_set : Unsigned_32 := 0;
      ints_set : Unsigned_32 := 0;
      RSVDset_0 : RSVD0_Array;
      sof_timestamp_raw_set : Unsigned_32 := 0;
      sof_timestamp_last_set : Unsigned_32 := 0;
      sm_state_set : Unsigned_32 := 0;
      ep_tx_error_set : Unsigned_32 := 0;
      ep_rx_error_set : Unsigned_32 := 0;
      dev_sm_watchdog_set : Unsigned_32 := 0;
      RSVDset_1 : RSVD1_Array;
      addr_endp_clr : Unsigned_32 := 0;
      addr_endp1_clr : Unsigned_32 := 0;
      addr_endp2_clr : Unsigned_32 := 0;
      addr_endp3_clr : Unsigned_32 := 0;
      addr_endp4_clr : Unsigned_32 := 0;
      addr_endp5_clr : Unsigned_32 := 0;
      addr_endp6_clr : Unsigned_32 := 0;
      addr_endp7_clr : Unsigned_32 := 0;
      addr_endp8_clr : Unsigned_32 := 0;
      addr_endp9_clr : Unsigned_32 := 0;
      addr_endp10_clr : Unsigned_32 := 0;
      addr_endp11_clr : Unsigned_32 := 0;
      addr_endp12_clr : Unsigned_32 := 0;
      addr_endp13_clr : Unsigned_32 := 0;
      addr_endp14_clr : Unsigned_32 := 0;
      addr_endp15_clr : Unsigned_32 := 0;
      main_ctrl_clr : Unsigned_32 := 0;
      sof_wr_clr : Unsigned_32 := 0;
      sof_rd_clr : Unsigned_32 := 0;
      sie_ctrl_clr : Unsigned_32 := 0;
      sie_status_clr : Unsigned_32 := 0;
      int_ep_ctrl_clr : Unsigned_32 := 0;
      buff_status_clr : Unsigned_32 := 0;
      buff_cpu_should_handle_clr : Unsigned_32 := 0;
      ep_abort_clr : Unsigned_32 := 0;
      ep_abort_done_clr : Unsigned_32 := 0;
      ep_stall_arm_clr : Unsigned_32 := 0;
      nak_poll_clr : Unsigned_32 := 0;
      ep_status_stall_nak_clr : Unsigned_32 := 0;
      usb_muxing_clr : Unsigned_32 := 0;
      usb_pwr_clr : Unsigned_32 := 0;
      usbphy_direct_clr : Unsigned_32 := 0;
      usbphy_direct_override_clr : Unsigned_32 := 0;
      usbphy_trim_clr : Unsigned_32 := 0;
      linestate_tuning_clr : Unsigned_32 := 0;
      intr_clr : Unsigned_32 := 0;
      inte_clr : Unsigned_32 := 0;
      intf_clr : Unsigned_32 := 0;
      ints_clr : Unsigned_32 := 0;
      RSVDclr_0 : RSVD0_Array;
      sof_timestamp_raw_clr : Unsigned_32 := 0;
      sof_timestamp_last_clr : Unsigned_32 := 0;
      sm_state_clr : Unsigned_32 := 0;
      ep_tx_error_clr : Unsigned_32 := 0;
      ep_rx_error_clr : Unsigned_32 := 0;
      dev_sm_watchdog_clr : Unsigned_32 := 0;
      RSVDclr_1 : RSVD1_Array;
   end record with Pack, Size => 4096 * 4 * 8;


   -- IO Registers as struct

   usbctrl : USBCTRL_REG_BLOCKS
      with Volatile,
           Import,
           Address => System'To_Address (16#50110000#);


   -- IO Registers AS MACROS

   USBCTRL_ADDR_ENDP : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110000#);
   USBCTRL_ADDR_ENDP1 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110004#);
   USBCTRL_ADDR_ENDP2 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110008#);
   USBCTRL_ADDR_ENDP3 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011000c#);
   USBCTRL_ADDR_ENDP4 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110010#);
   USBCTRL_ADDR_ENDP5 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110014#);
   USBCTRL_ADDR_ENDP6 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110018#);
   USBCTRL_ADDR_ENDP7 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011001c#);
   USBCTRL_ADDR_ENDP8 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110020#);
   USBCTRL_ADDR_ENDP9 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110024#);
   USBCTRL_ADDR_ENDP10 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110028#);
   USBCTRL_ADDR_ENDP11 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011002c#);
   USBCTRL_ADDR_ENDP12 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110030#);
   USBCTRL_ADDR_ENDP13 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110034#);
   USBCTRL_ADDR_ENDP14 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110038#);
   USBCTRL_ADDR_ENDP15 : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011003c#);
   USBCTRL_MAIN_CTRL : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110040#);
   USBCTRL_SOF_WR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110044#);
   USBCTRL_SOF_RD : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110048#);
   USBCTRL_SIE_CTRL : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011004c#);
   USBCTRL_SIE_STATUS : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110050#);
   USBCTRL_INT_EP_CTRL : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110054#);
   USBCTRL_BUFF_STATUS : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110058#);
   USBCTRL_BUFF_CPU_SHOULD_HANDLE : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011005c#);
   USBCTRL_EP_ABORT : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110060#);
   USBCTRL_EP_ABORT_DONE : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110064#);
   USBCTRL_EP_STALL_ARM : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110068#);
   USBCTRL_NAK_POLL : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011006c#);
   USBCTRL_EP_STATUS_STALL_NAK : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110070#);
   USBCTRL_USB_MUXING : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110074#);
   USBCTRL_USB_PWR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110078#);
   USBCTRL_USBPHY_DIRECT : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011007c#);
   USBCTRL_USBPHY_DIRECT_OVERRIDE : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110080#);
   USBCTRL_USBPHY_TRIM : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110084#);
   USBCTRL_LINESTATE_TUNING : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110088#);
   USBCTRL_INTR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011008c#);
   USBCTRL_INTE : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110090#);
   USBCTRL_INTF : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110094#);
   USBCTRL_INTS : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110098#);
   USBCTRL_SOF_TIMESTAMP_RAW : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110100#);
   USBCTRL_SOF_TIMESTAMP_LAST : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110104#);
   USBCTRL_SM_STATE : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110108#);
   USBCTRL_EP_TX_ERROR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011010c#);
   USBCTRL_EP_RX_ERROR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110110#);
   USBCTRL_DEV_SM_WATCHDOG : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50110114#);
   USBCTRL_ADDR_ENDP_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111000#);
   USBCTRL_ADDR_ENDP1_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111004#);
   USBCTRL_ADDR_ENDP2_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111008#);
   USBCTRL_ADDR_ENDP3_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011100c#);
   USBCTRL_ADDR_ENDP4_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111010#);
   USBCTRL_ADDR_ENDP5_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111014#);
   USBCTRL_ADDR_ENDP6_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111018#);
   USBCTRL_ADDR_ENDP7_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011101c#);
   USBCTRL_ADDR_ENDP8_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111020#);
   USBCTRL_ADDR_ENDP9_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111024#);
   USBCTRL_ADDR_ENDP10_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111028#);
   USBCTRL_ADDR_ENDP11_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011102c#);
   USBCTRL_ADDR_ENDP12_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111030#);
   USBCTRL_ADDR_ENDP13_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111034#);
   USBCTRL_ADDR_ENDP14_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111038#);
   USBCTRL_ADDR_ENDP15_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011103c#);
   USBCTRL_MAIN_CTRL_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111040#);
   USBCTRL_SOF_WR_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111044#);
   USBCTRL_SOF_RD_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111048#);
   USBCTRL_SIE_CTRL_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011104c#);
   USBCTRL_SIE_STATUS_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111050#);
   USBCTRL_INT_EP_CTRL_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111054#);
   USBCTRL_BUFF_STATUS_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111058#);
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011105c#);
   USBCTRL_EP_ABORT_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111060#);
   USBCTRL_EP_ABORT_DONE_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111064#);
   USBCTRL_EP_STALL_ARM_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111068#);
   USBCTRL_NAK_POLL_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011106c#);
   USBCTRL_EP_STATUS_STALL_NAK_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111070#);
   USBCTRL_USB_MUXING_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111074#);
   USBCTRL_USB_PWR_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111078#);
   USBCTRL_USBPHY_DIRECT_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011107c#);
   USBCTRL_USBPHY_DIRECT_OVERRIDE_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111080#);
   USBCTRL_USBPHY_TRIM_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111084#);
   USBCTRL_LINESTATE_TUNING_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111088#);
   USBCTRL_INTR_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011108c#);
   USBCTRL_INTE_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111090#);
   USBCTRL_INTF_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111094#);
   USBCTRL_INTS_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111098#);
   USBCTRL_SOF_TIMESTAMP_RAW_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111100#);
   USBCTRL_SOF_TIMESTAMP_LAST_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111104#);
   USBCTRL_SM_STATE_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111108#);
   USBCTRL_EP_TX_ERROR_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011110c#);
   USBCTRL_EP_RX_ERROR_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111110#);
   USBCTRL_DEV_SM_WATCHDOG_XOR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50111114#);
   USBCTRL_ADDR_ENDP_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112000#);
   USBCTRL_ADDR_ENDP1_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112004#);
   USBCTRL_ADDR_ENDP2_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112008#);
   USBCTRL_ADDR_ENDP3_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011200c#);
   USBCTRL_ADDR_ENDP4_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112010#);
   USBCTRL_ADDR_ENDP5_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112014#);
   USBCTRL_ADDR_ENDP6_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112018#);
   USBCTRL_ADDR_ENDP7_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011201c#);
   USBCTRL_ADDR_ENDP8_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112020#);
   USBCTRL_ADDR_ENDP9_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112024#);
   USBCTRL_ADDR_ENDP10_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112028#);
   USBCTRL_ADDR_ENDP11_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011202c#);
   USBCTRL_ADDR_ENDP12_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112030#);
   USBCTRL_ADDR_ENDP13_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112034#);
   USBCTRL_ADDR_ENDP14_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112038#);
   USBCTRL_ADDR_ENDP15_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011203c#);
   USBCTRL_MAIN_CTRL_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112040#);
   USBCTRL_SOF_WR_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112044#);
   USBCTRL_SOF_RD_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112048#);
   USBCTRL_SIE_CTRL_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011204c#);
   USBCTRL_SIE_STATUS_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112050#);
   USBCTRL_INT_EP_CTRL_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112054#);
   USBCTRL_BUFF_STATUS_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112058#);
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011205c#);
   USBCTRL_EP_ABORT_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112060#);
   USBCTRL_EP_ABORT_DONE_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112064#);
   USBCTRL_EP_STALL_ARM_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112068#);
   USBCTRL_NAK_POLL_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011206c#);
   USBCTRL_EP_STATUS_STALL_NAK_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112070#);
   USBCTRL_USB_MUXING_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112074#);
   USBCTRL_USB_PWR_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112078#);
   USBCTRL_USBPHY_DIRECT_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011207c#);
   USBCTRL_USBPHY_DIRECT_OVERRIDE_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112080#);
   USBCTRL_USBPHY_TRIM_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112084#);
   USBCTRL_LINESTATE_TUNING_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112088#);
   USBCTRL_INTR_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011208c#);
   USBCTRL_INTE_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112090#);
   USBCTRL_INTF_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112094#);
   USBCTRL_INTS_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112098#);
   USBCTRL_SOF_TIMESTAMP_RAW_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112100#);
   USBCTRL_SOF_TIMESTAMP_LAST_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112104#);
   USBCTRL_SM_STATE_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112108#);
   USBCTRL_EP_TX_ERROR_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011210c#);
   USBCTRL_EP_RX_ERROR_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112110#);
   USBCTRL_DEV_SM_WATCHDOG_SET : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50112114#);
   USBCTRL_ADDR_ENDP_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113000#);
   USBCTRL_ADDR_ENDP1_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113004#);
   USBCTRL_ADDR_ENDP2_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113008#);
   USBCTRL_ADDR_ENDP3_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011300c#);
   USBCTRL_ADDR_ENDP4_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113010#);
   USBCTRL_ADDR_ENDP5_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113014#);
   USBCTRL_ADDR_ENDP6_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113018#);
   USBCTRL_ADDR_ENDP7_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011301c#);
   USBCTRL_ADDR_ENDP8_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113020#);
   USBCTRL_ADDR_ENDP9_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113024#);
   USBCTRL_ADDR_ENDP10_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113028#);
   USBCTRL_ADDR_ENDP11_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011302c#);
   USBCTRL_ADDR_ENDP12_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113030#);
   USBCTRL_ADDR_ENDP13_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113034#);
   USBCTRL_ADDR_ENDP14_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113038#);
   USBCTRL_ADDR_ENDP15_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011303c#);
   USBCTRL_MAIN_CTRL_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113040#);
   USBCTRL_SOF_WR_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113044#);
   USBCTRL_SOF_RD_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113048#);
   USBCTRL_SIE_CTRL_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011304c#);
   USBCTRL_SIE_STATUS_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113050#);
   USBCTRL_INT_EP_CTRL_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113054#);
   USBCTRL_BUFF_STATUS_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113058#);
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011305c#);
   USBCTRL_EP_ABORT_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113060#);
   USBCTRL_EP_ABORT_DONE_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113064#);
   USBCTRL_EP_STALL_ARM_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113068#);
   USBCTRL_NAK_POLL_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011306c#);
   USBCTRL_EP_STATUS_STALL_NAK_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113070#);
   USBCTRL_USB_MUXING_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113074#);
   USBCTRL_USB_PWR_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113078#);
   USBCTRL_USBPHY_DIRECT_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011307c#);
   USBCTRL_USBPHY_DIRECT_OVERRIDE_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113080#);
   USBCTRL_USBPHY_TRIM_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113084#);
   USBCTRL_LINESTATE_TUNING_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113088#);
   USBCTRL_INTR_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011308c#);
   USBCTRL_INTE_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113090#);
   USBCTRL_INTF_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113094#);
   USBCTRL_INTS_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113098#);
   USBCTRL_SOF_TIMESTAMP_RAW_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113100#);
   USBCTRL_SOF_TIMESTAMP_LAST_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113104#);
   USBCTRL_SM_STATE_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113108#);
   USBCTRL_EP_TX_ERROR_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#5011310c#);
   USBCTRL_EP_RX_ERROR_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113110#);
   USBCTRL_DEV_SM_WATCHDOG_CLR : Unsigned_32 with Volatile, Import, Address => System'To_Address (16#50113114#);

   -- ADDR_ENDP Register macros

   function USBCTRL_ADDR_ENDP_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP1 Register macros

   function USBCTRL_ADDR_ENDP1_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP1_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP1_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP1_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP1_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP1_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP1_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP1_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP2 Register macros

   function USBCTRL_ADDR_ENDP2_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP2_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP2_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP2_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP2_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP2_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP2_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP2_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP3 Register macros

   function USBCTRL_ADDR_ENDP3_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP3_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP3_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP3_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP3_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP3_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP3_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP3_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP4 Register macros

   function USBCTRL_ADDR_ENDP4_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP4_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP4_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP4_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP4_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP4_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP4_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP4_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP5 Register macros

   function USBCTRL_ADDR_ENDP5_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP5_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP5_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP5_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP5_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP5_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP5_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP5_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP6 Register macros

   function USBCTRL_ADDR_ENDP6_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP6_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP6_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP6_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP6_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP6_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP6_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP6_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP7 Register macros

   function USBCTRL_ADDR_ENDP7_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP7_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP7_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP7_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP7_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP7_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP7_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP7_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP8 Register macros

   function USBCTRL_ADDR_ENDP8_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP8_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP8_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP8_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP8_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP8_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP8_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP8_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP9 Register macros

   function USBCTRL_ADDR_ENDP9_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP9_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP9_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP9_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP9_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP9_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP9_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP9_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP10 Register macros

   function USBCTRL_ADDR_ENDP10_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP10_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP10_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP10_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP10_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP10_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP10_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP10_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP11 Register macros

   function USBCTRL_ADDR_ENDP11_INTEP_PREAMBLE (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 26));
   USBCTRL_ADDR_ENDP11_INTEP_PREAMBLE_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_ADDR_ENDP11_INTEP_DIR (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#1#, 25));
   USBCTRL_ADDR_ENDP11_INTEP_DIR_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_ADDR_ENDP11_ENDPOINT (v : Unsigned_32) return Unsigned_32 is (Shift_Left (v and 16#f#, 16));
   USBCTRL_ADDR_ENDP11_ENDPOINT_MASK : constant Unsigned_32 := GENERIC_F_16_MASK;
   function USBCTRL_ADDR_ENDP11_ADDRESS (v : Unsigned_32) return Unsigned_32 is (v and 16#7f#);
   USBCTRL_ADDR_ENDP11_ADDRESS_MASK : constant Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP12 Register macros

   function USBCTRL_ADDR_ENDP12_INTEP_PREAMBLE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_ADDR_ENDP12_INTEP_PREAMBLE_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_ADDR_ENDP12_INTEP_DIR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_ADDR_ENDP12_INTEP_DIR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_ADDR_ENDP12_ENDPOINT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#0F#), 16));
   USBCTRL_ADDR_ENDP12_ENDPOINT_MASK : constant Interfaces.Unsigned_32 := GENERIC_F_16_MASK;

   function USBCTRL_ADDR_ENDP12_ADDRESS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7F#), 0));
   USBCTRL_ADDR_ENDP12_ADDRESS_MASK : constant Interfaces.Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP13 Register macros

   function USBCTRL_ADDR_ENDP13_INTEP_PREAMBLE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_ADDR_ENDP13_INTEP_PREAMBLE_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_ADDR_ENDP13_INTEP_DIR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_ADDR_ENDP13_INTEP_DIR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_ADDR_ENDP13_ENDPOINT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#0F#), 16));
   USBCTRL_ADDR_ENDP13_ENDPOINT_MASK : constant Interfaces.Unsigned_32 := GENERIC_F_16_MASK;

   function USBCTRL_ADDR_ENDP13_ADDRESS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7F#), 0));
   USBCTRL_ADDR_ENDP13_ADDRESS_MASK : constant Interfaces.Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP14 Register macros

   function USBCTRL_ADDR_ENDP14_INTEP_PREAMBLE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_ADDR_ENDP14_INTEP_PREAMBLE_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_ADDR_ENDP14_INTEP_DIR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_ADDR_ENDP14_INTEP_DIR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_ADDR_ENDP14_ENDPOINT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#0F#), 16));
   USBCTRL_ADDR_ENDP14_ENDPOINT_MASK : constant Interfaces.Unsigned_32 := GENERIC_F_16_MASK;

   function USBCTRL_ADDR_ENDP14_ADDRESS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7F#), 0));
   USBCTRL_ADDR_ENDP14_ADDRESS_MASK : constant Interfaces.Unsigned_32 := GENERIC_7F_0_MASK;

   -- ADDR_ENDP15 Register macros

   function USBCTRL_ADDR_ENDP15_INTEP_PREAMBLE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_ADDR_ENDP15_INTEP_PREAMBLE_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_ADDR_ENDP15_INTEP_DIR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_ADDR_ENDP15_INTEP_DIR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_ADDR_ENDP15_ENDPOINT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#0F#), 16));
   USBCTRL_ADDR_ENDP15_ENDPOINT_MASK : constant Interfaces.Unsigned_32 := GENERIC_F_16_MASK;

   function USBCTRL_ADDR_ENDP15_ADDRESS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7F#), 0));
   USBCTRL_ADDR_ENDP15_ADDRESS_MASK : constant Interfaces.Unsigned_32 := GENERIC_7F_0_MASK;

   -- MAIN_CTRL Register macros

   function USBCTRL_MAIN_CTRL_SIM_TIMING (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 31));
   USBCTRL_MAIN_CTRL_SIM_TIMING_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_31_MASK;

   function USBCTRL_MAIN_CTRL_PHY_ISO (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 2));
   USBCTRL_MAIN_CTRL_PHY_ISO_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_MAIN_CTRL_HOST_NDEVICE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 1));
   USBCTRL_MAIN_CTRL_HOST_NDEVICE_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_MAIN_CTRL_CONTROLLER_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 0));
   USBCTRL_MAIN_CTRL_CONTROLLER_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_0_MASK;

   -- SOF_WR Register macros
   SOF_GENERIC_COUNT_MASK : constant Unsigned_32 := Shift_Left (Unsigned_32'(16#7FF#), 0);

   function USBCTRL_SOF_WR_COUNT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7FF#), 0));
   USBCTRL_SOF_WR_COUNT_MASK : constant Interfaces.Unsigned_32 := GENERIC_7FF_0_MASK;

   -- SOF_RD Register macros

   function USBCTRL_SOF_RD_COUNT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7FF#), 0));
   USBCTRL_SOF_RD_COUNT_MASK : constant Interfaces.Unsigned_32 := GENERIC_7FF_0_MASK;

   -- SIE_CTRL Register macros
   
   function USBCTRL_SIE_CTRL_EP0_INT_STALL (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 31));
   USBCTRL_SIE_CTRL_EP0_INT_STALL_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_31_MASK;

   function USBCTRL_SIE_CTRL_EP0_DOUBLE_BUF (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 30));
   USBCTRL_SIE_CTRL_EP0_DOUBLE_BUF_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_30_MASK;

   function USBCTRL_SIE_CTRL_EP0_INT_1BUF (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 29));
   USBCTRL_SIE_CTRL_EP0_INT_1BUF_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_29_MASK;

   function USBCTRL_SIE_CTRL_EP0_INT_2BUF (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 28));
   USBCTRL_SIE_CTRL_EP0_INT_2BUF_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_28_MASK;

   function USBCTRL_SIE_CTRL_EP0_INT_NAK (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 27));
   USBCTRL_SIE_CTRL_EP0_INT_NAK_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_27_MASK;

   function USBCTRL_SIE_CTRL_DIRECT_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_SIE_CTRL_DIRECT_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_SIE_CTRL_DIRECT_DP (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_SIE_CTRL_DIRECT_DP_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_SIE_CTRL_DIRECT_DM (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 24));
   USBCTRL_SIE_CTRL_DIRECT_DM_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_24_MASK;  

   function USBCTRL_SIE_CTRL_EP0_STOP_ON_SHORT_PACKET (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 19));
   USBCTRL_SIE_CTRL_EP0_STOP_ON_SHORT_PACKET_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_SIE_CTRL_TRANSCEIVER_PD (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 18));
   USBCTRL_SIE_CTRL_TRANSCEIVER_PD_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_SIE_CTRL_RPU_OPT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 17));
   USBCTRL_SIE_CTRL_RPU_OPT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_SIE_CTRL_PULLUP_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 16));
   USBCTRL_SIE_CTRL_PULLUP_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_SIE_CTRL_PULLDOWN_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 15));
   USBCTRL_SIE_CTRL_PULLDOWN_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_SIE_CTRL_RESET_BUS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 13));
   USBCTRL_SIE_CTRL_RESET_BUS_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_SIE_CTRL_RESUME (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 12));
   USBCTRL_SIE_CTRL_RESUME_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_SIE_CTRL_VBUS_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 11));  
   USBCTRL_SIE_CTRL_VBUS_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_11_MASK; 

   function USBCTRL_SIE_CTRL_KEEP_ALIVE_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 10));
   USBCTRL_SIE_CTRL_KEEP_ALIVE_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_SIE_CTRL_SOF_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 9));
   USBCTRL_SIE_CTRL_SOF_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_SIE_CTRL_SOF_SYNC (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 8));
   USBCTRL_SIE_CTRL_SOF_SYNC_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_SIE_CTRL_PREAMBLE_EN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 6));
   USBCTRL_SIE_CTRL_PREAMBLE_EN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_SIE_CTRL_STOP_TRANS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 4));
   USBCTRL_SIE_CTRL_STOP_TRANS_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_SIE_CTRL_RECEIVE_DATA (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 3));
   USBCTRL_SIE_CTRL_RECEIVE_DATA_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_SIE_CTRL_SEND_DATA (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 2));
   USBCTRL_SIE_CTRL_SEND_DATA_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_SIE_CTRL_SEND_SETUP (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 1));
   USBCTRL_SIE_CTRL_SEND_SETUP_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_SIE_CTRL_START_TRANS (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 0));
   USBCTRL_SIE_CTRL_START_TRANS_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_0_MASK;

   -- SIE_STATUS Register macros

   function USBCTRL_SIE_STATUS_DATA_SEQ_ERROR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 31));
   USBCTRL_SIE_STATUS_DATA_SEQ_ERROR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_31_MASK;

   function USBCTRL_SIE_STATUS_ACK_REC (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 30));
   USBCTRL_SIE_STATUS_ACK_REC_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_30_MASK;

   function USBCTRL_SIE_STATUS_STALL_REC (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 29));
   USBCTRL_SIE_STATUS_STALL_REC_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_29_MASK;

   function USBCTRL_SIE_STATUS_NAK_REC (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 28));
   USBCTRL_SIE_STATUS_NAK_REC_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_28_MASK;

   function USBCTRL_SIE_STATUS_RX_TIMEOUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 27));
   USBCTRL_SIE_STATUS_RX_TIMEOUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_27_MASK;

   function USBCTRL_SIE_STATUS_RX_OVERFLOW (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_SIE_STATUS_RX_OVERFLOW_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_SIE_STATUS_BIT_STUFF_ERROR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_SIE_STATUS_BIT_STUFF_ERROR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_SIE_STATUS_CRC_ERROR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 24));
   USBCTRL_SIE_STATUS_CRC_ERROR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_24_MASK;

   function USBCTRL_SIE_STATUS_ENDPOINT_ERROR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 23));
   USBCTRL_SIE_STATUS_ENDPOINT_ERROR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_23_MASK;
   
   function USBCTRL_SIE_STATUS_BUS_RESET (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 19));
   USBCTRL_SIE_STATUS_BUS_RESET_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_SIE_STATUS_TRANS_COMPLETE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 18));
   USBCTRL_SIE_STATUS_TRANS_COMPLETE_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_SIE_STATUS_SETUP_REC (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 17));
   USBCTRL_SIE_STATUS_SETUP_REC_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_SIE_STATUS_CONNECTED (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 16));
   USBCTRL_SIE_STATUS_CONNECTED_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_SIE_STATUS_RX_SHORT_PACKET (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 12));
   USBCTRL_SIE_STATUS_RX_SHORT_PACKET_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_SIE_STATUS_RESUME (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 11));
   USBCTRL_SIE_STATUS_RESUME_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_SIE_STATUS_VBUS_OVER_CURR (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 10));
   USBCTRL_SIE_STATUS_VBUS_OVER_CURR_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_SIE_STATUS_SPEED (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#03#), 8));
   USBCTRL_SIE_STATUS_SPEED_MASK : constant Interfaces.Unsigned_32 := GENERIC_3_8_MASK;

   function USBCTRL_SIE_STATUS_SUSPENDED (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 4));
   USBCTRL_SIE_STATUS_SUSPENDED_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_SIE_STATUS_LINE_STATE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#03#), 2));
   USBCTRL_SIE_STATUS_LINE_STATE_MASK : constant Interfaces.Unsigned_32 := GENERIC_3_2_MASK;

   function USBCTRL_SIE_STATUS_VBUS_DETECTED (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 0));
   USBCTRL_SIE_STATUS_VBUS_DETECTED_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_0_MASK;

   -- INT_EP_CTRL Register macros 

   function USBCTRL_INT_EP_CTRL_INT_EP_ACTIVE (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#7FFF#), 1));
   USBCTRL_INT_EP_CTRL_INT_EP_ACTIVE_MASK : constant Interfaces.Unsigned_32 := GENERIC_7FFF_1_MASK;

   -- BUFF_STATUS Register macros

   function USBCTRL_BUFF_STATUS_EP15_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 31));
   USBCTRL_BUFF_STATUS_EP15_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_31_MASK;

   function USBCTRL_BUFF_STATUS_EP15_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 30));
   USBCTRL_BUFF_STATUS_EP15_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_30_MASK;

   function USBCTRL_BUFF_STATUS_EP14_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 29));
   USBCTRL_BUFF_STATUS_EP14_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_29_MASK;

   function USBCTRL_BUFF_STATUS_EP14_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 28));
   USBCTRL_BUFF_STATUS_EP14_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_28_MASK;

   function USBCTRL_BUFF_STATUS_EP13_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 27));
   USBCTRL_BUFF_STATUS_EP13_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_27_MASK;

   function USBCTRL_BUFF_STATUS_EP13_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_BUFF_STATUS_EP13_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_BUFF_STATUS_EP12_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_BUFF_STATUS_EP12_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_BUFF_STATUS_EP12_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 24));
   USBCTRL_BUFF_STATUS_EP12_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_24_MASK;

   function USBCTRL_BUFF_STATUS_EP11_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 23));
   USBCTRL_BUFF_STATUS_EP11_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_BUFF_STATUS_EP11_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 22));
   USBCTRL_BUFF_STATUS_EP11_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_BUFF_STATUS_EP10_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 21));
   USBCTRL_BUFF_STATUS_EP10_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_21_MASK;

   function USBCTRL_BUFF_STATUS_EP10_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 20));
   USBCTRL_BUFF_STATUS_EP10_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_20_MASK;
   
   function USBCTRL_BUFF_STATUS_EP9_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 19));
   USBCTRL_BUFF_STATUS_EP9_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_BUFF_STATUS_EP9_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 18));
   USBCTRL_BUFF_STATUS_EP9_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_BUFF_STATUS_EP8_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 17));
   USBCTRL_BUFF_STATUS_EP8_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_BUFF_STATUS_EP8_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 16));
   USBCTRL_BUFF_STATUS_EP8_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_BUFF_STATUS_EP7_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 15));
   USBCTRL_BUFF_STATUS_EP7_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_BUFF_STATUS_EP7_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 14));
   USBCTRL_BUFF_STATUS_EP7_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_14_MASK;

   function USBCTRL_BUFF_STATUS_EP6_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 13));
   USBCTRL_BUFF_STATUS_EP6_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_BUFF_STATUS_EP6_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 12));
   USBCTRL_BUFF_STATUS_EP6_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_BUFF_STATUS_EP5_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 11));
   USBCTRL_BUFF_STATUS_EP5_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_BUFF_STATUS_EP5_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 10));
   USBCTRL_BUFF_STATUS_EP5_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_BUFF_STATUS_EP4_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 9));
   USBCTRL_BUFF_STATUS_EP4_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_BUFF_STATUS_EP4_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 8));
   USBCTRL_BUFF_STATUS_EP4_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_BUFF_STATUS_EP3_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 7));
   USBCTRL_BUFF_STATUS_EP3_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_BUFF_STATUS_EP3_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 6));
   USBCTRL_BUFF_STATUS_EP3_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_BUFF_STATUS_EP2_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 5));
   USBCTRL_BUFF_STATUS_EP2_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_BUFF_STATUS_EP2_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 4));
   USBCTRL_BUFF_STATUS_EP2_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_BUFF_STATUS_EP1_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 3));
   USBCTRL_BUFF_STATUS_EP1_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_BUFF_STATUS_EP1_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 2));
   USBCTRL_BUFF_STATUS_EP1_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_BUFF_STATUS_EP0_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 1));
   USBCTRL_BUFF_STATUS_EP0_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_BUFF_STATUS_EP0_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 0));
   USBCTRL_BUFF_STATUS_EP0_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_0_MASK;

   -- BUFF_CPU_SHOULD_HANDLE Register macros 

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP15_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 31));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP15_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_31_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP15_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 30));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP15_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_30_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP14_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 29));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP14_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_29_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP14_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 28));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP14_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_28_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP13_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 27));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP13_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_27_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP13_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 26));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP13_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP12_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 25));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP12_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP12_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 24));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP12_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_24_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP11_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 23));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP11_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP11_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 22));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP11_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP10_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 21));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP10_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_21_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP10_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 20));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP10_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP9_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 19));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP9_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP9_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 18));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP9_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP8_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 17));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP8_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP8_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 16));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP8_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP7_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 15));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP7_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP7_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 14));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP7_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_14_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP6_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 13));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP6_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP6_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 12));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP6_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP5_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 11));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP5_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP5_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 10));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP5_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP4_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 9));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP4_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP4_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 8));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP4_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP3_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 7));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP3_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP3_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 6));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP3_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP2_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 5));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP2_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP2_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 4));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP2_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP1_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 3));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP1_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP1_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 2));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP1_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP0_OUT (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 1));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP0_OUT_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP0_IN (v : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
     (Shift_Left ((v and 16#01#), 0));
   USBCTRL_BUFF_CPU_SHOULD_HANDLE_EP0_IN_MASK : constant Interfaces.Unsigned_32 := GENERIC_1_0_MASK;

   --  EP_ABORT Register macros

   function USBCTRL_EP_ABORT_EP15_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 31));
   USBCTRL_EP_ABORT_EP15_OUT_MASK : constant Unsigned_32 := GENERIC_1_31_MASK;
   function USBCTRL_EP_ABORT_EP15_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 30));
   USBCTRL_EP_ABORT_EP15_IN_MASK : constant Unsigned_32 := GENERIC_1_30_MASK;
   function USBCTRL_EP_ABORT_EP14_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 29));
   USBCTRL_EP_ABORT_EP14_OUT_MASK : constant Unsigned_32 := GENERIC_1_29_MASK;
   function USBCTRL_EP_ABORT_EP14_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 28));
   USBCTRL_EP_ABORT_EP14_IN_MASK : constant Unsigned_32 := GENERIC_1_28_MASK;
   function USBCTRL_EP_ABORT_EP13_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 27));
   USBCTRL_EP_ABORT_EP13_OUT_MASK : constant Unsigned_32 := GENERIC_1_27_MASK;
   function USBCTRL_EP_ABORT_EP13_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 26));
   USBCTRL_EP_ABORT_EP13_IN_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_EP_ABORT_EP12_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 25));
   USBCTRL_EP_ABORT_EP12_OUT_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_EP_ABORT_EP12_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 24));
   USBCTRL_EP_ABORT_EP12_IN_MASK : constant Unsigned_32 := GENERIC_1_24_MASK;
   function USBCTRL_EP_ABORT_EP11_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 23));
   USBCTRL_EP_ABORT_EP11_OUT_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;
   function USBCTRL_EP_ABORT_EP11_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 22));
   USBCTRL_EP_ABORT_EP11_IN_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;
   function USBCTRL_EP_ABORT_EP10_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 21));
   USBCTRL_EP_ABORT_EP10_OUT_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;
   function USBCTRL_EP_ABORT_EP10_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 20));
   USBCTRL_EP_ABORT_EP10_IN_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;
   function USBCTRL_EP_ABORT_EP9_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 19));
   USBCTRL_EP_ABORT_EP9_OUT_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;
   function USBCTRL_EP_ABORT_EP9_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 18));
   USBCTRL_EP_ABORT_EP9_IN_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;
   function USBCTRL_EP_ABORT_EP8_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 17));
   USBCTRL_EP_ABORT_EP8_OUT_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;
   function USBCTRL_EP_ABORT_EP8_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 16));
   USBCTRL_EP_ABORT_EP8_IN_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;
   function USBCTRL_EP_ABORT_EP7_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 15));
   USBCTRL_EP_ABORT_EP7_OUT_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;
   function USBCTRL_EP_ABORT_EP7_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 14));
   USBCTRL_EP_ABORT_EP7_IN_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;
   function USBCTRL_EP_ABORT_EP6_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 13));
   USBCTRL_EP_ABORT_EP6_OUT_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;
   function USBCTRL_EP_ABORT_EP6_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 12));
   USBCTRL_EP_ABORT_EP6_IN_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;
   function USBCTRL_EP_ABORT_EP5_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 11));
   USBCTRL_EP_ABORT_EP5_OUT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;
   function USBCTRL_EP_ABORT_EP5_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 10));
   USBCTRL_EP_ABORT_EP5_IN_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;
   function USBCTRL_EP_ABORT_EP4_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 9));
   USBCTRL_EP_ABORT_EP4_OUT_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;
   function USBCTRL_EP_ABORT_EP4_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 8));
   USBCTRL_EP_ABORT_EP4_IN_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;
   function USBCTRL_EP_ABORT_EP3_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 7));
   USBCTRL_EP_ABORT_EP3_OUT_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;
   function USBCTRL_EP_ABORT_EP3_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 6));
   USBCTRL_EP_ABORT_EP3_IN_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;
   function USBCTRL_EP_ABORT_EP2_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 5));
   USBCTRL_EP_ABORT_EP2_OUT_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;
   function USBCTRL_EP_ABORT_EP2_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_EP_ABORT_EP2_IN_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_EP_ABORT_EP1_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 3));
   USBCTRL_EP_ABORT_EP1_OUT_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;
   function USBCTRL_EP_ABORT_EP1_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_EP_ABORT_EP1_IN_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_EP_ABORT_EP0_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_EP_ABORT_EP0_OUT_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_EP_ABORT_EP0_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_EP_ABORT_EP0_IN_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   function USBCTRL_EP_ABORT_DONE_EP15_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 31));
   USBCTRL_EP_ABORT_DONE_EP15_OUT_MASK : constant Unsigned_32 := GENERIC_1_31_MASK;
   function USBCTRL_EP_ABORT_DONE_EP15_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 30));
   USBCTRL_EP_ABORT_DONE_EP15_IN_MASK : constant Unsigned_32 := GENERIC_1_30_MASK;
   function USBCTRL_EP_ABORT_DONE_EP14_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 29));
   USBCTRL_EP_ABORT_DONE_EP14_OUT_MASK : constant Unsigned_32 := GENERIC_1_29_MASK;
   function USBCTRL_EP_ABORT_DONE_EP14_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 28));
   USBCTRL_EP_ABORT_DONE_EP14_IN_MASK : constant Unsigned_32 := GENERIC_1_28_MASK;
   function USBCTRL_EP_ABORT_DONE_EP13_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 27));
   USBCTRL_EP_ABORT_DONE_EP13_OUT_MASK : constant Unsigned_32 := GENERIC_1_27_MASK;
   function USBCTRL_EP_ABORT_DONE_EP13_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 26));
   USBCTRL_EP_ABORT_DONE_EP13_IN_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_EP_ABORT_DONE_EP12_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 25));
   USBCTRL_EP_ABORT_DONE_EP12_OUT_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_EP_ABORT_DONE_EP12_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 24));
   USBCTRL_EP_ABORT_DONE_EP12_IN_MASK : constant Unsigned_32 := GENERIC_1_24_MASK;
   function USBCTRL_EP_ABORT_DONE_EP11_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 23));
   USBCTRL_EP_ABORT_DONE_EP11_OUT_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;
   function USBCTRL_EP_ABORT_DONE_EP11_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 22));
   USBCTRL_EP_ABORT_DONE_EP11_IN_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;
   function USBCTRL_EP_ABORT_DONE_EP10_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 21));
   USBCTRL_EP_ABORT_DONE_EP10_OUT_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;
   function USBCTRL_EP_ABORT_DONE_EP10_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 20));
   USBCTRL_EP_ABORT_DONE_EP10_IN_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;
   function USBCTRL_EP_ABORT_DONE_EP9_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 19));
   USBCTRL_EP_ABORT_DONE_EP9_OUT_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;
   function USBCTRL_EP_ABORT_DONE_EP9_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 18));
   USBCTRL_EP_ABORT_DONE_EP9_IN_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;
   function USBCTRL_EP_ABORT_DONE_EP8_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 17));
   USBCTRL_EP_ABORT_DONE_EP8_OUT_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;
   function USBCTRL_EP_ABORT_DONE_EP8_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 16));
   USBCTRL_EP_ABORT_DONE_EP8_IN_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;
   function USBCTRL_EP_ABORT_DONE_EP7_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 15));
   USBCTRL_EP_ABORT_DONE_EP7_OUT_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;
   function USBCTRL_EP_ABORT_DONE_EP7_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 14));
   USBCTRL_EP_ABORT_DONE_EP7_IN_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;
   function USBCTRL_EP_ABORT_DONE_EP6_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 13));
   USBCTRL_EP_ABORT_DONE_EP6_OUT_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;
   function USBCTRL_EP_ABORT_DONE_EP6_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 12));
   USBCTRL_EP_ABORT_DONE_EP6_IN_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;
   function USBCTRL_EP_ABORT_DONE_EP5_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 11));
   USBCTRL_EP_ABORT_DONE_EP5_OUT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;
   function USBCTRL_EP_ABORT_DONE_EP5_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 10));
   USBCTRL_EP_ABORT_DONE_EP5_IN_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;
   function USBCTRL_EP_ABORT_DONE_EP4_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 9));
   USBCTRL_EP_ABORT_DONE_EP4_OUT_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;
   function USBCTRL_EP_ABORT_DONE_EP4_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 8));
   USBCTRL_EP_ABORT_DONE_EP4_IN_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;
   function USBCTRL_EP_ABORT_DONE_EP3_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 7));
   USBCTRL_EP_ABORT_DONE_EP3_OUT_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;
   function USBCTRL_EP_ABORT_DONE_EP3_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 6));
   USBCTRL_EP_ABORT_DONE_EP3_IN_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;
   function USBCTRL_EP_ABORT_DONE_EP2_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 5));
   USBCTRL_EP_ABORT_DONE_EP2_OUT_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;
   function USBCTRL_EP_ABORT_DONE_EP2_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_EP_ABORT_DONE_EP2_IN_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_EP_ABORT_DONE_EP1_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 3));
   USBCTRL_EP_ABORT_DONE_EP1_OUT_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;
   function USBCTRL_EP_ABORT_DONE_EP1_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_EP_ABORT_DONE_EP1_IN_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_EP_ABORT_DONE_EP0_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_EP_ABORT_DONE_EP0_OUT_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_EP_ABORT_DONE_EP0_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_EP_ABORT_DONE_EP0_IN_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   -- EP_ABORT_DONE Register macros

   function USBCTRL_EP_ABORT_DONE_EP15_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 31));
   USBCTRL_EP_ABORT_DONE_EP15_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_31_MASK;
   function USBCTRL_EP_ABORT_DONE_EP15_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 30));
   USBCTRL_EP_ABORT_DONE_EP15_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_30_MASK;
   function USBCTRL_EP_ABORT_DONE_EP14_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 29));
   USBCTRL_EP_ABORT_DONE_EP14_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_29_MASK;
   function USBCTRL_EP_ABORT_DONE_EP14_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 28));
   USBCTRL_EP_ABORT_DONE_EP14_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_28_MASK;
   function USBCTRL_EP_ABORT_DONE_EP13_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 27));
   USBCTRL_EP_ABORT_DONE_EP13_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_27_MASK;
   function USBCTRL_EP_ABORT_DONE_EP13_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 26));
   USBCTRL_EP_ABORT_DONE_EP13_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_EP_ABORT_DONE_EP12_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 25));
   USBCTRL_EP_ABORT_DONE_EP12_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_EP_ABORT_DONE_EP12_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 24));
   USBCTRL_EP_ABORT_DONE_EP12_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_24_MASK;
   function USBCTRL_EP_ABORT_DONE_EP11_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 23));
   USBCTRL_EP_ABORT_DONE_EP11_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_23_MASK;
   function USBCTRL_EP_ABORT_DONE_EP11_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 22));
   USBCTRL_EP_ABORT_DONE_EP11_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_22_MASK;
   function USBCTRL_EP_ABORT_DONE_EP10_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 21));
   USBCTRL_EP_ABORT_DONE_EP10_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_21_MASK;
   function USBCTRL_EP_ABORT_DONE_EP10_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 20));
   USBCTRL_EP_ABORT_DONE_EP10_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_20_MASK;
   function USBCTRL_EP_ABORT_DONE_EP9_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 19));
   USBCTRL_EP_ABORT_DONE_EP9_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_19_MASK;
   function USBCTRL_EP_ABORT_DONE_EP9_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 18));
   USBCTRL_EP_ABORT_DONE_EP9_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_18_MASK;
   function USBCTRL_EP_ABORT_DONE_EP8_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 17));
   USBCTRL_EP_ABORT_DONE_EP8_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_17_MASK;
   function USBCTRL_EP_ABORT_DONE_EP8_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 16));
   USBCTRL_EP_ABORT_DONE_EP8_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_16_MASK;
   function USBCTRL_EP_ABORT_DONE_EP7_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 15));
   USBCTRL_EP_ABORT_DONE_EP7_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_15_MASK;
   function USBCTRL_EP_ABORT_DONE_EP7_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 14));
   USBCTRL_EP_ABORT_DONE_EP7_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_14_MASK;
   function USBCTRL_EP_ABORT_DONE_EP6_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 13));
   USBCTRL_EP_ABORT_DONE_EP6_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_13_MASK;
   function USBCTRL_EP_ABORT_DONE_EP6_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 12));
   USBCTRL_EP_ABORT_DONE_EP6_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_12_MASK;
   function USBCTRL_EP_ABORT_DONE_EP5_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 11));
   USBCTRL_EP_ABORT_DONE_EP5_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_11_MASK;
   function USBCTRL_EP_ABORT_DONE_EP5_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 10));
   USBCTRL_EP_ABORT_DONE_EP5_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_10_MASK;
   function USBCTRL_EP_ABORT_DONE_EP4_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 9));
   USBCTRL_EP_ABORT_DONE_EP4_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_9_MASK;
   function USBCTRL_EP_ABORT_DONE_EP4_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 8));
   USBCTRL_EP_ABORT_DONE_EP4_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_8_MASK;
   function USBCTRL_EP_ABORT_DONE_EP3_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 7));
   USBCTRL_EP_ABORT_DONE_EP3_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_7_MASK;
   function USBCTRL_EP_ABORT_DONE_EP3_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 6));
   USBCTRL_EP_ABORT_DONE_EP3_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_6_MASK;
   function USBCTRL_EP_ABORT_DONE_EP2_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 5));
   USBCTRL_EP_ABORT_DONE_EP2_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_5_MASK;
   function USBCTRL_EP_ABORT_DONE_EP2_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_EP_ABORT_DONE_EP2_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_EP_ABORT_DONE_EP1_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 3));
   USBCTRL_EP_ABORT_DONE_EP1_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_3_MASK;
   function USBCTRL_EP_ABORT_DONE_EP1_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_EP_ABORT_DONE_EP1_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_EP_ABORT_DONE_EP0_OUT_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_EP_ABORT_DONE_EP0_OUT_MASK_v2 : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_EP_ABORT_DONE_EP0_IN_v2 (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_EP_ABORT_DONE_EP0_IN_MASK_v2 : constant Unsigned_32 := GENERIC_1_0_MASK;

   -- EP_STALL_ARM Register macros

   function USBCTRL_EP_STALL_ARM_EP0_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_EP_STALL_ARM_EP0_OUT_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_EP_STALL_ARM_EP0_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_EP_STALL_ARM_EP0_IN_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   -- NAK_POLL Register macros

   function USBCTRL_NAK_POLL_RETRY_COUNT_HI (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#F#, 28));
   USBCTRL_NAK_POLL_RETRY_COUNT_HI_MASK : constant Unsigned_32 := GENERIC_F_28_MASK;
   function USBCTRL_NAK_POLL_EPX_STOPPED_ON_NAK (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 27));
   USBCTRL_NAK_POLL_EPX_STOPPED_ON_NAK_MASK : constant Unsigned_32 := GENERIC_1_27_MASK;
   function USBCTRL_NAK_POLL_STOP_EPX_ON_NAK (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 26));
   USBCTRL_NAK_POLL_STOP_EPX_ON_NAK_MASK : constant Unsigned_32 := GENERIC_1_26_MASK; 
   function USBCTRL_NAK_POLL_DELAY_FS (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3FF#, 16));
   USBCTRL_NAK_POLL_DELAY_FS_MASK : constant Unsigned_32 := GENERIC_3FF_16_MASK;
   function USBCTRL_NAK_POLL_RETRY_COUNT_LO (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3F#, 10));
   USBCTRL_NAK_POLL_RETRY_COUNT_LO_MASK : constant Unsigned_32 := GENERIC_3F_10_MASK;  
   function USBCTRL_NAK_POLL_DELAY_LS (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#3FF#, 0));
   USBCTRL_NAK_POLL_DELAY_LS_MASK : constant Unsigned_32 := GENERIC_3FF_0_MASK;

   --  EP_STATUS_STALL_NAK Register macros

   function USBCTRL_EP_STATUS_STALL_NAK_EP15_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 31));
   USBCTRL_EP_STATUS_STALL_NAK_EP15_OUT_MASK : constant Unsigned_32 := GENERIC_1_31_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP15_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 30));
   USBCTRL_EP_STATUS_STALL_NAK_EP15_IN_MASK : constant Unsigned_32 := GENERIC_1_30_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP14_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 29));
   USBCTRL_EP_STATUS_STALL_NAK_EP14_OUT_MASK : constant Unsigned_32 := GENERIC_1_29_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP14_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 28));
   USBCTRL_EP_STATUS_STALL_NAK_EP14_IN_MASK : constant Unsigned_32 := GENERIC_1_28_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP13_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 27));
   USBCTRL_EP_STATUS_STALL_NAK_EP13_OUT_MASK : constant Unsigned_32 := GENERIC_1_27_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP13_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 26));
   USBCTRL_EP_STATUS_STALL_NAK_EP13_IN_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP12_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 25));
   USBCTRL_EP_STATUS_STALL_NAK_EP12_OUT_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP12_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 24));
   USBCTRL_EP_STATUS_STALL_NAK_EP12_IN_MASK : constant Unsigned_32 := 4;
   function USBCTRL_EP_STATUS_STALL_NAK_EP11_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 23));
   USBCTRL_EP_STATUS_STALL_NAK_EP11_OUT_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP11_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 22));
   USBCTRL_EP_STATUS_STALL_NAK_EP11_IN_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP10_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 21));
   USBCTRL_EP_STATUS_STALL_NAK_EP10_OUT_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP10_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 20));
   USBCTRL_EP_STATUS_STALL_NAK_EP10_IN_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP9_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 19));
   USBCTRL_EP_STATUS_STALL_NAK_EP9_OUT_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP9_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 18));
   USBCTRL_EP_STATUS_STALL_NAK_EP9_IN_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP8_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 17));
   USBCTRL_EP_STATUS_STALL_NAK_EP8_OUT_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP8_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 16));
   USBCTRL_EP_STATUS_STALL_NAK_EP8_IN_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP7_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 15));
   USBCTRL_EP_STATUS_STALL_NAK_EP7_OUT_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP7_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 14));
   USBCTRL_EP_STATUS_STALL_NAK_EP7_IN_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP6_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 13));
   USBCTRL_EP_STATUS_STALL_NAK_EP6_OUT_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP6_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 12));
   USBCTRL_EP_STATUS_STALL_NAK_EP6_IN_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP5_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 11));
   USBCTRL_EP_STATUS_STALL_NAK_EP5_OUT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP5_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 10));
   USBCTRL_EP_STATUS_STALL_NAK_EP5_IN_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP4_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 9));
   USBCTRL_EP_STATUS_STALL_NAK_EP4_OUT_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP4_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 8));
   USBCTRL_EP_STATUS_STALL_NAK_EP4_IN_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP3_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 7));
   USBCTRL_EP_STATUS_STALL_NAK_EP3_OUT_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP3_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 6));
   USBCTRL_EP_STATUS_STALL_NAK_EP3_IN_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP2_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 5));
   USBCTRL_EP_STATUS_STALL_NAK_EP2_OUT_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP2_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_EP_STATUS_STALL_NAK_EP2_IN_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP1_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 3));
   USBCTRL_EP_STATUS_STALL_NAK_EP1_OUT_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP1_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_EP_STATUS_STALL_NAK_EP1_IN_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP0_OUT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_EP_STATUS_STALL_NAK_EP0_OUT_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_EP_STATUS_STALL_NAK_EP0_IN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_EP_STATUS_STALL_NAK_EP0_IN_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   --  USB_MUXING Register macros

   function USBCTRL_USB_MUXING_SWAP_DPDM (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 31));
   USBCTRL_USB_MUXING_SWAP_DPDM_MASK : constant Unsigned_32 := GENERIC_1_31_MASK;
   function USBCTRL_USB_MUXING_USBPHY_AS_GPIO (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_USB_MUXING_USBPHY_AS_GPIO_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_USB_MUXING_SOFTCON (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 3));
   USBCTRL_USB_MUXING_SOFTCON_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;
   function USBCTRL_USB_MUXING_TO_DIGITAL_PAD (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_USB_MUXING_TO_DIGITAL_PAD_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_USB_MUXING_TO_EXTPHY (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_USB_MUXING_TO_EXTPHY_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_USB_MUXING_TO_PHY (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_USB_MUXING_TO_PHY_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   -- USB_PWR Register macros

   function USBCTRL_USB_PWR_OVERCURR_DETECT_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 5));
   USBCTRL_USB_PWR_OVERCURR_DETECT_EN_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;
   function USBCTRL_USB_PWR_OVERCURR_DETECT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_USB_PWR_OVERCURR_DETECT_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_USB_PWR_VBUS_DETECT_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 3));
   USBCTRL_USB_PWR_VBUS_DETECT_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;
   function USBCTRL_USB_PWR_VBUS_DETECT (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_USB_PWR_VBUS_DETECT_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_USB_PWR_VBUS_EN_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_USB_PWR_VBUS_EN_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_USB_PWR_VBUS_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_USB_PWR_VBUS_EN_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   -- USBPHY_DIRECT Register macros
   
   function USBCTRL_USBPHY_DIRECT_RX_DM_OVERRIDE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 25));
   USBCTRL_USBPHY_DIRECT_RX_DM_OVERRIDE_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;
   function USBCTRL_USBPHY_DIRECT_RX_DP_OVERRIDE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 24));
   USBCTRL_USBPHY_DIRECT_RX_DP_OVERRIDE_MASK : constant Unsigned_32 := GENERIC_1_24_MASK;
   function USBCTRL_USBPHY_DIRECT_RX_DD_OVERRIDE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 23));
   USBCTRL_USBPHY_DIRECT_RX_DD_OVERRIDE_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;
   function USBCTRL_USBPHY_DIRECT_DM_OVV (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 22));
   USBCTRL_USBPHY_DIRECT_DM_OVV_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;
   function USBCTRL_USBPHY_DIRECT_DP_OVV (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 21));
   USBCTRL_USBPHY_DIRECT_DP_OVV_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;
   function USBCTRL_USBPHY_DIRECT_DM_OVCN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 20));
   USBCTRL_USBPHY_DIRECT_DM_OVCN_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;
   function USBCTRL_USBPHY_DIRECT_DP_OVCN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 19));
   USBCTRL_USBPHY_DIRECT_DP_OVCN_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;
   function USBCTRL_USBPHY_DIRECT_RX_DM (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 18));
   USBCTRL_USBPHY_DIRECT_RX_DM_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;
   function USBCTRL_USBPHY_DIRECT_RX_DP (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 17));
   USBCTRL_USBPHY_DIRECT_RX_DP_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;
   function USBCTRL_USBPHY_DIRECT_RX_DD (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 16));
   USBCTRL_USBPHY_DIRECT_RX_DD_MASK          : constant Unsigned_32 := GENERIC_1_16_MASK;   
   function USBCTRL_USBPHY_DIRECT_TX_DIFFMODE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 15));
   USBCTRL_USBPHY_DIRECT_TX_DIFFMODE_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;
   function USBCTRL_USBPHY_DIRECT_TX_FSSLEW (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 14));
   USBCTRL_USBPHY_DIRECT_TX_FSSLEW_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;
   function USBCTRL_USBPHY_DIRECT_TX_PD (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 13));
   USBCTRL_USBPHY_DIRECT_TX_PD_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;
   function USBCTRL_USBPHY_DIRECT_RX_PD (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 12));
   USBCTRL_USBPHY_DIRECT_RX_PD_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;
   function USBCTRL_USBPHY_DIRECT_TX_DM (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 11));
   USBCTRL_USBPHY_DIRECT_TX_DM_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;
   function USBCTRL_USBPHY_DIRECT_TX_DP (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 10));
   USBCTRL_USBPHY_DIRECT_TX_DP_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;
   function USBCTRL_USBPHY_DIRECT_TX_DM_OE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 9));
   USBCTRL_USBPHY_DIRECT_TX_DM_OE_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;
   function USBCTRL_USBPHY_DIRECT_TX_DP_OE (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 8));
   USBCTRL_USBPHY_DIRECT_TX_DP_OE_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;
   function USBCTRL_USBPHY_DIRECT_DM_PULLDN_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 6));    
   USBCTRL_USBPHY_DIRECT_DM_PULLDN_EN_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;
   function USBCTRL_USBPHY_DIRECT_DM_PULLUP_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 5));
   USBCTRL_USBPHY_DIRECT_DM_PULLUP_EN_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;
   function USBCTRL_USBPHY_DIRECT_DM_PULLUP_HISEL (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 4));
   USBCTRL_USBPHY_DIRECT_DM_PULLUP_HISEL_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   function USBCTRL_USBPHY_DIRECT_DP_PULLDN_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 2));
   USBCTRL_USBPHY_DIRECT_DP_PULLDN_EN_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;
   function USBCTRL_USBPHY_DIRECT_DP_PULLUP_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 1));
   USBCTRL_USBPHY_DIRECT_DP_PULLUP_EN_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;
   function USBCTRL_USBPHY_DIRECT_DP_PULLUP_HISEL (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 0));
   USBCTRL_USBPHY_DIRECT_DP_PULLUP_HISEL_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;       
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DM_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 18));
   USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DM_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DP_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 17));
   USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DP_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DD_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 16));
   USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DD_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DIFFMODE_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 15));
   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DIFFMODE_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;
   
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 12));
   USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;
   
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_FSSLEW_OVERRIDE_EN (V : Unsigned_32) return Unsigned_32 is
     (Shift_Left (V and 16#1#, 11));
   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_FSSLEW_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;

   --  USBPHY_DIRECT_OVERRIDE Register macros

   --  function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_FSSLEW_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
   --    (Shift_Left (v and 16#1#, 11));
   --  pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_FSSLEW_OVERRIDE_EN);

   --  USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_FSSLEW_OVERRIDE_EN_MASK : constant Unsigned_32 :=
   --    USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_FSSLEW_OVERRIDE_EN (ALL1);
   
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_PD_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 10));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_PD_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_PD_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_PD_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_PD_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_PD_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DM_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DM_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DM_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DP_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DP_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DP_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DM_OE_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DM_OE_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DM_OE_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;
   
   function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DP_OE_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DP_OE_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DP_OE_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLDN_EN_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLDN_EN_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLDN_EN_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLDN_EN_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLDN_EN_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLDN_EN_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLUP_EN_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLUP_EN_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLUP_EN_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_HISEL_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_HISEL_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_HISEL_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLUP_HISEL_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLUP_HISEL_OVERRIDE_EN);

   USBCTRL_USBPHY_DIRECT_OVERRIDE_DP_PULLUP_HISEL_OVERRIDE_EN_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   --  USBPHY_DIRECT_OVERRIDE Register macros

   --  function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DM_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
   --    (Shift_Left (v and 16#1#, 18));
   --  pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DM_OVERRIDE_EN);

   --  USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DM_OVERRIDE_EN_MASK : constant Unsigned_32 :=
   --    USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DM_OVERRIDE_EN (ALL1);

   --  function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DP_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
   --    (Shift_Left (v and 16#1#, 17));
   --  pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DP_OVERRIDE_EN);

   --  USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DP_OVERRIDE_EN_MASK : constant Unsigned_32 :=
   --    USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DP_OVERRIDE_EN (ALL1);

   --  function USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DD_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
   --    (Shift_Left (v and 16#1#, 16));
   --  pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DD_OVERRIDE_EN);

   --  USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DD_OVERRIDE_EN_MASK : constant Unsigned_32 :=
   --    USBCTRL_USBPHY_DIRECT_OVERRIDE_RX_DD_OVERRIDE_EN (ALL1);

   --  function USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DIFFMODE_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
   --    (Shift_Left (v and 16#1#, 15));
   --  pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DIFFMODE_OVERRIDE_EN);

   --  USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DIFFMODE_OVERRIDE_EN_MASK : constant Unsigned_32 :=
   --    USBCTRL_USBPHY_DIRECT_OVERRIDE_TX_DIFFMODE_OVERRIDE_EN (ALL1);

   --  function USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_OVERRIDE_EN (v : Unsigned_32) return Unsigned_32 is
   --    (Shift_Left (v and 16#1#, 12));
   --  pragma Inline (USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_OVERRIDE_EN);

   --  USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_OVERRIDE_EN_MASK : constant Unsigned_32 :=
   --    USBCTRL_USBPHY_DIRECT_OVERRIDE_DM_PULLUP_OVERRIDE_EN (ALL1);

   -- Note: Macros from TX_FSSLEW_OVERRIDE_EN down to DP_PULLUP_HISEL_OVERRIDE_EN 
   -- repeat here in the source. Ada definitions above cover these functional needs.

   -----------------------------------------------------------------------------
   --  USBPHY_TRIM Register macros
   -----------------------------------------------------------------------------

   --  USBPHY_TRIM Register macros

   function USBCTRL_USBPHY_TRIM_DM_PULLDN_TRIM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 8));
   pragma Inline (USBCTRL_USBPHY_TRIM_DM_PULLDN_TRIM);

   USBCTRL_USBPHY_TRIM_DM_PULLDN_TRIM_MASK : constant Unsigned_32 := GENERIC_1F_8_MASK;

   function USBCTRL_USBPHY_TRIM_DP_PULLDN_TRIM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   pragma Inline (USBCTRL_USBPHY_TRIM_DP_PULLDN_TRIM);

   USBCTRL_USBPHY_TRIM_DP_PULLDN_TRIM_MASK : constant Unsigned_32 := GENERIC_1F_0_MASK;
   
   --  LINESTATE_TUNING Register macros
   
   function USBCTRL_LINESTATE_TUNING_SPARE_FIX (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#f#, 8));
   pragma Inline (USBCTRL_LINESTATE_TUNING_SPARE_FIX);

   USBCTRL_LINESTATE_TUNING_SPARE_FIX_MASK : constant Unsigned_32 := GENERIC_F_8_MASK;

   function USBCTRL_LINESTATE_TUNING_DEV_LS_WAKE_FIX (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   pragma Inline (USBCTRL_LINESTATE_TUNING_DEV_LS_WAKE_FIX);

   USBCTRL_LINESTATE_TUNING_DEV_LS_WAKE_FIX_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_LINESTATE_TUNING_DEV_RX_ERR_QUIESCE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   pragma Inline (USBCTRL_LINESTATE_TUNING_DEV_RX_ERR_QUIESCE);

   USBCTRL_LINESTATE_TUNING_DEV_RX_ERR_QUIESCE_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_LINESTATE_TUNING_SIE_RX_CHATTER_SE0_FIX (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   pragma Inline (USBCTRL_LINESTATE_TUNING_SIE_RX_CHATTER_SE0_FIX);

   USBCTRL_LINESTATE_TUNING_SIE_RX_CHATTER_SE0_FIX_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_LINESTATE_TUNING_SIE_RX_BITSTUFF_FIX (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   pragma Inline (USBCTRL_LINESTATE_TUNING_SIE_RX_BITSTUFF_FIX);

   USBCTRL_LINESTATE_TUNING_SIE_RX_BITSTUFF_FIX_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_LINESTATE_TUNING_DEV_BUFF_CONTROL_DOUBLE_READ_FIX (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   pragma Inline (USBCTRL_LINESTATE_TUNING_DEV_BUFF_CONTROL_DOUBLE_READ_FIX);

   USBCTRL_LINESTATE_TUNING_DEV_BUFF_CONTROL_DOUBLE_READ_FIX_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_LINESTATE_TUNING_MULTI_HUB_FIX (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   pragma Inline (USBCTRL_LINESTATE_TUNING_MULTI_HUB_FIX);

   USBCTRL_LINESTATE_TUNING_MULTI_HUB_FIX_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_LINESTATE_TUNING_LINESTATE_DELAY (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   pragma Inline (USBCTRL_LINESTATE_TUNING_LINESTATE_DELAY);

   USBCTRL_LINESTATE_TUNING_LINESTATE_DELAY_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_LINESTATE_TUNING_RCV_DELAY (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   pragma Inline (USBCTRL_LINESTATE_TUNING_RCV_DELAY);

   USBCTRL_LINESTATE_TUNING_RCV_DELAY_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   function USBCTRL_INTR_EPX_STOPPED_ON_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23));
   pragma Inline (USBCTRL_INTR_EPX_STOPPED_ON_NAK);

   USBCTRL_INTR_EPX_STOPPED_ON_NAK_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_INTR_DEV_SM_WATCHDOG_FIRED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22));
   pragma Inline (USBCTRL_INTR_DEV_SM_WATCHDOG_FIRED);

   USBCTRL_INTR_DEV_SM_WATCHDOG_FIRED_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_INTR_ENDPOINT_ERROR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21));
   pragma Inline (USBCTRL_INTR_ENDPOINT_ERROR);

   USBCTRL_INTR_ENDPOINT_ERROR_MASK : constant Unsigned_32 :=  GENERIC_1_21_MASK;

   function USBCTRL_INTR_RX_SHORT_PACKET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 20));
   pragma Inline (USBCTRL_INTR_RX_SHORT_PACKET);

   USBCTRL_INTR_RX_SHORT_PACKET_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_INTR_EP_STALL_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 19));
   pragma Inline (USBCTRL_INTR_EP_STALL_NAK);

   USBCTRL_INTR_EP_STALL_NAK_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;
   
   function USBCTRL_INTR_ABORT_DONE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18));
   pragma Inline (USBCTRL_INTR_ABORT_DONE);

   USBCTRL_INTR_ABORT_DONE_MASK : constant Unsigned_32 :=  GENERIC_1_18_MASK;

   function USBCTRL_INTR_DEV_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   pragma Inline (USBCTRL_INTR_DEV_SOF);

   USBCTRL_INTR_DEV_SOF_MASK : constant Unsigned_32 :=  GENERIC_1_17_MASK;

   function USBCTRL_INTR_SETUP_REQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16));
   pragma Inline (USBCTRL_INTR_SETUP_REQ);

   USBCTRL_INTR_SETUP_REQ_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_INTR_DEV_RESUME_FROM_HOST (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15));
   pragma Inline (USBCTRL_INTR_DEV_RESUME_FROM_HOST);

   USBCTRL_INTR_DEV_RESUME_FROM_HOST_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_INTR_DEV_SUSPEND (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 14));
   pragma Inline (USBCTRL_INTR_DEV_SUSPEND);

   USBCTRL_INTR_DEV_SUSPEND_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;
   
   function USBCTRL_INTR_DEV_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   pragma Inline (USBCTRL_INTR_DEV_CONN_DIS);

   USBCTRL_INTR_DEV_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_INTR_BUS_RESET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 12));
   pragma Inline (USBCTRL_INTR_BUS_RESET);

   USBCTRL_INTR_BUS_RESET_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_INTR_VBUS_DETECT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 11));
   pragma Inline (USBCTRL_INTR_VBUS_DETECT);

   USBCTRL_INTR_VBUS_DETECT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_INTR_STALL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 10));
   pragma Inline (USBCTRL_INTR_STALL);

   USBCTRL_INTR_STALL_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_INTR_ERROR_CRC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   pragma Inline (USBCTRL_INTR_ERROR_CRC);

   USBCTRL_INTR_ERROR_CRC_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;
   
   function USBCTRL_INTR_ERROR_BIT_STUFF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8));
   pragma Inline (USBCTRL_INTR_ERROR_BIT_STUFF);

   USBCTRL_INTR_ERROR_BIT_STUFF_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_INTR_ERROR_RX_OVERFLOW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   pragma Inline (USBCTRL_INTR_ERROR_RX_OVERFLOW);

   USBCTRL_INTR_ERROR_RX_OVERFLOW_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_INTR_ERROR_RX_TIMEOUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   pragma Inline (USBCTRL_INTR_ERROR_RX_TIMEOUT);

   USBCTRL_INTR_ERROR_RX_TIMEOUT_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_INTR_ERROR_DATA_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   pragma Inline (USBCTRL_INTR_ERROR_DATA_SEQ);

   USBCTRL_INTR_ERROR_DATA_SEQ_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_INTR_BUFF_STATUS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   pragma Inline (USBCTRL_INTR_BUFF_STATUS);

   USBCTRL_INTR_BUFF_STATUS_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;
   
   function USBCTRL_INTR_TRANS_COMPLETE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   pragma Inline (USBCTRL_INTR_TRANS_COMPLETE);

   USBCTRL_INTR_TRANS_COMPLETE_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_INTR_HOST_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   pragma Inline (USBCTRL_INTR_HOST_SOF);

   USBCTRL_INTR_HOST_SOF_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_INTR_HOST_RESUME (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   pragma Inline (USBCTRL_INTR_HOST_RESUME);

   USBCTRL_INTR_HOST_RESUME_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_INTR_HOST_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   pragma Inline (USBCTRL_INTR_HOST_CONN_DIS);

   USBCTRL_INTR_HOST_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   --  INTE Register macros 

   function USBCTRL_INTE_EPX_STOPPED_ON_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23));
   pragma Inline (USBCTRL_INTE_EPX_STOPPED_ON_NAK);

   USBCTRL_INTE_EPX_STOPPED_ON_NAK_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_INTE_DEV_SM_WATCHDOG_FIRED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22));
   pragma Inline (USBCTRL_INTE_DEV_SM_WATCHDOG_FIRED);

   USBCTRL_INTE_DEV_SM_WATCHDOG_FIRED_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_INTE_ENDPOINT_ERROR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21));
   pragma Inline (USBCTRL_INTE_ENDPOINT_ERROR);

   USBCTRL_INTE_ENDPOINT_ERROR_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;

   function USBCTRL_INTE_RX_SHORT_PACKET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 20));
   pragma Inline (USBCTRL_INTE_RX_SHORT_PACKET);

   USBCTRL_INTE_RX_SHORT_PACKET_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_INTE_EP_STALL_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 19));
   pragma Inline (USBCTRL_INTE_EP_STALL_NAK);

   USBCTRL_INTE_EP_STALL_NAK_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_INTE_ABORT_DONE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18));
   pragma Inline (USBCTRL_INTE_ABORT_DONE);

   USBCTRL_INTE_ABORT_DONE_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_INTE_DEV_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   pragma Inline (USBCTRL_INTE_DEV_SOF);

   USBCTRL_INTE_DEV_SOF_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_INTE_SETUP_REQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16));
   pragma Inline (USBCTRL_INTE_SETUP_REQ);

   USBCTRL_INTE_SETUP_REQ_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_INTE_DEV_RESUME_FROM_HOST (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15));
   pragma Inline (USBCTRL_INTE_DEV_RESUME_FROM_HOST);

   USBCTRL_INTE_DEV_RESUME_FROM_HOST_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_INTE_DEV_SUSPEND (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 14));
   pragma Inline (USBCTRL_INTE_DEV_SUSPEND);

   USBCTRL_INTE_DEV_SUSPEND_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;

   function USBCTRL_INTE_DEV_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   pragma Inline (USBCTRL_INTE_DEV_CONN_DIS);

   USBCTRL_INTE_DEV_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_INTE_BUS_RESET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 12));
   pragma Inline (USBCTRL_INTE_BUS_RESET);

   USBCTRL_INTE_BUS_RESET_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_INTE_VBUS_DETECT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 11));
   pragma Inline (USBCTRL_INTE_VBUS_DETECT);

   USBCTRL_INTE_VBUS_DETECT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_INTE_STALL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 10));
   pragma Inline (USBCTRL_INTE_STALL);

   USBCTRL_INTE_STALL_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_INTE_ERROR_CRC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   pragma Inline (USBCTRL_INTE_ERROR_CRC);

   USBCTRL_INTE_ERROR_CRC_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_INTE_ERROR_BIT_STUFF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8));
   pragma Inline (USBCTRL_INTE_ERROR_BIT_STUFF);

   USBCTRL_INTE_ERROR_BIT_STUFF_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_INTE_ERROR_RX_OVERFLOW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   pragma Inline (USBCTRL_INTE_ERROR_RX_OVERFLOW);

   USBCTRL_INTE_ERROR_RX_OVERFLOW_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_INTE_ERROR_RX_TIMEOUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   pragma Inline (USBCTRL_INTE_ERROR_RX_TIMEOUT);

   USBCTRL_INTE_ERROR_RX_TIMEOUT_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_INTE_ERROR_DATA_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   pragma Inline (USBCTRL_INTE_ERROR_DATA_SEQ);

   USBCTRL_INTE_ERROR_DATA_SEQ_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_INTE_BUFF_STATUS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   pragma Inline (USBCTRL_INTE_BUFF_STATUS);

   USBCTRL_INTE_BUFF_STATUS_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_INTE_TRANS_COMPLETE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   pragma Inline (USBCTRL_INTE_TRANS_COMPLETE);

   USBCTRL_INTE_TRANS_COMPLETE_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_INTE_HOST_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   pragma Inline (USBCTRL_INTE_HOST_SOF);

   USBCTRL_INTE_HOST_SOF_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_INTE_HOST_RESUME (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   pragma Inline (USBCTRL_INTE_HOST_RESUME);

   USBCTRL_INTE_HOST_RESUME_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_INTE_HOST_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   pragma Inline (USBCTRL_INTE_HOST_CONN_DIS);

   USBCTRL_INTE_HOST_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   -----------------------------------------------------------------------------
   --  INTF Register macros
   -----------------------------------------------------------------------------

   --  INTF Register macros

   function USBCTRL_INTF_EPX_STOPPED_ON_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23));
   pragma Inline (USBCTRL_INTF_EPX_STOPPED_ON_NAK);

   USBCTRL_INTF_EPX_STOPPED_ON_NAK_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_INTF_DEV_SM_WATCHDOG_FIRED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22));
   pragma Inline (USBCTRL_INTF_DEV_SM_WATCHDOG_FIRED);

   USBCTRL_INTF_DEV_SM_WATCHDOG_FIRED_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_INTF_ENDPOINT_ERROR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21));
   pragma Inline (USBCTRL_INTF_ENDPOINT_ERROR);

   USBCTRL_INTF_ENDPOINT_ERROR_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;

   function USBCTRL_INTF_RX_SHORT_PACKET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 20));
   pragma Inline (USBCTRL_INTF_RX_SHORT_PACKET);

   USBCTRL_INTF_RX_SHORT_PACKET_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_INTF_EP_STALL_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 19));
   pragma Inline (USBCTRL_INTF_EP_STALL_NAK);

   USBCTRL_INTF_EP_STALL_NAK_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_INTF_ABORT_DONE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18));
   pragma Inline (USBCTRL_INTF_ABORT_DONE);

   USBCTRL_INTF_ABORT_DONE_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_INTF_DEV_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   pragma Inline (USBCTRL_INTF_DEV_SOF);

   USBCTRL_INTF_DEV_SOF_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_INTF_SETUP_REQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16));
   pragma Inline (USBCTRL_INTF_SETUP_REQ);

   USBCTRL_INTF_SETUP_REQ_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_INTF_DEV_RESUME_FROM_HOST (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15));
   pragma Inline (USBCTRL_INTF_DEV_RESUME_FROM_HOST);

   USBCTRL_INTF_DEV_RESUME_FROM_HOST_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_INTF_DEV_SUSPEND (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 14));
   pragma Inline (USBCTRL_INTF_DEV_SUSPEND);

   USBCTRL_INTF_DEV_SUSPEND_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;

   function USBCTRL_INTF_DEV_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   pragma Inline (USBCTRL_INTF_DEV_CONN_DIS);

   USBCTRL_INTF_DEV_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_INTF_BUS_RESET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 12));
   pragma Inline (USBCTRL_INTF_BUS_RESET);

   USBCTRL_INTF_BUS_RESET_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_INTF_VBUS_DETECT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 11));
   pragma Inline (USBCTRL_INTF_VBUS_DETECT);

   USBCTRL_INTF_VBUS_DETECT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_INTF_STALL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 10));
   pragma Inline (USBCTRL_INTF_STALL);

   USBCTRL_INTF_STALL_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_INTF_ERROR_CRC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   pragma Inline (USBCTRL_INTF_ERROR_CRC);

   USBCTRL_INTF_ERROR_CRC_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_INTF_ERROR_BIT_STUFF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8));
   pragma Inline (USBCTRL_INTF_ERROR_BIT_STUFF);

   USBCTRL_INTF_ERROR_BIT_STUFF_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_INTF_ERROR_RX_OVERFLOW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   pragma Inline (USBCTRL_INTF_ERROR_RX_OVERFLOW);

   USBCTRL_INTF_ERROR_RX_OVERFLOW_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_INTF_ERROR_RX_TIMEOUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   pragma Inline (USBCTRL_INTF_ERROR_RX_TIMEOUT);

   USBCTRL_INTF_ERROR_RX_TIMEOUT_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_INTF_ERROR_DATA_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   pragma Inline (USBCTRL_INTF_ERROR_DATA_SEQ);

   USBCTRL_INTF_ERROR_DATA_SEQ_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_INTF_BUFF_STATUS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   pragma Inline (USBCTRL_INTF_BUFF_STATUS);

   USBCTRL_INTF_BUFF_STATUS_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_INTF_TRANS_COMPLETE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   pragma Inline (USBCTRL_INTF_TRANS_COMPLETE);

   USBCTRL_INTF_TRANS_COMPLETE_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_INTF_HOST_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   pragma Inline (USBCTRL_INTF_HOST_SOF);

   USBCTRL_INTF_HOST_SOF_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_INTF_HOST_RESUME (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   pragma Inline (USBCTRL_INTF_HOST_RESUME);

   USBCTRL_INTF_HOST_RESUME_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_INTF_HOST_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   pragma Inline (USBCTRL_INTF_HOST_CONN_DIS);

   USBCTRL_INTF_HOST_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   --  INTS Register macros

   function USBCTRL_INTS_EPX_STOPPED_ON_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23));
   pragma Inline (USBCTRL_INTS_EPX_STOPPED_ON_NAK);

   USBCTRL_INTS_EPX_STOPPED_ON_NAK_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_INTS_DEV_SM_WATCHDOG_FIRED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22));
   pragma Inline (USBCTRL_INTS_DEV_SM_WATCHDOG_FIRED);

   USBCTRL_INTS_DEV_SM_WATCHDOG_FIRED_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_INTS_ENDPOINT_ERROR (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21));
   pragma Inline (USBCTRL_INTS_ENDPOINT_ERROR);

   USBCTRL_INTS_ENDPOINT_ERROR_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;

   function USBCTRL_INTS_RX_SHORT_PACKET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 20));
   pragma Inline (USBCTRL_INTS_RX_SHORT_PACKET);

   USBCTRL_INTS_RX_SHORT_PACKET_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_INTS_EP_STALL_NAK (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 19));
   pragma Inline (USBCTRL_INTS_EP_STALL_NAK);

   USBCTRL_INTS_EP_STALL_NAK_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_INTS_ABORT_DONE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18));
   pragma Inline (USBCTRL_INTS_ABORT_DONE);

   USBCTRL_INTS_ABORT_DONE_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_INTS_DEV_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   pragma Inline (USBCTRL_INTS_DEV_SOF);

   USBCTRL_INTS_DEV_SOF_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_INTS_SETUP_REQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16));
   pragma Inline (USBCTRL_INTS_SETUP_REQ);

   USBCTRL_INTS_SETUP_REQ_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_INTS_DEV_RESUME_FROM_HOST (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15));
   pragma Inline (USBCTRL_INTS_DEV_RESUME_FROM_HOST);

   USBCTRL_INTS_DEV_RESUME_FROM_HOST_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_INTS_DEV_SUSPEND (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 14));
   pragma Inline (USBCTRL_INTS_DEV_SUSPEND);

   USBCTRL_INTS_DEV_SUSPEND_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;

   function USBCTRL_INTS_DEV_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   pragma Inline (USBCTRL_INTS_DEV_CONN_DIS);

   USBCTRL_INTS_DEV_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_INTS_BUS_RESET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 12));
   pragma Inline (USBCTRL_INTS_BUS_RESET);

   USBCTRL_INTS_BUS_RESET_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_INTS_VBUS_DETECT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 11));
   pragma Inline (USBCTRL_INTS_VBUS_DETECT);

   USBCTRL_INTS_VBUS_DETECT_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;
   
   function USBCTRL_INTS_STALL (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 10));
   pragma Inline (USBCTRL_INTS_STALL);

   USBCTRL_INTS_STALL_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_INTS_ERROR_CRC (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   pragma Inline (USBCTRL_INTS_ERROR_CRC);

   USBCTRL_INTS_ERROR_CRC_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;
   function USBCTRL_INTS_ERROR_BIT_STUFF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8));
   pragma Inline (USBCTRL_INTS_ERROR_BIT_STUFF);

   USBCTRL_INTS_ERROR_BIT_STUFF_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_INTS_ERROR_RX_OVERFLOW (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   pragma Inline (USBCTRL_INTS_ERROR_RX_OVERFLOW);

   USBCTRL_INTS_ERROR_RX_OVERFLOW_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_INTS_ERROR_RX_TIMEOUT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   pragma Inline (USBCTRL_INTS_ERROR_RX_TIMEOUT);

   USBCTRL_INTS_ERROR_RX_TIMEOUT_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_INTS_ERROR_DATA_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   pragma Inline (USBCTRL_INTS_ERROR_DATA_SEQ);

   USBCTRL_INTS_ERROR_DATA_SEQ_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_INTS_BUFF_STATUS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   pragma Inline (USBCTRL_INTS_BUFF_STATUS);

   USBCTRL_INTS_BUFF_STATUS_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_INTS_TRANS_COMPLETE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   pragma Inline (USBCTRL_INTS_TRANS_COMPLETE);

   USBCTRL_INTS_TRANS_COMPLETE_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_INTS_HOST_SOF (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   pragma Inline (USBCTRL_INTS_HOST_SOF);

   USBCTRL_INTS_HOST_SOF_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_INTS_HOST_RESUME (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   pragma Inline (USBCTRL_INTS_HOST_RESUME);

   USBCTRL_INTS_HOST_RESUME_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_INTS_HOST_CONN_DIS (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   pragma Inline (USBCTRL_INTS_HOST_CONN_DIS);

   USBCTRL_INTS_HOST_CONN_DIS_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   --  SOF_TIMESTAMP_RAW Register macros

   --  SOF_TIMESTAMP_LAST Register macros

   --  SM_STATE Register macros

   function USBCTRL_SM_STATE_RX_DASM (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#f#, 8));
   pragma Inline (USBCTRL_SM_STATE_RX_DASM);

   USBCTRL_SM_STATE_RX_DASM_MASK : constant Unsigned_32 := GENERIC_F_8_MASK;

   function USBCTRL_SM_STATE_BC_STATE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#7#, 5));
   pragma Inline (USBCTRL_SM_STATE_BC_STATE);

   USBCTRL_SM_STATE_BC_STATE_MASK : constant Unsigned_32 := GENERIC_7_5_MASK;

   function USBCTRL_SM_STATE_STATE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1f#, 0));
   pragma Inline (USBCTRL_SM_STATE_STATE);

   USBCTRL_SM_STATE_STATE_MASK : constant Unsigned_32 := GENERIC_1F_0_MASK;
   
   --  EP_TX_ERROR Register macros

   function USBCTRL_EP_TX_ERROR_EP15 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 30));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP15);

   USBCTRL_EP_TX_ERROR_EP15_MASK : constant Unsigned_32 := GENERIC_3_30_MASK;

   function USBCTRL_EP_TX_ERROR_EP14 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 28));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP14);

   USBCTRL_EP_TX_ERROR_EP14_MASK : constant Unsigned_32 := GENERIC_3_28_MASK;

   function USBCTRL_EP_TX_ERROR_EP13 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 26));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP13);

   USBCTRL_EP_TX_ERROR_EP13_MASK : constant Unsigned_32 := GENERIC_3_26_MASK;

   function USBCTRL_EP_TX_ERROR_EP12 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 24));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP12);

   USBCTRL_EP_TX_ERROR_EP12_MASK : constant Unsigned_32 := GENERIC_3_24_MASK;

   function USBCTRL_EP_TX_ERROR_EP11 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 22));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP11);

   USBCTRL_EP_TX_ERROR_EP11_MASK : constant Unsigned_32 := GENERIC_3_22_MASK;

   function USBCTRL_EP_TX_ERROR_EP10 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 20));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP10);

   USBCTRL_EP_TX_ERROR_EP10_MASK : constant Unsigned_32 := GENERIC_3_20_MASK;

   function USBCTRL_EP_TX_ERROR_EP9 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 18));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP9);

   USBCTRL_EP_TX_ERROR_EP9_MASK : constant Unsigned_32 := GENERIC_3_18_MASK;

   function USBCTRL_EP_TX_ERROR_EP8 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 16));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP8);

   USBCTRL_EP_TX_ERROR_EP8_MASK : constant Unsigned_32 := GENERIC_3_16_MASK;

   function USBCTRL_EP_TX_ERROR_EP7 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 14));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP7);

   USBCTRL_EP_TX_ERROR_EP7_MASK : constant Unsigned_32 := GENERIC_3_14_MASK;

   function USBCTRL_EP_TX_ERROR_EP6 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 12));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP6);

   USBCTRL_EP_TX_ERROR_EP6_MASK : constant Unsigned_32 := GENERIC_3_12_MASK;

   function USBCTRL_EP_TX_ERROR_EP5 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 10));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP5);

   USBCTRL_EP_TX_ERROR_EP5_MASK : constant Unsigned_32 := GENERIC_3_10_MASK;

   function USBCTRL_EP_TX_ERROR_EP4 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 8));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP4);

   USBCTRL_EP_TX_ERROR_EP4_MASK : constant Unsigned_32 := GENERIC_3_8_MASK;

   function USBCTRL_EP_TX_ERROR_EP3 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 6));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP3);

   USBCTRL_EP_TX_ERROR_EP3_MASK : constant Unsigned_32 := GENERIC_3_6_MASK;

   function USBCTRL_EP_TX_ERROR_EP2 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 4));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP2);

   USBCTRL_EP_TX_ERROR_EP2_MASK : constant Unsigned_32 := GENERIC_3_4_MASK;

   function USBCTRL_EP_TX_ERROR_EP1 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 2));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP1);

   USBCTRL_EP_TX_ERROR_EP1_MASK : constant Unsigned_32 := GENERIC_3_2_MASK;

   function USBCTRL_EP_TX_ERROR_EP0 (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3#, 0));
   pragma Inline (USBCTRL_EP_TX_ERROR_EP0);

   USBCTRL_EP_TX_ERROR_EP0_MASK : constant Unsigned_32 := GENERIC_3_0_MASK;

   --  EP_RX_ERROR Register macros

   function USBCTRL_EP_RX_ERROR_EP15_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 31));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP15_SEQ);

   USBCTRL_EP_RX_ERROR_EP15_SEQ_MASK : constant Unsigned_32 := GENERIC_1_31_MASK;

   function USBCTRL_EP_RX_ERROR_EP15_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 30));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP15_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP15_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_30_MASK;

   function USBCTRL_EP_RX_ERROR_EP14_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 29));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP14_SEQ);

   USBCTRL_EP_RX_ERROR_EP14_SEQ_MASK : constant Unsigned_32 := GENERIC_1_29_MASK;

   function USBCTRL_EP_RX_ERROR_EP14_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 28));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP14_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP14_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_28_MASK;

   function USBCTRL_EP_RX_ERROR_EP13_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 27));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP13_SEQ);

   USBCTRL_EP_RX_ERROR_EP13_SEQ_MASK : constant Unsigned_32 := GENERIC_1_27_MASK;

   function USBCTRL_EP_RX_ERROR_EP13_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 26));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP13_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP13_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_26_MASK;

   function USBCTRL_EP_RX_ERROR_EP12_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 25));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP12_SEQ);

   USBCTRL_EP_RX_ERROR_EP12_SEQ_MASK : constant Unsigned_32 := GENERIC_1_25_MASK;

   function USBCTRL_EP_RX_ERROR_EP12_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 24));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP12_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP12_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_24_MASK;

   function USBCTRL_EP_RX_ERROR_EP11_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 23));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP11_SEQ);

   USBCTRL_EP_RX_ERROR_EP11_SEQ_MASK : constant Unsigned_32 := GENERIC_1_23_MASK;

   function USBCTRL_EP_RX_ERROR_EP11_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 22));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP11_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP11_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_22_MASK;

   function USBCTRL_EP_RX_ERROR_EP10_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 21));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP10_SEQ);

   USBCTRL_EP_RX_ERROR_EP10_SEQ_MASK : constant Unsigned_32 := GENERIC_1_21_MASK;
   function USBCTRL_EP_RX_ERROR_EP10_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 20));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP10_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP10_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_EP_RX_ERROR_EP9_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 19));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP9_SEQ);

   USBCTRL_EP_RX_ERROR_EP9_SEQ_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_EP_RX_ERROR_EP9_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP9_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP9_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_EP_RX_ERROR_EP8_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 17));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP8_SEQ);

   USBCTRL_EP_RX_ERROR_EP8_SEQ_MASK : constant Unsigned_32 := GENERIC_1_17_MASK;

   function USBCTRL_EP_RX_ERROR_EP8_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 16));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP8_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP8_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_16_MASK;

   function USBCTRL_EP_RX_ERROR_EP7_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 15));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP7_SEQ);

   USBCTRL_EP_RX_ERROR_EP7_SEQ_MASK : constant Unsigned_32 := GENERIC_1_15_MASK;

   function USBCTRL_EP_RX_ERROR_EP7_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 14));
   pragma Inline (USBCTRL_EP_RX_ERROR_EP7_TRANSACTION);

   USBCTRL_EP_RX_ERROR_EP7_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_14_MASK;

   function USBCTRL_EP_RX_ERROR_EP6_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 13));
   USBCTRL_EP_RX_ERROR_EP6_SEQ_MASK : constant Unsigned_32 := GENERIC_1_13_MASK;

   function USBCTRL_EP_RX_ERROR_EP6_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 12));
   USBCTRL_EP_RX_ERROR_EP6_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_12_MASK;

   function USBCTRL_EP_RX_ERROR_EP5_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 11));
   USBCTRL_EP_RX_ERROR_EP5_SEQ_MASK : constant Unsigned_32 := GENERIC_1_11_MASK;

   function USBCTRL_EP_RX_ERROR_EP5_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 10));
   USBCTRL_EP_RX_ERROR_EP5_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_10_MASK;

   function USBCTRL_EP_RX_ERROR_EP4_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 9));
   USBCTRL_EP_RX_ERROR_EP4_SEQ_MASK : constant Unsigned_32 := GENERIC_1_9_MASK;

   function USBCTRL_EP_RX_ERROR_EP4_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 8));
   USBCTRL_EP_RX_ERROR_EP4_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_8_MASK;

   function USBCTRL_EP_RX_ERROR_EP3_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 7));
   USBCTRL_EP_RX_ERROR_EP3_SEQ_MASK : constant Unsigned_32 := GENERIC_1_7_MASK;

   function USBCTRL_EP_RX_ERROR_EP3_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 6));
   USBCTRL_EP_RX_ERROR_EP3_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_6_MASK;

   function USBCTRL_EP_RX_ERROR_EP2_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 5));
   USBCTRL_EP_RX_ERROR_EP2_SEQ_MASK : constant Unsigned_32 := GENERIC_1_5_MASK;

   function USBCTRL_EP_RX_ERROR_EP2_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 4));
   USBCTRL_EP_RX_ERROR_EP2_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_4_MASK;

   function USBCTRL_EP_RX_ERROR_EP1_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 3));
   USBCTRL_EP_RX_ERROR_EP1_SEQ_MASK : constant Unsigned_32 := GENERIC_1_3_MASK;

   function USBCTRL_EP_RX_ERROR_EP1_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 2));
   USBCTRL_EP_RX_ERROR_EP1_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_2_MASK;

   function USBCTRL_EP_RX_ERROR_EP0_SEQ (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 1));
   USBCTRL_EP_RX_ERROR_EP0_SEQ_MASK : constant Unsigned_32 := GENERIC_1_1_MASK;

   function USBCTRL_EP_RX_ERROR_EP0_TRANSACTION (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 0));
   USBCTRL_EP_RX_ERROR_EP0_TRANSACTION_MASK : constant Unsigned_32 := GENERIC_1_0_MASK;

   --  DEV_SM_WATCHDOG Register macros

   function USBCTRL_DEV_SM_WATCHDOG_FIRED (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 20));
   USBCTRL_DEV_SM_WATCHDOG_FIRED_MASK : constant Unsigned_32 := GENERIC_1_20_MASK;

   function USBCTRL_DEV_SM_WATCHDOG_RESET (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 19));
   USBCTRL_DEV_SM_WATCHDOG_RESET_MASK : constant Unsigned_32 := GENERIC_1_19_MASK;

   function USBCTRL_DEV_SM_WATCHDOG_ENABLE (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#1#, 18));
   USBCTRL_DEV_SM_WATCHDOG_ENABLE_MASK : constant Unsigned_32 := GENERIC_1_18_MASK;

   function USBCTRL_DEV_SM_WATCHDOG_LIMIT (v : Unsigned_32) return Unsigned_32 is
     (Shift_Left (v and 16#3ffff#, 0));
   USBCTRL_DEV_SM_WATCHDOG_LIMIT_MASK : constant Unsigned_32 := GENERIC_3ffff_0_MASK;

end RP2350_USB;
