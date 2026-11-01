pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  DPRAM layout for USB device.
package RP2350.USB_DPRAM is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype SETUP_PACKET_LOW_BMREQUESTTYPE_Field is RP2350.Byte;
   subtype SETUP_PACKET_LOW_BREQUEST_Field is RP2350.Byte;
   subtype SETUP_PACKET_LOW_WVALUE_Field is RP2350.UInt16;

   --  Bytes 0-3 of the SETUP packet from the host.
   type SETUP_PACKET_LOW_Register is record
      BMREQUESTTYPE : SETUP_PACKET_LOW_BMREQUESTTYPE_Field := 16#0#;
      BREQUEST      : SETUP_PACKET_LOW_BREQUEST_Field := 16#0#;
      WVALUE        : SETUP_PACKET_LOW_WVALUE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SETUP_PACKET_LOW_Register use record
      BMREQUESTTYPE at 0 range 0 .. 7;
      BREQUEST      at 0 range 8 .. 15;
      WVALUE        at 0 range 16 .. 31;
   end record;

   subtype SETUP_PACKET_HIGH_WINDEX_Field is RP2350.UInt16;
   subtype SETUP_PACKET_HIGH_WLENGTH_Field is RP2350.UInt16;

   --  Bytes 4-7 of the setup packet from the host.
   type SETUP_PACKET_HIGH_Register is record
      WINDEX  : SETUP_PACKET_HIGH_WINDEX_Field := 16#0#;
      WLENGTH : SETUP_PACKET_HIGH_WLENGTH_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SETUP_PACKET_HIGH_Register use record
      WINDEX  at 0 range 0 .. 15;
      WLENGTH at 0 range 16 .. 31;
   end record;

   subtype EP1_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP1_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP1_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP1_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP1_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP1_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP1_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP1_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP1_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP1_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP1_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP1_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP1_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP1_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP1_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP1_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP1_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP1_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP1_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP1_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP1_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP1_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP1_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP1_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP1_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP1_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP1_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP1_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP1_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP1_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP1_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP1_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP1_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP1_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP1_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP1_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP1_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP1_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP2_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP2_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP2_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP2_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP2_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP2_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP2_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP2_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP2_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP2_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP2_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP2_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP2_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP2_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP2_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP2_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP2_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP2_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP2_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP2_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP2_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP2_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP2_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP2_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP2_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP2_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP2_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP2_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP2_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP2_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP2_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP2_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP2_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP2_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP2_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP2_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP2_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP2_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP3_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP3_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP3_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP3_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP3_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP3_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP3_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP3_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP3_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP3_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP3_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP3_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP3_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP3_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP3_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP3_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP3_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP3_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP3_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP3_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP3_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP3_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP3_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP3_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP3_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP3_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP3_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP3_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP3_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP3_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP3_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP3_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP3_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP3_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP3_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP3_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP3_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP3_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP4_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP4_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP4_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP4_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP4_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP4_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP4_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP4_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP4_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP4_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP4_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP4_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP4_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP4_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP4_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP4_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP4_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP4_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP4_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP4_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP4_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP4_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP4_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP4_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP4_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP4_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP4_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP4_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP4_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP4_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP4_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP4_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP4_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP4_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP4_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP4_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP4_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP4_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP5_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP5_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP5_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP5_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP5_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP5_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP5_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP5_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP5_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP5_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP5_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP5_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP5_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP5_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP5_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP5_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP5_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP5_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP5_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP5_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP5_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP5_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP5_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP5_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP5_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP5_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP5_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP5_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP5_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP5_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP5_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP5_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP5_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP5_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP5_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP5_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP5_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP5_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP6_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP6_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP6_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP6_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP6_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP6_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP6_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP6_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP6_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP6_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP6_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP6_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP6_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP6_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP6_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP6_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP6_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP6_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP6_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP6_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP6_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP6_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP6_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP6_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP6_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP6_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP6_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP6_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP6_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP6_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP6_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP6_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP6_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP6_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP6_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP6_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP6_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP6_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP7_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP7_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP7_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP7_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP7_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP7_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP7_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP7_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP7_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP7_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP7_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP7_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP7_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP7_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP7_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP7_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP7_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP7_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP7_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP7_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP7_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP7_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP7_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP7_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP7_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP7_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP7_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP7_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP7_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP7_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP7_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP7_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP7_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP7_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP7_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP7_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP7_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP7_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP8_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP8_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP8_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP8_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP8_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP8_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP8_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP8_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP8_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP8_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP8_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP8_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP8_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP8_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP8_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP8_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP8_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP8_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP8_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP8_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP8_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP8_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP8_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP8_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP8_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP8_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP8_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP8_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP8_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP8_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP8_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP8_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP8_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP8_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP8_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP8_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP8_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP8_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP9_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP9_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP9_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP9_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP9_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP9_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP9_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP9_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP9_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP9_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP9_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP9_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP9_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP9_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP9_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP9_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP9_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP9_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP9_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP9_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP9_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP9_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP9_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP9_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP9_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP9_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP9_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP9_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP9_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP9_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP9_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP9_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP9_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP9_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP9_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP9_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP9_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP9_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP10_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP10_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP10_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP10_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP10_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP10_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP10_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP10_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP10_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP10_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP10_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP10_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP10_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP10_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP10_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP10_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP10_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP10_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP10_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP10_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP10_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP10_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP10_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP10_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP10_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP10_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP10_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP10_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP10_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP10_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP10_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP10_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP10_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP10_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP10_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP10_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP10_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP10_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP11_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP11_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP11_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP11_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP11_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP11_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP11_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP11_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP11_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP11_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP11_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP11_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP11_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP11_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP11_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP11_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP11_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP11_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP11_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP11_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP11_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP11_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP11_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP11_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP11_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP11_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP11_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP11_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP11_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP11_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP11_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP11_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP11_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP11_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP11_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP11_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP11_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP11_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP12_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP12_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP12_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP12_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP12_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP12_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP12_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP12_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP12_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP12_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP12_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP12_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP12_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP12_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP12_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP12_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP12_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP12_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP12_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP12_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP12_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP12_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP12_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP12_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP12_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP12_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP12_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP12_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP12_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP12_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP12_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP12_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP12_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP12_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP12_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP12_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP12_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP12_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP13_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP13_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP13_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP13_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP13_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP13_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP13_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP13_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP13_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP13_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP13_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP13_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP13_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP13_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP13_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP13_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP13_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP13_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP13_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP13_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP13_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP13_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP13_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP13_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP13_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP13_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP13_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP13_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP13_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP13_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP13_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP13_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP13_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP13_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP13_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP13_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP13_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP13_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP14_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP14_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP14_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP14_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP14_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP14_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP14_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP14_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP14_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP14_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP14_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP14_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP14_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP14_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP14_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP14_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP14_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP14_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP14_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP14_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP14_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP14_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP14_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP14_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP14_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP14_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP14_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP14_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP14_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP14_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP14_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP14_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP14_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP14_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP14_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP14_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP14_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP14_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP15_IN_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP15_IN_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP15_IN_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP15_IN_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP15_IN_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP15_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP15_IN_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP15_IN_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP15_IN_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP15_IN_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP15_IN_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP15_IN_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP15_IN_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP15_IN_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP15_IN_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP15_IN_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP15_IN_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP15_IN_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP15_IN_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP15_OUT_CONTROL_BUFFER_ADDRESS_Field is RP2350.UInt16;
   subtype EP15_OUT_CONTROL_INTERRUPT_ON_NAK_Field is RP2350.Bit;
   subtype EP15_OUT_CONTROL_INTERRUPT_ON_STALL_Field is RP2350.Bit;

   type EP15_OUT_CONTROL_ENDPOINT_TYPE_Field is
     (Control,
      Isochronous,
      Bulk,
      Interrupt)
     with Size => 2;
   for EP15_OUT_CONTROL_ENDPOINT_TYPE_Field use
     (Control => 0,
      Isochronous => 1,
      Bulk => 2,
      Interrupt => 3);

   subtype EP15_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field is RP2350.Bit;
   subtype EP15_OUT_CONTROL_INTERRUPT_PER_BUFF_Field is RP2350.Bit;
   subtype EP15_OUT_CONTROL_DOUBLE_BUFFERED_Field is RP2350.Bit;
   subtype EP15_OUT_CONTROL_ENABLE_Field is RP2350.Bit;

   type EP15_OUT_CONTROL_Register is record
      --  64 byte aligned buffer address for this EP (bits 0-5 are ignored).
      --  Relative to the start of the DPRAM.
      BUFFER_ADDRESS            : EP15_OUT_CONTROL_BUFFER_ADDRESS_Field :=
                                   16#0#;
      --  Trigger an interrupt if a NAK is sent. Intended for debug only.
      INTERRUPT_ON_NAK          : EP15_OUT_CONTROL_INTERRUPT_ON_NAK_Field :=
                                   16#0#;
      --  Trigger an interrupt if a STALL is sent. Intended for debug only.
      INTERRUPT_ON_STALL        : EP15_OUT_CONTROL_INTERRUPT_ON_STALL_Field :=
                                   16#0#;
      --  unspecified
      Reserved_18_25            : RP2350.Byte := 16#0#;
      ENDPOINT_TYPE             : EP15_OUT_CONTROL_ENDPOINT_TYPE_Field :=
                                   RP2350.USB_DPRAM.Control;
      --  Trigger an interrupt each time both buffers are done. Only valid in
      --  double buffered mode.
      INTERRUPT_PER_DOUBLE_BUFF : EP15_OUT_CONTROL_INTERRUPT_PER_DOUBLE_BUFF_Field :=
                                   16#0#;
      --  Trigger an interrupt each time a buffer is done.
      INTERRUPT_PER_BUFF        : EP15_OUT_CONTROL_INTERRUPT_PER_BUFF_Field :=
                                   16#0#;
      --  This endpoint is double buffered.
      DOUBLE_BUFFERED           : EP15_OUT_CONTROL_DOUBLE_BUFFERED_Field :=
                                   16#0#;
      --  Enable this endpoint. The device will not reply to any packets for
      --  this endpoint if this bit is not set.
      ENABLE                    : EP15_OUT_CONTROL_ENABLE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP15_OUT_CONTROL_Register use record
      BUFFER_ADDRESS            at 0 range 0 .. 15;
      INTERRUPT_ON_NAK          at 0 range 16 .. 16;
      INTERRUPT_ON_STALL        at 0 range 17 .. 17;
      Reserved_18_25            at 0 range 18 .. 25;
      ENDPOINT_TYPE             at 0 range 26 .. 27;
      INTERRUPT_PER_DOUBLE_BUFF at 0 range 28 .. 28;
      INTERRUPT_PER_BUFF        at 0 range 29 .. 29;
      DOUBLE_BUFFERED           at 0 range 30 .. 30;
      ENABLE                    at 0 range 31 .. 31;
   end record;

   subtype EP0_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP0_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP0_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP0_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP0_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP0_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP0_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP0_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP0_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP0_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP0_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP0_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP0_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP0_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP0_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP0_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP0_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP0_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP0_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP0_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP0_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP0_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP0_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP0_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP0_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP0_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP0_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP0_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP0_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP0_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP0_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP0_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP0_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP0_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP0_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP0_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP0_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP0_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP0_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP0_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP0_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP0_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP0_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP0_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP1_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP1_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP1_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP1_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP1_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP1_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP1_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP1_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP1_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP1_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP1_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP1_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP1_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP1_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP1_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP1_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP1_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP1_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP1_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP1_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP1_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP1_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP1_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP1_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP1_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP1_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP1_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP1_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP1_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP1_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP1_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP1_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP1_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP1_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP1_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP1_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP1_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP1_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP1_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP1_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP1_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP1_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP1_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP1_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP2_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP2_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP2_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP2_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP2_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP2_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP2_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP2_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP2_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP2_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP2_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP2_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP2_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP2_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP2_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP2_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP2_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP2_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP2_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP2_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP2_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP2_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP2_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP2_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP2_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP2_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP2_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP2_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP2_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP2_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP2_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP2_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP2_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP2_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP2_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP2_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP2_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP2_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP2_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP2_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP2_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP2_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP2_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP2_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP3_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP3_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP3_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP3_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP3_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP3_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP3_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP3_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP3_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP3_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP3_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP3_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP3_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP3_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP3_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP3_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP3_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP3_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP3_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP3_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP3_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP3_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP3_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP3_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP3_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP3_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP3_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP3_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP3_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP3_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP3_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP3_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP3_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP3_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP3_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP3_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP3_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP3_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP3_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP3_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP3_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP3_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP3_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP3_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP4_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP4_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP4_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP4_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP4_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP4_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP4_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP4_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP4_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP4_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP4_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP4_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP4_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP4_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP4_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP4_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP4_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP4_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP4_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP4_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP4_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP4_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP4_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP4_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP4_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP4_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP4_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP4_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP4_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP4_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP4_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP4_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP4_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP4_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP4_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP4_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP4_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP4_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP4_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP4_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP4_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP4_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP4_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP4_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP5_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP5_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP5_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP5_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP5_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP5_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP5_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP5_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP5_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP5_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP5_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP5_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP5_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP5_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP5_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP5_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP5_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP5_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP5_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP5_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP5_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP5_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP5_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP5_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP5_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP5_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP5_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP5_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP5_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP5_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP5_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP5_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP5_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP5_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP5_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP5_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP5_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP5_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP5_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP5_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP5_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP5_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP5_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP5_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP6_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP6_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP6_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP6_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP6_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP6_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP6_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP6_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP6_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP6_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP6_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP6_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP6_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP6_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP6_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP6_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP6_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP6_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP6_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP6_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP6_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP6_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP6_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP6_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP6_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP6_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP6_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP6_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP6_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP6_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP6_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP6_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP6_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP6_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP6_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP6_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP6_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP6_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP6_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP6_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP6_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP6_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP6_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP6_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP7_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP7_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP7_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP7_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP7_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP7_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP7_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP7_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP7_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP7_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP7_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP7_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP7_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP7_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP7_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP7_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP7_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP7_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP7_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP7_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP7_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP7_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP7_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP7_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP7_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP7_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP7_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP7_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP7_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP7_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP7_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP7_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP7_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP7_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP7_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP7_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP7_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP7_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP7_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP7_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP7_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP7_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP7_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP7_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP8_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP8_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP8_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP8_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP8_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP8_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP8_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP8_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP8_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP8_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP8_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP8_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP8_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP8_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP8_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP8_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP8_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP8_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP8_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP8_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP8_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP8_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP8_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP8_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP8_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP8_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP8_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP8_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP8_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP8_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP8_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP8_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP8_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP8_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP8_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP8_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP8_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP8_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP8_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP8_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP8_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP8_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP8_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP8_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP9_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP9_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP9_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP9_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP9_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP9_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP9_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP9_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP9_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP9_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP9_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP9_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP9_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP9_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP9_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP9_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP9_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP9_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP9_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP9_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP9_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP9_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP9_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP9_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP9_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP9_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP9_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP9_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP9_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP9_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP9_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP9_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP9_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP9_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP9_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP9_OUT_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP9_OUT_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP9_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP9_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP9_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP9_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP9_OUT_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP9_OUT_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP9_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP10_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP10_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP10_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP10_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP10_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP10_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP10_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP10_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP10_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP10_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP10_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP10_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP10_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP10_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP10_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP10_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP10_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP10_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP10_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP10_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP10_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP10_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP10_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP10_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP10_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP10_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP10_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP10_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP10_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP10_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP10_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP10_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP10_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP10_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP10_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP10_OUT_BUFFER_CONTROL_LAST_0_Field :=
                                  16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP10_OUT_BUFFER_CONTROL_FULL_0_Field :=
                                  16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP10_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP10_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP10_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP10_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP10_OUT_BUFFER_CONTROL_LAST_1_Field :=
                                  16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP10_OUT_BUFFER_CONTROL_FULL_1_Field :=
                                  16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP10_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP11_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP11_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP11_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP11_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP11_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP11_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP11_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP11_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP11_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP11_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP11_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP11_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP11_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP11_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP11_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP11_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP11_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP11_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP11_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP11_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP11_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP11_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP11_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP11_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP11_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP11_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP11_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP11_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP11_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP11_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP11_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP11_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP11_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP11_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP11_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP11_OUT_BUFFER_CONTROL_LAST_0_Field :=
                                  16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP11_OUT_BUFFER_CONTROL_FULL_0_Field :=
                                  16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP11_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP11_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP11_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP11_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP11_OUT_BUFFER_CONTROL_LAST_1_Field :=
                                  16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP11_OUT_BUFFER_CONTROL_FULL_1_Field :=
                                  16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP11_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP12_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP12_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP12_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP12_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP12_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP12_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP12_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP12_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP12_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP12_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP12_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP12_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP12_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP12_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP12_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP12_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP12_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP12_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP12_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP12_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP12_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP12_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP12_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP12_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP12_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP12_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP12_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP12_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP12_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP12_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP12_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP12_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP12_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP12_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP12_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP12_OUT_BUFFER_CONTROL_LAST_0_Field :=
                                  16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP12_OUT_BUFFER_CONTROL_FULL_0_Field :=
                                  16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP12_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP12_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP12_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP12_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP12_OUT_BUFFER_CONTROL_LAST_1_Field :=
                                  16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP12_OUT_BUFFER_CONTROL_FULL_1_Field :=
                                  16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP12_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP13_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP13_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP13_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP13_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP13_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP13_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP13_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP13_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP13_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP13_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP13_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP13_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP13_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP13_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP13_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP13_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP13_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP13_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP13_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP13_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP13_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP13_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP13_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP13_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP13_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP13_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP13_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP13_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP13_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP13_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP13_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP13_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP13_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP13_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP13_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP13_OUT_BUFFER_CONTROL_LAST_0_Field :=
                                  16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP13_OUT_BUFFER_CONTROL_FULL_0_Field :=
                                  16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP13_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP13_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP13_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP13_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP13_OUT_BUFFER_CONTROL_LAST_1_Field :=
                                  16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP13_OUT_BUFFER_CONTROL_FULL_1_Field :=
                                  16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP13_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP14_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP14_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP14_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP14_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP14_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP14_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP14_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP14_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP14_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP14_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP14_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP14_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP14_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP14_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP14_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP14_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP14_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP14_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP14_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP14_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP14_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP14_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP14_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP14_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP14_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP14_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP14_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP14_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP14_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP14_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP14_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP14_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP14_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP14_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP14_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP14_OUT_BUFFER_CONTROL_LAST_0_Field :=
                                  16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP14_OUT_BUFFER_CONTROL_FULL_0_Field :=
                                  16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP14_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP14_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP14_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP14_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP14_OUT_BUFFER_CONTROL_LAST_1_Field :=
                                  16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP14_OUT_BUFFER_CONTROL_FULL_1_Field :=
                                  16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP14_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP15_IN_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP15_IN_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP15_IN_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP15_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP15_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP15_IN_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP15_IN_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP15_IN_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP15_IN_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP15_IN_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP15_IN_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP15_IN_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP15_IN_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP15_IN_BUFFER_CONTROL_LAST_0_Field := 16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP15_IN_BUFFER_CONTROL_FULL_0_Field := 16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP15_IN_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP15_IN_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP15_IN_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP15_IN_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP15_IN_BUFFER_CONTROL_LAST_1_Field := 16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP15_IN_BUFFER_CONTROL_FULL_1_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP15_IN_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   subtype EP15_OUT_BUFFER_CONTROL_LENGTH_0_Field is RP2350.UInt10;
   subtype EP15_OUT_BUFFER_CONTROL_AVAILABLE_0_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_STALL_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_RESET_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_PID_0_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_LAST_0_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_FULL_0_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_LENGTH_1_Field is RP2350.UInt10;
   subtype EP15_OUT_BUFFER_CONTROL_AVAILABLE_1_Field is RP2350.Bit;

   --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
   --  mode. Only valid in double buffered mode for an Isochronous endpoint.
   --  For a non Isochronous endpoint the offset is always 64 bytes.
   type EP15_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field is
     (Val_128,
      Val_256,
      Val_512,
      Val_1024)
     with Size => 2;
   for EP15_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field use
     (Val_128 => 0,
      Val_256 => 1,
      Val_512 => 2,
      Val_1024 => 3);

   subtype EP15_OUT_BUFFER_CONTROL_PID_1_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_LAST_1_Field is RP2350.Bit;
   subtype EP15_OUT_BUFFER_CONTROL_FULL_1_Field is RP2350.Bit;

   --  Buffer control for both buffers of an endpoint. Fields ending in a _1
   --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
   --  controls are only valid if the endpoint is in double buffered mode.
   type EP15_OUT_BUFFER_CONTROL_Register is record
      --  The length of the data in buffer 1.
      LENGTH_0                 : EP15_OUT_BUFFER_CONTROL_LENGTH_0_Field :=
                                  16#0#;
      --  Buffer 0 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_0              : EP15_OUT_BUFFER_CONTROL_AVAILABLE_0_Field :=
                                  16#0#;
      --  Reply with a stall (valid for both buffers).
      STALL                    : EP15_OUT_BUFFER_CONTROL_STALL_Field := 16#0#;
      --  Reset the buffer selector to buffer 0.
      RESET                    : EP15_OUT_BUFFER_CONTROL_RESET_Field := 16#0#;
      --  The data pid of buffer 0.
      PID_0                    : EP15_OUT_BUFFER_CONTROL_PID_0_Field := 16#0#;
      --  Buffer 0 is the last buffer of the transfer.
      LAST_0                   : EP15_OUT_BUFFER_CONTROL_LAST_0_Field :=
                                  16#0#;
      --  Buffer 0 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_0                   : EP15_OUT_BUFFER_CONTROL_FULL_0_Field :=
                                  16#0#;
      --  The length of the data in buffer 1.
      LENGTH_1                 : EP15_OUT_BUFFER_CONTROL_LENGTH_1_Field :=
                                  16#0#;
      --  Buffer 1 is available. This bit is set to indicate the buffer can be
      --  used by the controller. The controller clears the available bit when
      --  writing the status back.
      AVAILABLE_1              : EP15_OUT_BUFFER_CONTROL_AVAILABLE_1_Field :=
                                  16#0#;
      --  The number of bytes buffer 1 is offset from buffer 0 in Isochronous
      --  mode. Only valid in double buffered mode for an Isochronous endpoint.
      --  For a non Isochronous endpoint the offset is always 64 bytes.
      DOUBLE_BUFFER_ISO_OFFSET : EP15_OUT_BUFFER_CONTROL_DOUBLE_BUFFER_ISO_OFFSET_Field :=
                                  RP2350.USB_DPRAM.Val_128;
      --  The data pid of buffer 1.
      PID_1                    : EP15_OUT_BUFFER_CONTROL_PID_1_Field := 16#0#;
      --  Buffer 1 is the last buffer of the transfer.
      LAST_1                   : EP15_OUT_BUFFER_CONTROL_LAST_1_Field :=
                                  16#0#;
      --  Buffer 1 is full. For an IN transfer (TX to the host) the bit is set
      --  to indicate the data is valid. For an OUT transfer (RX from the host)
      --  this bit should be left as a 0. The host will set it when it has
      --  filled the buffer with data.
      FULL_1                   : EP15_OUT_BUFFER_CONTROL_FULL_1_Field :=
                                  16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for EP15_OUT_BUFFER_CONTROL_Register use record
      LENGTH_0                 at 0 range 0 .. 9;
      AVAILABLE_0              at 0 range 10 .. 10;
      STALL                    at 0 range 11 .. 11;
      RESET                    at 0 range 12 .. 12;
      PID_0                    at 0 range 13 .. 13;
      LAST_0                   at 0 range 14 .. 14;
      FULL_0                   at 0 range 15 .. 15;
      LENGTH_1                 at 0 range 16 .. 25;
      AVAILABLE_1              at 0 range 26 .. 26;
      DOUBLE_BUFFER_ISO_OFFSET at 0 range 27 .. 28;
      PID_1                    at 0 range 29 .. 29;
      LAST_1                   at 0 range 30 .. 30;
      FULL_1                   at 0 range 31 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  DPRAM layout for USB device.
   type USB_DPRAM_Peripheral is record
      --  Bytes 0-3 of the SETUP packet from the host.
      SETUP_PACKET_LOW        : aliased SETUP_PACKET_LOW_Register;
      --  Bytes 4-7 of the setup packet from the host.
      SETUP_PACKET_HIGH       : aliased SETUP_PACKET_HIGH_Register;
      EP1_IN_CONTROL          : aliased EP1_IN_CONTROL_Register;
      EP1_OUT_CONTROL         : aliased EP1_OUT_CONTROL_Register;
      EP2_IN_CONTROL          : aliased EP2_IN_CONTROL_Register;
      EP2_OUT_CONTROL         : aliased EP2_OUT_CONTROL_Register;
      EP3_IN_CONTROL          : aliased EP3_IN_CONTROL_Register;
      EP3_OUT_CONTROL         : aliased EP3_OUT_CONTROL_Register;
      EP4_IN_CONTROL          : aliased EP4_IN_CONTROL_Register;
      EP4_OUT_CONTROL         : aliased EP4_OUT_CONTROL_Register;
      EP5_IN_CONTROL          : aliased EP5_IN_CONTROL_Register;
      EP5_OUT_CONTROL         : aliased EP5_OUT_CONTROL_Register;
      EP6_IN_CONTROL          : aliased EP6_IN_CONTROL_Register;
      EP6_OUT_CONTROL         : aliased EP6_OUT_CONTROL_Register;
      EP7_IN_CONTROL          : aliased EP7_IN_CONTROL_Register;
      EP7_OUT_CONTROL         : aliased EP7_OUT_CONTROL_Register;
      EP8_IN_CONTROL          : aliased EP8_IN_CONTROL_Register;
      EP8_OUT_CONTROL         : aliased EP8_OUT_CONTROL_Register;
      EP9_IN_CONTROL          : aliased EP9_IN_CONTROL_Register;
      EP9_OUT_CONTROL         : aliased EP9_OUT_CONTROL_Register;
      EP10_IN_CONTROL         : aliased EP10_IN_CONTROL_Register;
      EP10_OUT_CONTROL        : aliased EP10_OUT_CONTROL_Register;
      EP11_IN_CONTROL         : aliased EP11_IN_CONTROL_Register;
      EP11_OUT_CONTROL        : aliased EP11_OUT_CONTROL_Register;
      EP12_IN_CONTROL         : aliased EP12_IN_CONTROL_Register;
      EP12_OUT_CONTROL        : aliased EP12_OUT_CONTROL_Register;
      EP13_IN_CONTROL         : aliased EP13_IN_CONTROL_Register;
      EP13_OUT_CONTROL        : aliased EP13_OUT_CONTROL_Register;
      EP14_IN_CONTROL         : aliased EP14_IN_CONTROL_Register;
      EP14_OUT_CONTROL        : aliased EP14_OUT_CONTROL_Register;
      EP15_IN_CONTROL         : aliased EP15_IN_CONTROL_Register;
      EP15_OUT_CONTROL        : aliased EP15_OUT_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP0_IN_BUFFER_CONTROL   : aliased EP0_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP0_OUT_BUFFER_CONTROL  : aliased EP0_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP1_IN_BUFFER_CONTROL   : aliased EP1_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP1_OUT_BUFFER_CONTROL  : aliased EP1_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP2_IN_BUFFER_CONTROL   : aliased EP2_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP2_OUT_BUFFER_CONTROL  : aliased EP2_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP3_IN_BUFFER_CONTROL   : aliased EP3_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP3_OUT_BUFFER_CONTROL  : aliased EP3_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP4_IN_BUFFER_CONTROL   : aliased EP4_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP4_OUT_BUFFER_CONTROL  : aliased EP4_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP5_IN_BUFFER_CONTROL   : aliased EP5_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP5_OUT_BUFFER_CONTROL  : aliased EP5_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP6_IN_BUFFER_CONTROL   : aliased EP6_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP6_OUT_BUFFER_CONTROL  : aliased EP6_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP7_IN_BUFFER_CONTROL   : aliased EP7_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP7_OUT_BUFFER_CONTROL  : aliased EP7_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP8_IN_BUFFER_CONTROL   : aliased EP8_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP8_OUT_BUFFER_CONTROL  : aliased EP8_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP9_IN_BUFFER_CONTROL   : aliased EP9_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP9_OUT_BUFFER_CONTROL  : aliased EP9_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP10_IN_BUFFER_CONTROL  : aliased EP10_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP10_OUT_BUFFER_CONTROL : aliased EP10_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP11_IN_BUFFER_CONTROL  : aliased EP11_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP11_OUT_BUFFER_CONTROL : aliased EP11_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP12_IN_BUFFER_CONTROL  : aliased EP12_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP12_OUT_BUFFER_CONTROL : aliased EP12_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP13_IN_BUFFER_CONTROL  : aliased EP13_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP13_OUT_BUFFER_CONTROL : aliased EP13_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP14_IN_BUFFER_CONTROL  : aliased EP14_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP14_OUT_BUFFER_CONTROL : aliased EP14_OUT_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP15_IN_BUFFER_CONTROL  : aliased EP15_IN_BUFFER_CONTROL_Register;
      --  Buffer control for both buffers of an endpoint. Fields ending in a _1
      --  are for buffer 1. Fields ending in a _0 are for buffer 0. Buffer 1
      --  controls are only valid if the endpoint is in double buffered mode.
      EP15_OUT_BUFFER_CONTROL : aliased EP15_OUT_BUFFER_CONTROL_Register;
   end record
     with Volatile;

   for USB_DPRAM_Peripheral use record
      SETUP_PACKET_LOW        at 16#0# range 0 .. 31;
      SETUP_PACKET_HIGH       at 16#4# range 0 .. 31;
      EP1_IN_CONTROL          at 16#8# range 0 .. 31;
      EP1_OUT_CONTROL         at 16#C# range 0 .. 31;
      EP2_IN_CONTROL          at 16#10# range 0 .. 31;
      EP2_OUT_CONTROL         at 16#14# range 0 .. 31;
      EP3_IN_CONTROL          at 16#18# range 0 .. 31;
      EP3_OUT_CONTROL         at 16#1C# range 0 .. 31;
      EP4_IN_CONTROL          at 16#20# range 0 .. 31;
      EP4_OUT_CONTROL         at 16#24# range 0 .. 31;
      EP5_IN_CONTROL          at 16#28# range 0 .. 31;
      EP5_OUT_CONTROL         at 16#2C# range 0 .. 31;
      EP6_IN_CONTROL          at 16#30# range 0 .. 31;
      EP6_OUT_CONTROL         at 16#34# range 0 .. 31;
      EP7_IN_CONTROL          at 16#38# range 0 .. 31;
      EP7_OUT_CONTROL         at 16#3C# range 0 .. 31;
      EP8_IN_CONTROL          at 16#40# range 0 .. 31;
      EP8_OUT_CONTROL         at 16#44# range 0 .. 31;
      EP9_IN_CONTROL          at 16#48# range 0 .. 31;
      EP9_OUT_CONTROL         at 16#4C# range 0 .. 31;
      EP10_IN_CONTROL         at 16#50# range 0 .. 31;
      EP10_OUT_CONTROL        at 16#54# range 0 .. 31;
      EP11_IN_CONTROL         at 16#58# range 0 .. 31;
      EP11_OUT_CONTROL        at 16#5C# range 0 .. 31;
      EP12_IN_CONTROL         at 16#60# range 0 .. 31;
      EP12_OUT_CONTROL        at 16#64# range 0 .. 31;
      EP13_IN_CONTROL         at 16#68# range 0 .. 31;
      EP13_OUT_CONTROL        at 16#6C# range 0 .. 31;
      EP14_IN_CONTROL         at 16#70# range 0 .. 31;
      EP14_OUT_CONTROL        at 16#74# range 0 .. 31;
      EP15_IN_CONTROL         at 16#78# range 0 .. 31;
      EP15_OUT_CONTROL        at 16#7C# range 0 .. 31;
      EP0_IN_BUFFER_CONTROL   at 16#80# range 0 .. 31;
      EP0_OUT_BUFFER_CONTROL  at 16#84# range 0 .. 31;
      EP1_IN_BUFFER_CONTROL   at 16#88# range 0 .. 31;
      EP1_OUT_BUFFER_CONTROL  at 16#8C# range 0 .. 31;
      EP2_IN_BUFFER_CONTROL   at 16#90# range 0 .. 31;
      EP2_OUT_BUFFER_CONTROL  at 16#94# range 0 .. 31;
      EP3_IN_BUFFER_CONTROL   at 16#98# range 0 .. 31;
      EP3_OUT_BUFFER_CONTROL  at 16#9C# range 0 .. 31;
      EP4_IN_BUFFER_CONTROL   at 16#A0# range 0 .. 31;
      EP4_OUT_BUFFER_CONTROL  at 16#A4# range 0 .. 31;
      EP5_IN_BUFFER_CONTROL   at 16#A8# range 0 .. 31;
      EP5_OUT_BUFFER_CONTROL  at 16#AC# range 0 .. 31;
      EP6_IN_BUFFER_CONTROL   at 16#B0# range 0 .. 31;
      EP6_OUT_BUFFER_CONTROL  at 16#B4# range 0 .. 31;
      EP7_IN_BUFFER_CONTROL   at 16#B8# range 0 .. 31;
      EP7_OUT_BUFFER_CONTROL  at 16#BC# range 0 .. 31;
      EP8_IN_BUFFER_CONTROL   at 16#C0# range 0 .. 31;
      EP8_OUT_BUFFER_CONTROL  at 16#C4# range 0 .. 31;
      EP9_IN_BUFFER_CONTROL   at 16#C8# range 0 .. 31;
      EP9_OUT_BUFFER_CONTROL  at 16#CC# range 0 .. 31;
      EP10_IN_BUFFER_CONTROL  at 16#D0# range 0 .. 31;
      EP10_OUT_BUFFER_CONTROL at 16#D4# range 0 .. 31;
      EP11_IN_BUFFER_CONTROL  at 16#D8# range 0 .. 31;
      EP11_OUT_BUFFER_CONTROL at 16#DC# range 0 .. 31;
      EP12_IN_BUFFER_CONTROL  at 16#E0# range 0 .. 31;
      EP12_OUT_BUFFER_CONTROL at 16#E4# range 0 .. 31;
      EP13_IN_BUFFER_CONTROL  at 16#E8# range 0 .. 31;
      EP13_OUT_BUFFER_CONTROL at 16#EC# range 0 .. 31;
      EP14_IN_BUFFER_CONTROL  at 16#F0# range 0 .. 31;
      EP14_OUT_BUFFER_CONTROL at 16#F4# range 0 .. 31;
      EP15_IN_BUFFER_CONTROL  at 16#F8# range 0 .. 31;
      EP15_OUT_BUFFER_CONTROL at 16#FC# range 0 .. 31;
   end record;

   --  DPRAM layout for USB device.
   USB_DPRAM_Periph : aliased USB_DPRAM_Peripheral
     with Import, Address => USB_DPRAM_Base;

end RP2350.USB_DPRAM;
