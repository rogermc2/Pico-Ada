pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  Hardware access control registers
package RP2350.ACCESSCTRL is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  LOCK_CORE array element
   subtype LOCK_CORE_Element is RP2350.Bit;

   --  LOCK_CORE array
   type LOCK_CORE_Field_Array is array (0 .. 1) of LOCK_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for LOCK_CORE
   type LOCK_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : LOCK_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for LOCK_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype LOCK_DMA_Field is RP2350.Bit;
   subtype LOCK_DEBUG_Field is RP2350.Bit;

   --  Once a LOCK bit is written to 1, ACCESSCTRL silently ignores writes from
   --  that master. LOCK is writable only by a Secure, Privileged processor or
   --  debugger. LOCK bits are only writable when their value is zero. Once
   --  set, they can never be cleared, except by a full reset of ACCESSCTRL
   --  Setting the LOCK bit does not affect whether an access raises a bus
   --  error. Unprivileged writes, or writes from the DMA, will continue to
   --  raise bus errors. All other accesses will continue not to.
   type LOCK_Register is record
      CORE          : LOCK_CORE_Field := (As_Array => False, Val => 16#0#);
      --  Read-only.
      DMA           : LOCK_DMA_Field := 16#1#;
      DEBUG         : LOCK_DEBUG_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for LOCK_Register use record
      CORE          at 0 range 0 .. 1;
      DMA           at 0 range 2 .. 2;
      DEBUG         at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype FORCE_CORE_NS_CORE1_Field is RP2350.Bit;

   --  Force core 1's bus accesses to always be Non-secure, no matter the
   --  core's internal state. Useful for schemes where one core is designated
   --  as the Non-secure core, since some peripherals may filter individual
   --  registers internally based on security state but not on master ID.
   type FORCE_CORE_NS_Register is record
      --  unspecified
      Reserved_0_0  : RP2350.Bit := 16#0#;
      CORE1         : FORCE_CORE_NS_CORE1_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FORCE_CORE_NS_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      CORE1         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype CFGRESET_CFGRESET_Field is RP2350.Bit;

   --  Write 1 to reset all ACCESSCTRL configuration, except for the LOCK and
   --  FORCE_CORE_NS registers. This bit is used in the RP2350 bootrom to
   --  quickly restore ACCESSCTRL to a known state during the boot path. Note
   --  that, like all registers in ACCESSCTRL, this register is not writable
   --  when the writer's corresponding LOCK bit is set, therefore a master
   --  which has been locked out of ACCESSCTRL can not use the CFGRESET
   --  register to disturb its contents.
   type CFGRESET_Register is record
      --  Write-only.
      CFGRESET      : CFGRESET_CFGRESET_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : RP2350.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFGRESET_Register use record
      CFGRESET      at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype GPIO_NSMASK1_GPIO_Field is RP2350.UInt16;
   subtype GPIO_NSMASK1_USB_DP_Field is RP2350.Bit;
   subtype GPIO_NSMASK1_USB_DM_Field is RP2350.Bit;
   subtype GPIO_NSMASK1_QSPI_SCK_Field is RP2350.Bit;
   subtype GPIO_NSMASK1_QSPI_CSN_Field is RP2350.Bit;
   subtype GPIO_NSMASK1_QSPI_SD_Field is RP2350.UInt4;

   --  Control whether GPIO32..47 are accessible to Non-secure code, and
   --  whether QSPI and USB bitbang are accessible through the Non-secure SIO.
   --  Writable only by a Secure, Privileged processor or debugger.
   type GPIO_NSMASK1_Register is record
      GPIO           : GPIO_NSMASK1_GPIO_Field := 16#0#;
      --  unspecified
      Reserved_16_23 : RP2350.Byte := 16#0#;
      USB_DP         : GPIO_NSMASK1_USB_DP_Field := 16#0#;
      USB_DM         : GPIO_NSMASK1_USB_DM_Field := 16#0#;
      QSPI_SCK       : GPIO_NSMASK1_QSPI_SCK_Field := 16#0#;
      QSPI_CSN       : GPIO_NSMASK1_QSPI_CSN_Field := 16#0#;
      QSPI_SD        : GPIO_NSMASK1_QSPI_SD_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for GPIO_NSMASK1_Register use record
      GPIO           at 0 range 0 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      USB_DP         at 0 range 24 .. 24;
      USB_DM         at 0 range 25 .. 25;
      QSPI_SCK       at 0 range 26 .. 26;
      QSPI_CSN       at 0 range 27 .. 27;
      QSPI_SD        at 0 range 28 .. 31;
   end record;

   subtype ROM_NSU_Field is RP2350.Bit;
   subtype ROM_NSP_Field is RP2350.Bit;
   subtype ROM_SU_Field is RP2350.Bit;
   subtype ROM_SP_Field is RP2350.Bit;
   --  ROM_CORE array element
   subtype ROM_CORE_Element is RP2350.Bit;

   --  ROM_CORE array
   type ROM_CORE_Field_Array is array (0 .. 1) of ROM_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for ROM_CORE
   type ROM_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : ROM_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ROM_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype ROM_DMA_Field is RP2350.Bit;
   subtype ROM_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access ROM, and at
   --  what security/privilege levels they can do so. Defaults to fully open
   --  access. This register is writable only from a Secure, Privileged
   --  processor or debugger, with the exception of the NSU bit, which becomes
   --  Non-secure-Privileged-writable when the NSP bit is set.
   type ROM_Register is record
      --  If 1, and NSP is also set, ROM can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : ROM_NSU_Field := 16#1#;
      --  If 1, ROM can be accessed from a Non-secure, Privileged context.
      NSP           : ROM_NSP_Field := 16#1#;
      --  If 1, and SP is also set, ROM can be accessed from a Secure,
      --  Unprivileged context.
      SU            : ROM_SU_Field := 16#1#;
      --  If 1, ROM can be accessed from a Secure, Privileged context.
      SP            : ROM_SP_Field := 16#1#;
      --  If 1, ROM can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : ROM_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, ROM can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : ROM_DMA_Field := 16#1#;
      --  If 1, ROM can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : ROM_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ROM_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype XIP_MAIN_NSU_Field is RP2350.Bit;
   subtype XIP_MAIN_NSP_Field is RP2350.Bit;
   subtype XIP_MAIN_SU_Field is RP2350.Bit;
   subtype XIP_MAIN_SP_Field is RP2350.Bit;
   --  XIP_MAIN_CORE array element
   subtype XIP_MAIN_CORE_Element is RP2350.Bit;

   --  XIP_MAIN_CORE array
   type XIP_MAIN_CORE_Field_Array is array (0 .. 1) of XIP_MAIN_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for XIP_MAIN_CORE
   type XIP_MAIN_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : XIP_MAIN_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for XIP_MAIN_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype XIP_MAIN_DMA_Field is RP2350.Bit;
   subtype XIP_MAIN_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access XIP_MAIN,
   --  and at what security/privilege levels they can do so. Defaults to fully
   --  open access. This register is writable only from a Secure, Privileged
   --  processor or debugger, with the exception of the NSU bit, which becomes
   --  Non-secure-Privileged-writable when the NSP bit is set.
   type XIP_MAIN_Register is record
      --  If 1, and NSP is also set, XIP_MAIN can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : XIP_MAIN_NSU_Field := 16#1#;
      --  If 1, XIP_MAIN can be accessed from a Non-secure, Privileged context.
      NSP           : XIP_MAIN_NSP_Field := 16#1#;
      --  If 1, and SP is also set, XIP_MAIN can be accessed from a Secure,
      --  Unprivileged context.
      SU            : XIP_MAIN_SU_Field := 16#1#;
      --  If 1, XIP_MAIN can be accessed from a Secure, Privileged context.
      SP            : XIP_MAIN_SP_Field := 16#1#;
      --  If 1, XIP_MAIN can be accessed by core 0, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      CORE          : XIP_MAIN_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, XIP_MAIN can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : XIP_MAIN_DMA_Field := 16#1#;
      --  If 1, XIP_MAIN can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : XIP_MAIN_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIP_MAIN_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SRAM_NSU_Field is RP2350.Bit;
   subtype SRAM_NSP_Field is RP2350.Bit;
   subtype SRAM_SU_Field is RP2350.Bit;
   subtype SRAM_SP_Field is RP2350.Bit;
   --  SRAM_CORE array element
   subtype SRAM_CORE_Element is RP2350.Bit;

   --  SRAM_CORE array
   type SRAM_CORE_Field_Array is array (0 .. 1) of SRAM_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SRAM_CORE
   type SRAM_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : SRAM_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SRAM_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SRAM_DMA_Field is RP2350.Bit;
   subtype SRAM_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access SRAM0, and
   --  at what security/privilege levels they can do so. Defaults to fully open
   --  access. This register is writable only from a Secure, Privileged
   --  processor or debugger, with the exception of the NSU bit, which becomes
   --  Non-secure-Privileged-writable when the NSP bit is set.
   type SRAM_Register is record
      --  If 1, and NSP is also set, SRAM0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : SRAM_NSU_Field := 16#1#;
      --  If 1, SRAM0 can be accessed from a Non-secure, Privileged context.
      NSP           : SRAM_NSP_Field := 16#1#;
      --  If 1, and SP is also set, SRAM0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : SRAM_SU_Field := 16#1#;
      --  If 1, SRAM0 can be accessed from a Secure, Privileged context.
      SP            : SRAM_SP_Field := 16#1#;
      --  If 1, SRAM0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : SRAM_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, SRAM0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : SRAM_DMA_Field := 16#1#;
      --  If 1, SRAM0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : SRAM_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SRAM_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DMA_NSU_Field is RP2350.Bit;
   subtype DMA_NSP_Field is RP2350.Bit;
   subtype DMA_SU_Field is RP2350.Bit;
   subtype DMA_SP_Field is RP2350.Bit;
   --  DMA_CORE array element
   subtype DMA_CORE_Element is RP2350.Bit;

   --  DMA_CORE array
   type DMA_CORE_Field_Array is array (0 .. 1) of DMA_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for DMA_CORE
   type DMA_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : DMA_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for DMA_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype DMA_DMA_Field is RP2350.Bit;
   subtype DMA_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access DMA, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type DMA_Register is record
      --  If 1, and NSP is also set, DMA can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : DMA_NSU_Field := 16#0#;
      --  If 1, DMA can be accessed from a Non-secure, Privileged context.
      NSP           : DMA_NSP_Field := 16#0#;
      --  If 1, and SP is also set, DMA can be accessed from a Secure,
      --  Unprivileged context.
      SU            : DMA_SU_Field := 16#1#;
      --  If 1, DMA can be accessed from a Secure, Privileged context.
      SP            : DMA_SP_Field := 16#1#;
      --  If 1, DMA can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : DMA_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, DMA can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : DMA_DMA_Field := 16#1#;
      --  If 1, DMA can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : DMA_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DMA_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype USBCTRL_NSU_Field is RP2350.Bit;
   subtype USBCTRL_NSP_Field is RP2350.Bit;
   subtype USBCTRL_SU_Field is RP2350.Bit;
   subtype USBCTRL_SP_Field is RP2350.Bit;
   --  USBCTRL_CORE array element
   subtype USBCTRL_CORE_Element is RP2350.Bit;

   --  USBCTRL_CORE array
   type USBCTRL_CORE_Field_Array is array (0 .. 1) of USBCTRL_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for USBCTRL_CORE
   type USBCTRL_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : USBCTRL_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for USBCTRL_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype USBCTRL_DMA_Field is RP2350.Bit;
   subtype USBCTRL_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access USBCTRL, and
   --  at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type USBCTRL_Register is record
      --  If 1, and NSP is also set, USBCTRL can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : USBCTRL_NSU_Field := 16#0#;
      --  If 1, USBCTRL can be accessed from a Non-secure, Privileged context.
      NSP           : USBCTRL_NSP_Field := 16#0#;
      --  If 1, and SP is also set, USBCTRL can be accessed from a Secure,
      --  Unprivileged context.
      SU            : USBCTRL_SU_Field := 16#1#;
      --  If 1, USBCTRL can be accessed from a Secure, Privileged context.
      SP            : USBCTRL_SP_Field := 16#1#;
      --  If 1, USBCTRL can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : USBCTRL_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, USBCTRL can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : USBCTRL_DMA_Field := 16#1#;
      --  If 1, USBCTRL can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : USBCTRL_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for USBCTRL_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PIO_NSU_Field is RP2350.Bit;
   subtype PIO_NSP_Field is RP2350.Bit;
   subtype PIO_SU_Field is RP2350.Bit;
   subtype PIO_SP_Field is RP2350.Bit;
   --  PIO_CORE array element
   subtype PIO_CORE_Element is RP2350.Bit;

   --  PIO_CORE array
   type PIO_CORE_Field_Array is array (0 .. 1) of PIO_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PIO_CORE
   type PIO_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : PIO_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PIO_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PIO_DMA_Field is RP2350.Bit;
   subtype PIO_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access PIO0, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type PIO_Register is record
      --  If 1, and NSP is also set, PIO0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : PIO_NSU_Field := 16#0#;
      --  If 1, PIO0 can be accessed from a Non-secure, Privileged context.
      NSP           : PIO_NSP_Field := 16#0#;
      --  If 1, and SP is also set, PIO0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : PIO_SU_Field := 16#1#;
      --  If 1, PIO0 can be accessed from a Secure, Privileged context.
      SP            : PIO_SP_Field := 16#1#;
      --  If 1, PIO0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : PIO_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, PIO0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : PIO_DMA_Field := 16#1#;
      --  If 1, PIO0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : PIO_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIO_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CORESIGHT_TRACE_NSU_Field is RP2350.Bit;
   subtype CORESIGHT_TRACE_NSP_Field is RP2350.Bit;
   subtype CORESIGHT_TRACE_SU_Field is RP2350.Bit;
   subtype CORESIGHT_TRACE_SP_Field is RP2350.Bit;
   --  CORESIGHT_TRACE_CORE array element
   subtype CORESIGHT_TRACE_CORE_Element is RP2350.Bit;

   --  CORESIGHT_TRACE_CORE array
   type CORESIGHT_TRACE_CORE_Field_Array is array (0 .. 1)
     of CORESIGHT_TRACE_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CORESIGHT_TRACE_CORE
   type CORESIGHT_TRACE_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : CORESIGHT_TRACE_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CORESIGHT_TRACE_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype CORESIGHT_TRACE_DMA_Field is RP2350.Bit;
   subtype CORESIGHT_TRACE_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access
   --  CORESIGHT_TRACE, and at what security/privilege levels they can do so.
   --  Defaults to Secure, Privileged processor or debug access only. This
   --  register is writable only from a Secure, Privileged processor or
   --  debugger, with the exception of the NSU bit, which becomes
   --  Non-secure-Privileged-writable when the NSP bit is set.
   type CORESIGHT_TRACE_Register is record
      --  If 1, and NSP is also set, CORESIGHT_TRACE can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : CORESIGHT_TRACE_NSU_Field := 16#0#;
      --  If 1, CORESIGHT_TRACE can be accessed from a Non-secure, Privileged
      --  context.
      NSP           : CORESIGHT_TRACE_NSP_Field := 16#0#;
      --  If 1, and SP is also set, CORESIGHT_TRACE can be accessed from a
      --  Secure, Unprivileged context.
      SU            : CORESIGHT_TRACE_SU_Field := 16#0#;
      --  If 1, CORESIGHT_TRACE can be accessed from a Secure, Privileged
      --  context.
      SP            : CORESIGHT_TRACE_SP_Field := 16#1#;
      --  If 1, CORESIGHT_TRACE can be accessed by core 0, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      CORE          : CORESIGHT_TRACE_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, CORESIGHT_TRACE can be accessed by the DMA, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      DMA           : CORESIGHT_TRACE_DMA_Field := 16#0#;
      --  If 1, CORESIGHT_TRACE can be accessed by the debugger, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      DBG           : CORESIGHT_TRACE_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CORESIGHT_TRACE_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CORESIGHT_PERIPH_NSU_Field is RP2350.Bit;
   subtype CORESIGHT_PERIPH_NSP_Field is RP2350.Bit;
   subtype CORESIGHT_PERIPH_SU_Field is RP2350.Bit;
   subtype CORESIGHT_PERIPH_SP_Field is RP2350.Bit;
   --  CORESIGHT_PERIPH_CORE array element
   subtype CORESIGHT_PERIPH_CORE_Element is RP2350.Bit;

   --  CORESIGHT_PERIPH_CORE array
   type CORESIGHT_PERIPH_CORE_Field_Array is array (0 .. 1)
     of CORESIGHT_PERIPH_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CORESIGHT_PERIPH_CORE
   type CORESIGHT_PERIPH_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : CORESIGHT_PERIPH_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CORESIGHT_PERIPH_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype CORESIGHT_PERIPH_DMA_Field is RP2350.Bit;
   subtype CORESIGHT_PERIPH_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access
   --  CORESIGHT_PERIPH, and at what security/privilege levels they can do so.
   --  Defaults to Secure, Privileged processor or debug access only. This
   --  register is writable only from a Secure, Privileged processor or
   --  debugger, with the exception of the NSU bit, which becomes
   --  Non-secure-Privileged-writable when the NSP bit is set.
   type CORESIGHT_PERIPH_Register is record
      --  If 1, and NSP is also set, CORESIGHT_PERIPH can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : CORESIGHT_PERIPH_NSU_Field := 16#0#;
      --  If 1, CORESIGHT_PERIPH can be accessed from a Non-secure, Privileged
      --  context.
      NSP           : CORESIGHT_PERIPH_NSP_Field := 16#0#;
      --  If 1, and SP is also set, CORESIGHT_PERIPH can be accessed from a
      --  Secure, Unprivileged context.
      SU            : CORESIGHT_PERIPH_SU_Field := 16#0#;
      --  If 1, CORESIGHT_PERIPH can be accessed from a Secure, Privileged
      --  context.
      SP            : CORESIGHT_PERIPH_SP_Field := 16#1#;
      --  If 1, CORESIGHT_PERIPH can be accessed by core 0, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      CORE          : CORESIGHT_PERIPH_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, CORESIGHT_PERIPH can be accessed by the DMA, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      DMA           : CORESIGHT_PERIPH_DMA_Field := 16#0#;
      --  If 1, CORESIGHT_PERIPH can be accessed by the debugger, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      DBG           : CORESIGHT_PERIPH_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CORESIGHT_PERIPH_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SYSINFO_NSU_Field is RP2350.Bit;
   subtype SYSINFO_NSP_Field is RP2350.Bit;
   subtype SYSINFO_SU_Field is RP2350.Bit;
   subtype SYSINFO_SP_Field is RP2350.Bit;
   --  SYSINFO_CORE array element
   subtype SYSINFO_CORE_Element is RP2350.Bit;

   --  SYSINFO_CORE array
   type SYSINFO_CORE_Field_Array is array (0 .. 1) of SYSINFO_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SYSINFO_CORE
   type SYSINFO_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : SYSINFO_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SYSINFO_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SYSINFO_DMA_Field is RP2350.Bit;
   subtype SYSINFO_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access SYSINFO, and
   --  at what security/privilege levels they can do so. Defaults to fully open
   --  access. This register is writable only from a Secure, Privileged
   --  processor or debugger, with the exception of the NSU bit, which becomes
   --  Non-secure-Privileged-writable when the NSP bit is set.
   type SYSINFO_Register is record
      --  If 1, and NSP is also set, SYSINFO can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : SYSINFO_NSU_Field := 16#1#;
      --  If 1, SYSINFO can be accessed from a Non-secure, Privileged context.
      NSP           : SYSINFO_NSP_Field := 16#1#;
      --  If 1, and SP is also set, SYSINFO can be accessed from a Secure,
      --  Unprivileged context.
      SU            : SYSINFO_SU_Field := 16#1#;
      --  If 1, SYSINFO can be accessed from a Secure, Privileged context.
      SP            : SYSINFO_SP_Field := 16#1#;
      --  If 1, SYSINFO can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : SYSINFO_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, SYSINFO can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : SYSINFO_DMA_Field := 16#1#;
      --  If 1, SYSINFO can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : SYSINFO_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYSINFO_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RESETS_NSU_Field is RP2350.Bit;
   subtype RESETS_NSP_Field is RP2350.Bit;
   subtype RESETS_SU_Field is RP2350.Bit;
   subtype RESETS_SP_Field is RP2350.Bit;
   --  RESETS_CORE array element
   subtype RESETS_CORE_Element is RP2350.Bit;

   --  RESETS_CORE array
   type RESETS_CORE_Field_Array is array (0 .. 1) of RESETS_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RESETS_CORE
   type RESETS_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : RESETS_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RESETS_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RESETS_DMA_Field is RP2350.Bit;
   subtype RESETS_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access RESETS, and
   --  at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type RESETS_Register is record
      --  If 1, and NSP is also set, RESETS can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : RESETS_NSU_Field := 16#0#;
      --  If 1, RESETS can be accessed from a Non-secure, Privileged context.
      NSP           : RESETS_NSP_Field := 16#0#;
      --  If 1, and SP is also set, RESETS can be accessed from a Secure,
      --  Unprivileged context.
      SU            : RESETS_SU_Field := 16#1#;
      --  If 1, RESETS can be accessed from a Secure, Privileged context.
      SP            : RESETS_SP_Field := 16#1#;
      --  If 1, RESETS can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : RESETS_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, RESETS can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : RESETS_DMA_Field := 16#1#;
      --  If 1, RESETS can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : RESETS_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RESETS_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype IO_BANK_NSU_Field is RP2350.Bit;
   subtype IO_BANK_NSP_Field is RP2350.Bit;
   subtype IO_BANK_SU_Field is RP2350.Bit;
   subtype IO_BANK_SP_Field is RP2350.Bit;
   --  IO_BANK_CORE array element
   subtype IO_BANK_CORE_Element is RP2350.Bit;

   --  IO_BANK_CORE array
   type IO_BANK_CORE_Field_Array is array (0 .. 1) of IO_BANK_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for IO_BANK_CORE
   type IO_BANK_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : IO_BANK_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for IO_BANK_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype IO_BANK_DMA_Field is RP2350.Bit;
   subtype IO_BANK_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access IO_BANK0,
   --  and at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type IO_BANK_Register is record
      --  If 1, and NSP is also set, IO_BANK0 can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : IO_BANK_NSU_Field := 16#0#;
      --  If 1, IO_BANK0 can be accessed from a Non-secure, Privileged context.
      NSP           : IO_BANK_NSP_Field := 16#0#;
      --  If 1, and SP is also set, IO_BANK0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : IO_BANK_SU_Field := 16#1#;
      --  If 1, IO_BANK0 can be accessed from a Secure, Privileged context.
      SP            : IO_BANK_SP_Field := 16#1#;
      --  If 1, IO_BANK0 can be accessed by core 0, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      CORE          : IO_BANK_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, IO_BANK0 can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : IO_BANK_DMA_Field := 16#1#;
      --  If 1, IO_BANK0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : IO_BANK_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for IO_BANK_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PADS_BANK0_NSU_Field is RP2350.Bit;
   subtype PADS_BANK0_NSP_Field is RP2350.Bit;
   subtype PADS_BANK0_SU_Field is RP2350.Bit;
   subtype PADS_BANK0_SP_Field is RP2350.Bit;
   --  PADS_BANK0_CORE array element
   subtype PADS_BANK0_CORE_Element is RP2350.Bit;

   --  PADS_BANK0_CORE array
   type PADS_BANK0_CORE_Field_Array is array (0 .. 1)
     of PADS_BANK0_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PADS_BANK0_CORE
   type PADS_BANK0_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : PADS_BANK0_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PADS_BANK0_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PADS_BANK0_DMA_Field is RP2350.Bit;
   subtype PADS_BANK0_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access PADS_BANK0,
   --  and at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type PADS_BANK0_Register is record
      --  If 1, and NSP is also set, PADS_BANK0 can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : PADS_BANK0_NSU_Field := 16#0#;
      --  If 1, PADS_BANK0 can be accessed from a Non-secure, Privileged
      --  context.
      NSP           : PADS_BANK0_NSP_Field := 16#0#;
      --  If 1, and SP is also set, PADS_BANK0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : PADS_BANK0_SU_Field := 16#1#;
      --  If 1, PADS_BANK0 can be accessed from a Secure, Privileged context.
      SP            : PADS_BANK0_SP_Field := 16#1#;
      --  If 1, PADS_BANK0 can be accessed by core 0, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      CORE          : PADS_BANK0_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, PADS_BANK0 can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : PADS_BANK0_DMA_Field := 16#1#;
      --  If 1, PADS_BANK0 can be accessed by the debugger, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      DBG           : PADS_BANK0_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PADS_BANK0_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PADS_QSPI_NSU_Field is RP2350.Bit;
   subtype PADS_QSPI_NSP_Field is RP2350.Bit;
   subtype PADS_QSPI_SU_Field is RP2350.Bit;
   subtype PADS_QSPI_SP_Field is RP2350.Bit;
   --  PADS_QSPI_CORE array element
   subtype PADS_QSPI_CORE_Element is RP2350.Bit;

   --  PADS_QSPI_CORE array
   type PADS_QSPI_CORE_Field_Array is array (0 .. 1)
     of PADS_QSPI_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PADS_QSPI_CORE
   type PADS_QSPI_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : PADS_QSPI_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PADS_QSPI_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PADS_QSPI_DMA_Field is RP2350.Bit;
   subtype PADS_QSPI_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access PADS_QSPI,
   --  and at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type PADS_QSPI_Register is record
      --  If 1, and NSP is also set, PADS_QSPI can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : PADS_QSPI_NSU_Field := 16#0#;
      --  If 1, PADS_QSPI can be accessed from a Non-secure, Privileged
      --  context.
      NSP           : PADS_QSPI_NSP_Field := 16#0#;
      --  If 1, and SP is also set, PADS_QSPI can be accessed from a Secure,
      --  Unprivileged context.
      SU            : PADS_QSPI_SU_Field := 16#1#;
      --  If 1, PADS_QSPI can be accessed from a Secure, Privileged context.
      SP            : PADS_QSPI_SP_Field := 16#1#;
      --  If 1, PADS_QSPI can be accessed by core 0, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      CORE          : PADS_QSPI_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, PADS_QSPI can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : PADS_QSPI_DMA_Field := 16#1#;
      --  If 1, PADS_QSPI can be accessed by the debugger, at
      --  security/privilege levels permitted by SP/NSP/SU/NSU in this
      --  register.
      DBG           : PADS_QSPI_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PADS_QSPI_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype BUSCTRL_NSU_Field is RP2350.Bit;
   subtype BUSCTRL_NSP_Field is RP2350.Bit;
   subtype BUSCTRL_SU_Field is RP2350.Bit;
   subtype BUSCTRL_SP_Field is RP2350.Bit;
   --  BUSCTRL_CORE array element
   subtype BUSCTRL_CORE_Element is RP2350.Bit;

   --  BUSCTRL_CORE array
   type BUSCTRL_CORE_Field_Array is array (0 .. 1) of BUSCTRL_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for BUSCTRL_CORE
   type BUSCTRL_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : BUSCTRL_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for BUSCTRL_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype BUSCTRL_DMA_Field is RP2350.Bit;
   subtype BUSCTRL_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access BUSCTRL, and
   --  at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type BUSCTRL_Register is record
      --  If 1, and NSP is also set, BUSCTRL can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : BUSCTRL_NSU_Field := 16#0#;
      --  If 1, BUSCTRL can be accessed from a Non-secure, Privileged context.
      NSP           : BUSCTRL_NSP_Field := 16#0#;
      --  If 1, and SP is also set, BUSCTRL can be accessed from a Secure,
      --  Unprivileged context.
      SU            : BUSCTRL_SU_Field := 16#1#;
      --  If 1, BUSCTRL can be accessed from a Secure, Privileged context.
      SP            : BUSCTRL_SP_Field := 16#1#;
      --  If 1, BUSCTRL can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : BUSCTRL_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, BUSCTRL can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : BUSCTRL_DMA_Field := 16#1#;
      --  If 1, BUSCTRL can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : BUSCTRL_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BUSCTRL_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ADC0_NSU_Field is RP2350.Bit;
   subtype ADC0_NSP_Field is RP2350.Bit;
   subtype ADC0_SU_Field is RP2350.Bit;
   subtype ADC0_SP_Field is RP2350.Bit;
   --  ADC0_CORE array element
   subtype ADC0_CORE_Element is RP2350.Bit;

   --  ADC0_CORE array
   type ADC0_CORE_Field_Array is array (0 .. 1) of ADC0_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for ADC0_CORE
   type ADC0_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : ADC0_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ADC0_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype ADC0_DMA_Field is RP2350.Bit;
   subtype ADC0_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access ADC0, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type ADC0_Register is record
      --  If 1, and NSP is also set, ADC0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : ADC0_NSU_Field := 16#0#;
      --  If 1, ADC0 can be accessed from a Non-secure, Privileged context.
      NSP           : ADC0_NSP_Field := 16#0#;
      --  If 1, and SP is also set, ADC0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : ADC0_SU_Field := 16#1#;
      --  If 1, ADC0 can be accessed from a Secure, Privileged context.
      SP            : ADC0_SP_Field := 16#1#;
      --  If 1, ADC0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : ADC0_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, ADC0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : ADC0_DMA_Field := 16#1#;
      --  If 1, ADC0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : ADC0_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ADC0_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype HSTX_NSU_Field is RP2350.Bit;
   subtype HSTX_NSP_Field is RP2350.Bit;
   subtype HSTX_SU_Field is RP2350.Bit;
   subtype HSTX_SP_Field is RP2350.Bit;
   --  HSTX_CORE array element
   subtype HSTX_CORE_Element is RP2350.Bit;

   --  HSTX_CORE array
   type HSTX_CORE_Field_Array is array (0 .. 1) of HSTX_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for HSTX_CORE
   type HSTX_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : HSTX_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for HSTX_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype HSTX_DMA_Field is RP2350.Bit;
   subtype HSTX_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access HSTX, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type HSTX_Register is record
      --  If 1, and NSP is also set, HSTX can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : HSTX_NSU_Field := 16#0#;
      --  If 1, HSTX can be accessed from a Non-secure, Privileged context.
      NSP           : HSTX_NSP_Field := 16#0#;
      --  If 1, and SP is also set, HSTX can be accessed from a Secure,
      --  Unprivileged context.
      SU            : HSTX_SU_Field := 16#1#;
      --  If 1, HSTX can be accessed from a Secure, Privileged context.
      SP            : HSTX_SP_Field := 16#1#;
      --  If 1, HSTX can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : HSTX_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, HSTX can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : HSTX_DMA_Field := 16#1#;
      --  If 1, HSTX can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : HSTX_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for HSTX_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype I2C_NSU_Field is RP2350.Bit;
   subtype I2C_NSP_Field is RP2350.Bit;
   subtype I2C_SU_Field is RP2350.Bit;
   subtype I2C_SP_Field is RP2350.Bit;
   --  I2C_CORE array element
   subtype I2C_CORE_Element is RP2350.Bit;

   --  I2C_CORE array
   type I2C_CORE_Field_Array is array (0 .. 1) of I2C_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for I2C_CORE
   type I2C_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : I2C_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for I2C_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype I2C_DMA_Field is RP2350.Bit;
   subtype I2C_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access I2C0, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type I2C_Register is record
      --  If 1, and NSP is also set, I2C0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : I2C_NSU_Field := 16#0#;
      --  If 1, I2C0 can be accessed from a Non-secure, Privileged context.
      NSP           : I2C_NSP_Field := 16#0#;
      --  If 1, and SP is also set, I2C0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : I2C_SU_Field := 16#1#;
      --  If 1, I2C0 can be accessed from a Secure, Privileged context.
      SP            : I2C_SP_Field := 16#1#;
      --  If 1, I2C0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : I2C_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, I2C0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : I2C_DMA_Field := 16#1#;
      --  If 1, I2C0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : I2C_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for I2C_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PWM_NSU_Field is RP2350.Bit;
   subtype PWM_NSP_Field is RP2350.Bit;
   subtype PWM_SU_Field is RP2350.Bit;
   subtype PWM_SP_Field is RP2350.Bit;
   --  PWM_CORE array element
   subtype PWM_CORE_Element is RP2350.Bit;

   --  PWM_CORE array
   type PWM_CORE_Field_Array is array (0 .. 1) of PWM_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PWM_CORE
   type PWM_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : PWM_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PWM_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PWM_DMA_Field is RP2350.Bit;
   subtype PWM_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access PWM, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type PWM_Register is record
      --  If 1, and NSP is also set, PWM can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : PWM_NSU_Field := 16#0#;
      --  If 1, PWM can be accessed from a Non-secure, Privileged context.
      NSP           : PWM_NSP_Field := 16#0#;
      --  If 1, and SP is also set, PWM can be accessed from a Secure,
      --  Unprivileged context.
      SU            : PWM_SU_Field := 16#1#;
      --  If 1, PWM can be accessed from a Secure, Privileged context.
      SP            : PWM_SP_Field := 16#1#;
      --  If 1, PWM can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : PWM_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, PWM can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : PWM_DMA_Field := 16#1#;
      --  If 1, PWM can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : PWM_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PWM_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SPI_NSU_Field is RP2350.Bit;
   subtype SPI_NSP_Field is RP2350.Bit;
   subtype SPI_SU_Field is RP2350.Bit;
   subtype SPI_SP_Field is RP2350.Bit;
   --  SPI_CORE array element
   subtype SPI_CORE_Element is RP2350.Bit;

   --  SPI_CORE array
   type SPI_CORE_Field_Array is array (0 .. 1) of SPI_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SPI_CORE
   type SPI_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : SPI_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SPI_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SPI_DMA_Field is RP2350.Bit;
   subtype SPI_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access SPI0, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type SPI_Register is record
      --  If 1, and NSP is also set, SPI0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : SPI_NSU_Field := 16#0#;
      --  If 1, SPI0 can be accessed from a Non-secure, Privileged context.
      NSP           : SPI_NSP_Field := 16#0#;
      --  If 1, and SP is also set, SPI0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : SPI_SU_Field := 16#1#;
      --  If 1, SPI0 can be accessed from a Secure, Privileged context.
      SP            : SPI_SP_Field := 16#1#;
      --  If 1, SPI0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : SPI_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, SPI0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : SPI_DMA_Field := 16#1#;
      --  If 1, SPI0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : SPI_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SPI_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TIMER_NSU_Field is RP2350.Bit;
   subtype TIMER_NSP_Field is RP2350.Bit;
   subtype TIMER_SU_Field is RP2350.Bit;
   subtype TIMER_SP_Field is RP2350.Bit;
   --  TIMER_CORE array element
   subtype TIMER_CORE_Element is RP2350.Bit;

   --  TIMER_CORE array
   type TIMER_CORE_Field_Array is array (0 .. 1) of TIMER_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for TIMER_CORE
   type TIMER_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : TIMER_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TIMER_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype TIMER_DMA_Field is RP2350.Bit;
   subtype TIMER_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access TIMER0, and
   --  at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type TIMER_Register is record
      --  If 1, and NSP is also set, TIMER0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : TIMER_NSU_Field := 16#0#;
      --  If 1, TIMER0 can be accessed from a Non-secure, Privileged context.
      NSP           : TIMER_NSP_Field := 16#0#;
      --  If 1, and SP is also set, TIMER0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : TIMER_SU_Field := 16#1#;
      --  If 1, TIMER0 can be accessed from a Secure, Privileged context.
      SP            : TIMER_SP_Field := 16#1#;
      --  If 1, TIMER0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : TIMER_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, TIMER0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : TIMER_DMA_Field := 16#1#;
      --  If 1, TIMER0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : TIMER_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TIMER_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype UART_NSU_Field is RP2350.Bit;
   subtype UART_NSP_Field is RP2350.Bit;
   subtype UART_SU_Field is RP2350.Bit;
   subtype UART_SP_Field is RP2350.Bit;
   --  UART_CORE array element
   subtype UART_CORE_Element is RP2350.Bit;

   --  UART_CORE array
   type UART_CORE_Field_Array is array (0 .. 1) of UART_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for UART_CORE
   type UART_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : UART_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for UART_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype UART_DMA_Field is RP2350.Bit;
   subtype UART_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access UART0, and
   --  at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type UART_Register is record
      --  If 1, and NSP is also set, UART0 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : UART_NSU_Field := 16#0#;
      --  If 1, UART0 can be accessed from a Non-secure, Privileged context.
      NSP           : UART_NSP_Field := 16#0#;
      --  If 1, and SP is also set, UART0 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : UART_SU_Field := 16#1#;
      --  If 1, UART0 can be accessed from a Secure, Privileged context.
      SP            : UART_SP_Field := 16#1#;
      --  If 1, UART0 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : UART_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, UART0 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : UART_DMA_Field := 16#1#;
      --  If 1, UART0 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : UART_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for UART_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype OTP_NSU_Field is RP2350.Bit;
   subtype OTP_NSP_Field is RP2350.Bit;
   subtype OTP_SU_Field is RP2350.Bit;
   subtype OTP_SP_Field is RP2350.Bit;
   --  OTP_CORE array element
   subtype OTP_CORE_Element is RP2350.Bit;

   --  OTP_CORE array
   type OTP_CORE_Field_Array is array (0 .. 1) of OTP_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for OTP_CORE
   type OTP_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : OTP_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for OTP_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype OTP_DMA_Field is RP2350.Bit;
   subtype OTP_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access OTP, and at
   --  what security/privilege levels they can do so. Defaults to Secure access
   --  from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type OTP_Register is record
      --  If 1, and NSP is also set, OTP can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : OTP_NSU_Field := 16#0#;
      --  If 1, OTP can be accessed from a Non-secure, Privileged context.
      NSP           : OTP_NSP_Field := 16#0#;
      --  If 1, and SP is also set, OTP can be accessed from a Secure,
      --  Unprivileged context.
      SU            : OTP_SU_Field := 16#1#;
      --  If 1, OTP can be accessed from a Secure, Privileged context.
      SP            : OTP_SP_Field := 16#1#;
      --  If 1, OTP can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : OTP_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, OTP can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : OTP_DMA_Field := 16#1#;
      --  If 1, OTP can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : OTP_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OTP_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TBMAN_NSU_Field is RP2350.Bit;
   subtype TBMAN_NSP_Field is RP2350.Bit;
   subtype TBMAN_SU_Field is RP2350.Bit;
   subtype TBMAN_SP_Field is RP2350.Bit;
   --  TBMAN_CORE array element
   subtype TBMAN_CORE_Element is RP2350.Bit;

   --  TBMAN_CORE array
   type TBMAN_CORE_Field_Array is array (0 .. 1) of TBMAN_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for TBMAN_CORE
   type TBMAN_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : TBMAN_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TBMAN_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype TBMAN_DMA_Field is RP2350.Bit;
   subtype TBMAN_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access TBMAN, and
   --  at what security/privilege levels they can do so. Defaults to Secure
   --  access from any master. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type TBMAN_Register is record
      --  If 1, and NSP is also set, TBMAN can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : TBMAN_NSU_Field := 16#0#;
      --  If 1, TBMAN can be accessed from a Non-secure, Privileged context.
      NSP           : TBMAN_NSP_Field := 16#0#;
      --  If 1, and SP is also set, TBMAN can be accessed from a Secure,
      --  Unprivileged context.
      SU            : TBMAN_SU_Field := 16#1#;
      --  If 1, TBMAN can be accessed from a Secure, Privileged context.
      SP            : TBMAN_SP_Field := 16#1#;
      --  If 1, TBMAN can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : TBMAN_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, TBMAN can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : TBMAN_DMA_Field := 16#1#;
      --  If 1, TBMAN can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : TBMAN_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TBMAN_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype POWMAN_NSU_Field is RP2350.Bit;
   subtype POWMAN_NSP_Field is RP2350.Bit;
   subtype POWMAN_SU_Field is RP2350.Bit;
   subtype POWMAN_SP_Field is RP2350.Bit;
   --  POWMAN_CORE array element
   subtype POWMAN_CORE_Element is RP2350.Bit;

   --  POWMAN_CORE array
   type POWMAN_CORE_Field_Array is array (0 .. 1) of POWMAN_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for POWMAN_CORE
   type POWMAN_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : POWMAN_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for POWMAN_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype POWMAN_DMA_Field is RP2350.Bit;
   subtype POWMAN_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access POWMAN, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type POWMAN_Register is record
      --  If 1, and NSP is also set, POWMAN can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : POWMAN_NSU_Field := 16#0#;
      --  If 1, POWMAN can be accessed from a Non-secure, Privileged context.
      NSP           : POWMAN_NSP_Field := 16#0#;
      --  If 1, and SP is also set, POWMAN can be accessed from a Secure,
      --  Unprivileged context.
      SU            : POWMAN_SU_Field := 16#0#;
      --  If 1, POWMAN can be accessed from a Secure, Privileged context.
      SP            : POWMAN_SP_Field := 16#1#;
      --  If 1, POWMAN can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : POWMAN_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, POWMAN can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : POWMAN_DMA_Field := 16#0#;
      --  If 1, POWMAN can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : POWMAN_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for POWMAN_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRNG_NSU_Field is RP2350.Bit;
   subtype TRNG_NSP_Field is RP2350.Bit;
   subtype TRNG_SU_Field is RP2350.Bit;
   subtype TRNG_SP_Field is RP2350.Bit;
   --  TRNG_CORE array element
   subtype TRNG_CORE_Element is RP2350.Bit;

   --  TRNG_CORE array
   type TRNG_CORE_Field_Array is array (0 .. 1) of TRNG_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for TRNG_CORE
   type TRNG_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : TRNG_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TRNG_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype TRNG_DMA_Field is RP2350.Bit;
   subtype TRNG_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access TRNG, and at
   --  what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type TRNG_Register is record
      --  If 1, and NSP is also set, TRNG can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : TRNG_NSU_Field := 16#0#;
      --  If 1, TRNG can be accessed from a Non-secure, Privileged context.
      NSP           : TRNG_NSP_Field := 16#0#;
      --  If 1, and SP is also set, TRNG can be accessed from a Secure,
      --  Unprivileged context.
      SU            : TRNG_SU_Field := 16#0#;
      --  If 1, TRNG can be accessed from a Secure, Privileged context.
      SP            : TRNG_SP_Field := 16#1#;
      --  If 1, TRNG can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : TRNG_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, TRNG can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : TRNG_DMA_Field := 16#0#;
      --  If 1, TRNG can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : TRNG_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRNG_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SHA256_NSU_Field is RP2350.Bit;
   subtype SHA256_NSP_Field is RP2350.Bit;
   subtype SHA256_SU_Field is RP2350.Bit;
   subtype SHA256_SP_Field is RP2350.Bit;
   --  SHA256_CORE array element
   subtype SHA256_CORE_Element is RP2350.Bit;

   --  SHA256_CORE array
   type SHA256_CORE_Field_Array is array (0 .. 1) of SHA256_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SHA256_CORE
   type SHA256_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : SHA256_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SHA256_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SHA256_DMA_Field is RP2350.Bit;
   subtype SHA256_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access SHA256, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged access only. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type SHA256_Register is record
      --  If 1, and NSP is also set, SHA256 can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : SHA256_NSU_Field := 16#0#;
      --  If 1, SHA256 can be accessed from a Non-secure, Privileged context.
      NSP           : SHA256_NSP_Field := 16#0#;
      --  If 1, and SP is also set, SHA256 can be accessed from a Secure,
      --  Unprivileged context.
      SU            : SHA256_SU_Field := 16#0#;
      --  If 1, SHA256 can be accessed from a Secure, Privileged context.
      SP            : SHA256_SP_Field := 16#1#;
      --  If 1, SHA256 can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : SHA256_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, SHA256 can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : SHA256_DMA_Field := 16#1#;
      --  If 1, SHA256 can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : SHA256_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHA256_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SYSCFG_NSU_Field is RP2350.Bit;
   subtype SYSCFG_NSP_Field is RP2350.Bit;
   subtype SYSCFG_SU_Field is RP2350.Bit;
   subtype SYSCFG_SP_Field is RP2350.Bit;
   --  SYSCFG_CORE array element
   subtype SYSCFG_CORE_Element is RP2350.Bit;

   --  SYSCFG_CORE array
   type SYSCFG_CORE_Field_Array is array (0 .. 1) of SYSCFG_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for SYSCFG_CORE
   type SYSCFG_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : SYSCFG_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for SYSCFG_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype SYSCFG_DMA_Field is RP2350.Bit;
   subtype SYSCFG_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access SYSCFG, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type SYSCFG_Register is record
      --  If 1, and NSP is also set, SYSCFG can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : SYSCFG_NSU_Field := 16#0#;
      --  If 1, SYSCFG can be accessed from a Non-secure, Privileged context.
      NSP           : SYSCFG_NSP_Field := 16#0#;
      --  If 1, and SP is also set, SYSCFG can be accessed from a Secure,
      --  Unprivileged context.
      SU            : SYSCFG_SU_Field := 16#0#;
      --  If 1, SYSCFG can be accessed from a Secure, Privileged context.
      SP            : SYSCFG_SP_Field := 16#1#;
      --  If 1, SYSCFG can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : SYSCFG_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, SYSCFG can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : SYSCFG_DMA_Field := 16#0#;
      --  If 1, SYSCFG can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : SYSCFG_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYSCFG_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CLOCKS_NSU_Field is RP2350.Bit;
   subtype CLOCKS_NSP_Field is RP2350.Bit;
   subtype CLOCKS_SU_Field is RP2350.Bit;
   subtype CLOCKS_SP_Field is RP2350.Bit;
   --  CLOCKS_CORE array element
   subtype CLOCKS_CORE_Element is RP2350.Bit;

   --  CLOCKS_CORE array
   type CLOCKS_CORE_Field_Array is array (0 .. 1) of CLOCKS_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for CLOCKS_CORE
   type CLOCKS_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : CLOCKS_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for CLOCKS_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype CLOCKS_DMA_Field is RP2350.Bit;
   subtype CLOCKS_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access CLOCKS, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type CLOCKS_Register is record
      --  If 1, and NSP is also set, CLOCKS can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : CLOCKS_NSU_Field := 16#0#;
      --  If 1, CLOCKS can be accessed from a Non-secure, Privileged context.
      NSP           : CLOCKS_NSP_Field := 16#0#;
      --  If 1, and SP is also set, CLOCKS can be accessed from a Secure,
      --  Unprivileged context.
      SU            : CLOCKS_SU_Field := 16#0#;
      --  If 1, CLOCKS can be accessed from a Secure, Privileged context.
      SP            : CLOCKS_SP_Field := 16#1#;
      --  If 1, CLOCKS can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : CLOCKS_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, CLOCKS can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : CLOCKS_DMA_Field := 16#0#;
      --  If 1, CLOCKS can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : CLOCKS_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CLOCKS_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype XOSC_NSU_Field is RP2350.Bit;
   subtype XOSC_NSP_Field is RP2350.Bit;
   subtype XOSC_SU_Field is RP2350.Bit;
   subtype XOSC_SP_Field is RP2350.Bit;
   --  XOSC_CORE array element
   subtype XOSC_CORE_Element is RP2350.Bit;

   --  XOSC_CORE array
   type XOSC_CORE_Field_Array is array (0 .. 1) of XOSC_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for XOSC_CORE
   type XOSC_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : XOSC_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for XOSC_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype XOSC_DMA_Field is RP2350.Bit;
   subtype XOSC_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access XOSC, and at
   --  what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type XOSC_Register is record
      --  If 1, and NSP is also set, XOSC can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : XOSC_NSU_Field := 16#0#;
      --  If 1, XOSC can be accessed from a Non-secure, Privileged context.
      NSP           : XOSC_NSP_Field := 16#0#;
      --  If 1, and SP is also set, XOSC can be accessed from a Secure,
      --  Unprivileged context.
      SU            : XOSC_SU_Field := 16#0#;
      --  If 1, XOSC can be accessed from a Secure, Privileged context.
      SP            : XOSC_SP_Field := 16#1#;
      --  If 1, XOSC can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : XOSC_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, XOSC can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : XOSC_DMA_Field := 16#0#;
      --  If 1, XOSC can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : XOSC_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XOSC_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ROSC_NSU_Field is RP2350.Bit;
   subtype ROSC_NSP_Field is RP2350.Bit;
   subtype ROSC_SU_Field is RP2350.Bit;
   subtype ROSC_SP_Field is RP2350.Bit;
   --  ROSC_CORE array element
   subtype ROSC_CORE_Element is RP2350.Bit;

   --  ROSC_CORE array
   type ROSC_CORE_Field_Array is array (0 .. 1) of ROSC_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for ROSC_CORE
   type ROSC_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : ROSC_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for ROSC_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype ROSC_DMA_Field is RP2350.Bit;
   subtype ROSC_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access ROSC, and at
   --  what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type ROSC_Register is record
      --  If 1, and NSP is also set, ROSC can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : ROSC_NSU_Field := 16#0#;
      --  If 1, ROSC can be accessed from a Non-secure, Privileged context.
      NSP           : ROSC_NSP_Field := 16#0#;
      --  If 1, and SP is also set, ROSC can be accessed from a Secure,
      --  Unprivileged context.
      SU            : ROSC_SU_Field := 16#0#;
      --  If 1, ROSC can be accessed from a Secure, Privileged context.
      SP            : ROSC_SP_Field := 16#1#;
      --  If 1, ROSC can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : ROSC_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, ROSC can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : ROSC_DMA_Field := 16#0#;
      --  If 1, ROSC can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : ROSC_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ROSC_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PLL_SYS_NSU_Field is RP2350.Bit;
   subtype PLL_SYS_NSP_Field is RP2350.Bit;
   subtype PLL_SYS_SU_Field is RP2350.Bit;
   subtype PLL_SYS_SP_Field is RP2350.Bit;
   --  PLL_SYS_CORE array element
   subtype PLL_SYS_CORE_Element is RP2350.Bit;

   --  PLL_SYS_CORE array
   type PLL_SYS_CORE_Field_Array is array (0 .. 1) of PLL_SYS_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PLL_SYS_CORE
   type PLL_SYS_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : PLL_SYS_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PLL_SYS_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PLL_SYS_DMA_Field is RP2350.Bit;
   subtype PLL_SYS_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access PLL_SYS, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type PLL_SYS_Register is record
      --  If 1, and NSP is also set, PLL_SYS can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : PLL_SYS_NSU_Field := 16#0#;
      --  If 1, PLL_SYS can be accessed from a Non-secure, Privileged context.
      NSP           : PLL_SYS_NSP_Field := 16#0#;
      --  If 1, and SP is also set, PLL_SYS can be accessed from a Secure,
      --  Unprivileged context.
      SU            : PLL_SYS_SU_Field := 16#0#;
      --  If 1, PLL_SYS can be accessed from a Secure, Privileged context.
      SP            : PLL_SYS_SP_Field := 16#1#;
      --  If 1, PLL_SYS can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : PLL_SYS_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, PLL_SYS can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : PLL_SYS_DMA_Field := 16#0#;
      --  If 1, PLL_SYS can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : PLL_SYS_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL_SYS_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PLL_USB_NSU_Field is RP2350.Bit;
   subtype PLL_USB_NSP_Field is RP2350.Bit;
   subtype PLL_USB_SU_Field is RP2350.Bit;
   subtype PLL_USB_SP_Field is RP2350.Bit;
   --  PLL_USB_CORE array element
   subtype PLL_USB_CORE_Element is RP2350.Bit;

   --  PLL_USB_CORE array
   type PLL_USB_CORE_Field_Array is array (0 .. 1) of PLL_USB_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for PLL_USB_CORE
   type PLL_USB_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : PLL_USB_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for PLL_USB_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype PLL_USB_DMA_Field is RP2350.Bit;
   subtype PLL_USB_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access PLL_USB, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type PLL_USB_Register is record
      --  If 1, and NSP is also set, PLL_USB can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : PLL_USB_NSU_Field := 16#0#;
      --  If 1, PLL_USB can be accessed from a Non-secure, Privileged context.
      NSP           : PLL_USB_NSP_Field := 16#0#;
      --  If 1, and SP is also set, PLL_USB can be accessed from a Secure,
      --  Unprivileged context.
      SU            : PLL_USB_SU_Field := 16#0#;
      --  If 1, PLL_USB can be accessed from a Secure, Privileged context.
      SP            : PLL_USB_SP_Field := 16#1#;
      --  If 1, PLL_USB can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : PLL_USB_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, PLL_USB can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : PLL_USB_DMA_Field := 16#0#;
      --  If 1, PLL_USB can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : PLL_USB_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PLL_USB_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TICKS_NSU_Field is RP2350.Bit;
   subtype TICKS_NSP_Field is RP2350.Bit;
   subtype TICKS_SU_Field is RP2350.Bit;
   subtype TICKS_SP_Field is RP2350.Bit;
   --  TICKS_CORE array element
   subtype TICKS_CORE_Element is RP2350.Bit;

   --  TICKS_CORE array
   type TICKS_CORE_Field_Array is array (0 .. 1) of TICKS_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for TICKS_CORE
   type TICKS_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : TICKS_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TICKS_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype TICKS_DMA_Field is RP2350.Bit;
   subtype TICKS_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access TICKS, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type TICKS_Register is record
      --  If 1, and NSP is also set, TICKS can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : TICKS_NSU_Field := 16#0#;
      --  If 1, TICKS can be accessed from a Non-secure, Privileged context.
      NSP           : TICKS_NSP_Field := 16#0#;
      --  If 1, and SP is also set, TICKS can be accessed from a Secure,
      --  Unprivileged context.
      SU            : TICKS_SU_Field := 16#0#;
      --  If 1, TICKS can be accessed from a Secure, Privileged context.
      SP            : TICKS_SP_Field := 16#1#;
      --  If 1, TICKS can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : TICKS_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, TICKS can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : TICKS_DMA_Field := 16#0#;
      --  If 1, TICKS can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : TICKS_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TICKS_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype WATCHDOG_NSU_Field is RP2350.Bit;
   subtype WATCHDOG_NSP_Field is RP2350.Bit;
   subtype WATCHDOG_SU_Field is RP2350.Bit;
   subtype WATCHDOG_SP_Field is RP2350.Bit;
   --  WATCHDOG_CORE array element
   subtype WATCHDOG_CORE_Element is RP2350.Bit;

   --  WATCHDOG_CORE array
   type WATCHDOG_CORE_Field_Array is array (0 .. 1) of WATCHDOG_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for WATCHDOG_CORE
   type WATCHDOG_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : WATCHDOG_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for WATCHDOG_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype WATCHDOG_DMA_Field is RP2350.Bit;
   subtype WATCHDOG_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access WATCHDOG,
   --  and at what security/privilege levels they can do so. Defaults to
   --  Secure, Privileged processor or debug access only. This register is
   --  writable only from a Secure, Privileged processor or debugger, with the
   --  exception of the NSU bit, which becomes Non-secure-Privileged-writable
   --  when the NSP bit is set.
   type WATCHDOG_Register is record
      --  If 1, and NSP is also set, WATCHDOG can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : WATCHDOG_NSU_Field := 16#0#;
      --  If 1, WATCHDOG can be accessed from a Non-secure, Privileged context.
      NSP           : WATCHDOG_NSP_Field := 16#0#;
      --  If 1, and SP is also set, WATCHDOG can be accessed from a Secure,
      --  Unprivileged context.
      SU            : WATCHDOG_SU_Field := 16#0#;
      --  If 1, WATCHDOG can be accessed from a Secure, Privileged context.
      SP            : WATCHDOG_SP_Field := 16#1#;
      --  If 1, WATCHDOG can be accessed by core 0, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      CORE          : WATCHDOG_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, WATCHDOG can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : WATCHDOG_DMA_Field := 16#0#;
      --  If 1, WATCHDOG can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : WATCHDOG_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for WATCHDOG_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RSM_NSU_Field is RP2350.Bit;
   subtype RSM_NSP_Field is RP2350.Bit;
   subtype RSM_SU_Field is RP2350.Bit;
   subtype RSM_SP_Field is RP2350.Bit;
   --  RSM_CORE array element
   subtype RSM_CORE_Element is RP2350.Bit;

   --  RSM_CORE array
   type RSM_CORE_Field_Array is array (0 .. 1) of RSM_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for RSM_CORE
   type RSM_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : RSM_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for RSM_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype RSM_DMA_Field is RP2350.Bit;
   subtype RSM_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access RSM, and at
   --  what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type RSM_Register is record
      --  If 1, and NSP is also set, RSM can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : RSM_NSU_Field := 16#0#;
      --  If 1, RSM can be accessed from a Non-secure, Privileged context.
      NSP           : RSM_NSP_Field := 16#0#;
      --  If 1, and SP is also set, RSM can be accessed from a Secure,
      --  Unprivileged context.
      SU            : RSM_SU_Field := 16#0#;
      --  If 1, RSM can be accessed from a Secure, Privileged context.
      SP            : RSM_SP_Field := 16#1#;
      --  If 1, RSM can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : RSM_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, RSM can be accessed by the DMA, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      DMA           : RSM_DMA_Field := 16#0#;
      --  If 1, RSM can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : RSM_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for RSM_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype XIP_CTRL_NSU_Field is RP2350.Bit;
   subtype XIP_CTRL_NSP_Field is RP2350.Bit;
   subtype XIP_CTRL_SU_Field is RP2350.Bit;
   subtype XIP_CTRL_SP_Field is RP2350.Bit;
   --  XIP_CTRL_CORE array element
   subtype XIP_CTRL_CORE_Element is RP2350.Bit;

   --  XIP_CTRL_CORE array
   type XIP_CTRL_CORE_Field_Array is array (0 .. 1) of XIP_CTRL_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for XIP_CTRL_CORE
   type XIP_CTRL_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : XIP_CTRL_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for XIP_CTRL_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype XIP_CTRL_DMA_Field is RP2350.Bit;
   subtype XIP_CTRL_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access XIP_CTRL,
   --  and at what security/privilege levels they can do so. Defaults to
   --  Secure, Privileged processor or debug access only. This register is
   --  writable only from a Secure, Privileged processor or debugger, with the
   --  exception of the NSU bit, which becomes Non-secure-Privileged-writable
   --  when the NSP bit is set.
   type XIP_CTRL_Register is record
      --  If 1, and NSP is also set, XIP_CTRL can be accessed from a
      --  Non-secure, Unprivileged context. This bit is writable from a
      --  Non-secure, Privileged context, if and only if the NSP bit is set.
      NSU           : XIP_CTRL_NSU_Field := 16#0#;
      --  If 1, XIP_CTRL can be accessed from a Non-secure, Privileged context.
      NSP           : XIP_CTRL_NSP_Field := 16#0#;
      --  If 1, and SP is also set, XIP_CTRL can be accessed from a Secure,
      --  Unprivileged context.
      SU            : XIP_CTRL_SU_Field := 16#0#;
      --  If 1, XIP_CTRL can be accessed from a Secure, Privileged context.
      SP            : XIP_CTRL_SP_Field := 16#1#;
      --  If 1, XIP_CTRL can be accessed by core 0, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      CORE          : XIP_CTRL_CORE_Field :=
                       (As_Array => False, Val => 16#1#);
      --  If 1, XIP_CTRL can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : XIP_CTRL_DMA_Field := 16#0#;
      --  If 1, XIP_CTRL can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : XIP_CTRL_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIP_CTRL_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype XIP_QMI_NSU_Field is RP2350.Bit;
   subtype XIP_QMI_NSP_Field is RP2350.Bit;
   subtype XIP_QMI_SU_Field is RP2350.Bit;
   subtype XIP_QMI_SP_Field is RP2350.Bit;
   --  XIP_QMI_CORE array element
   subtype XIP_QMI_CORE_Element is RP2350.Bit;

   --  XIP_QMI_CORE array
   type XIP_QMI_CORE_Field_Array is array (0 .. 1) of XIP_QMI_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for XIP_QMI_CORE
   type XIP_QMI_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : XIP_QMI_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for XIP_QMI_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype XIP_QMI_DMA_Field is RP2350.Bit;
   subtype XIP_QMI_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access XIP_QMI, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged processor or debug access only. This register is writable
   --  only from a Secure, Privileged processor or debugger, with the exception
   --  of the NSU bit, which becomes Non-secure-Privileged-writable when the
   --  NSP bit is set.
   type XIP_QMI_Register is record
      --  If 1, and NSP is also set, XIP_QMI can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : XIP_QMI_NSU_Field := 16#0#;
      --  If 1, XIP_QMI can be accessed from a Non-secure, Privileged context.
      NSP           : XIP_QMI_NSP_Field := 16#0#;
      --  If 1, and SP is also set, XIP_QMI can be accessed from a Secure,
      --  Unprivileged context.
      SU            : XIP_QMI_SU_Field := 16#0#;
      --  If 1, XIP_QMI can be accessed from a Secure, Privileged context.
      SP            : XIP_QMI_SP_Field := 16#1#;
      --  If 1, XIP_QMI can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : XIP_QMI_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, XIP_QMI can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : XIP_QMI_DMA_Field := 16#0#;
      --  If 1, XIP_QMI can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : XIP_QMI_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIP_QMI_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype XIP_AUX_NSU_Field is RP2350.Bit;
   subtype XIP_AUX_NSP_Field is RP2350.Bit;
   subtype XIP_AUX_SU_Field is RP2350.Bit;
   subtype XIP_AUX_SP_Field is RP2350.Bit;
   --  XIP_AUX_CORE array element
   subtype XIP_AUX_CORE_Element is RP2350.Bit;

   --  XIP_AUX_CORE array
   type XIP_AUX_CORE_Field_Array is array (0 .. 1) of XIP_AUX_CORE_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for XIP_AUX_CORE
   type XIP_AUX_CORE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CORE as a value
            Val : RP2350.UInt2;
         when True =>
            --  CORE as an array
            Arr : XIP_AUX_CORE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for XIP_AUX_CORE_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype XIP_AUX_DMA_Field is RP2350.Bit;
   subtype XIP_AUX_DBG_Field is RP2350.Bit;

   --  Control whether debugger, DMA, core 0 and core 1 can access XIP_AUX, and
   --  at what security/privilege levels they can do so. Defaults to Secure,
   --  Privileged access only. This register is writable only from a Secure,
   --  Privileged processor or debugger, with the exception of the NSU bit,
   --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
   type XIP_AUX_Register is record
      --  If 1, and NSP is also set, XIP_AUX can be accessed from a Non-secure,
      --  Unprivileged context. This bit is writable from a Non-secure,
      --  Privileged context, if and only if the NSP bit is set.
      NSU           : XIP_AUX_NSU_Field := 16#0#;
      --  If 1, XIP_AUX can be accessed from a Non-secure, Privileged context.
      NSP           : XIP_AUX_NSP_Field := 16#0#;
      --  If 1, and SP is also set, XIP_AUX can be accessed from a Secure,
      --  Unprivileged context.
      SU            : XIP_AUX_SU_Field := 16#0#;
      --  If 1, XIP_AUX can be accessed from a Secure, Privileged context.
      SP            : XIP_AUX_SP_Field := 16#1#;
      --  If 1, XIP_AUX can be accessed by core 0, at security/privilege levels
      --  permitted by SP/NSP/SU/NSU in this register.
      CORE          : XIP_AUX_CORE_Field := (As_Array => False, Val => 16#1#);
      --  If 1, XIP_AUX can be accessed by the DMA, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DMA           : XIP_AUX_DMA_Field := 16#1#;
      --  If 1, XIP_AUX can be accessed by the debugger, at security/privilege
      --  levels permitted by SP/NSP/SU/NSU in this register.
      DBG           : XIP_AUX_DBG_Field := 16#1#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for XIP_AUX_Register use record
      NSU           at 0 range 0 .. 0;
      NSP           at 0 range 1 .. 1;
      SU            at 0 range 2 .. 2;
      SP            at 0 range 3 .. 3;
      CORE          at 0 range 4 .. 5;
      DMA           at 0 range 6 .. 6;
      DBG           at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  Hardware access control registers
   type ACCESSCTRL_Peripheral is record
      --  Once a LOCK bit is written to 1, ACCESSCTRL silently ignores writes
      --  from that master. LOCK is writable only by a Secure, Privileged
      --  processor or debugger. LOCK bits are only writable when their value
      --  is zero. Once set, they can never be cleared, except by a full reset
      --  of ACCESSCTRL Setting the LOCK bit does not affect whether an access
      --  raises a bus error. Unprivileged writes, or writes from the DMA, will
      --  continue to raise bus errors. All other accesses will continue not
      --  to.
      LOCK             : aliased LOCK_Register;
      --  Force core 1's bus accesses to always be Non-secure, no matter the
      --  core's internal state. Useful for schemes where one core is
      --  designated as the Non-secure core, since some peripherals may filter
      --  individual registers internally based on security state but not on
      --  master ID.
      FORCE_CORE_NS    : aliased FORCE_CORE_NS_Register;
      --  Write 1 to reset all ACCESSCTRL configuration, except for the LOCK
      --  and FORCE_CORE_NS registers. This bit is used in the RP2350 bootrom
      --  to quickly restore ACCESSCTRL to a known state during the boot path.
      --  Note that, like all registers in ACCESSCTRL, this register is not
      --  writable when the writer's corresponding LOCK bit is set, therefore a
      --  master which has been locked out of ACCESSCTRL can not use the
      --  CFGRESET register to disturb its contents.
      CFGRESET         : aliased CFGRESET_Register;
      --  Control whether GPIO0...31 are accessible to Non-secure code.
      --  Writable only by a Secure, Privileged processor or debugger. 0 ->
      --  Secure access only 1 -> Secure + Non-secure access
      GPIO_NSMASK0     : aliased RP2350.UInt32;
      --  Control whether GPIO32..47 are accessible to Non-secure code, and
      --  whether QSPI and USB bitbang are accessible through the Non-secure
      --  SIO. Writable only by a Secure, Privileged processor or debugger.
      GPIO_NSMASK1     : aliased GPIO_NSMASK1_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access ROM, and
      --  at what security/privilege levels they can do so. Defaults to fully
      --  open access. This register is writable only from a Secure, Privileged
      --  processor or debugger, with the exception of the NSU bit, which
      --  becomes Non-secure-Privileged-writable when the NSP bit is set.
      ROM              : aliased ROM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access XIP_MAIN,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      XIP_MAIN         : aliased XIP_MAIN_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM0,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM0            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM1,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM1            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM2,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM2            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM3,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM3            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM4,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM4            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM5,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM5            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM6,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM6            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM7,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM7            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM8,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM8            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SRAM9,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SRAM9            : aliased SRAM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access DMA, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      DMA              : aliased DMA_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access USBCTRL,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      USBCTRL          : aliased USBCTRL_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access PIO0, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      PIO0             : aliased PIO_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access PIO1, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      PIO1             : aliased PIO_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access PIO2, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      PIO2             : aliased PIO_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access
      --  CORESIGHT_TRACE, and at what security/privilege levels they can do
      --  so. Defaults to Secure, Privileged processor or debug access only.
      --  This register is writable only from a Secure, Privileged processor or
      --  debugger, with the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      CORESIGHT_TRACE  : aliased CORESIGHT_TRACE_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access
      --  CORESIGHT_PERIPH, and at what security/privilege levels they can do
      --  so. Defaults to Secure, Privileged processor or debug access only.
      --  This register is writable only from a Secure, Privileged processor or
      --  debugger, with the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      CORESIGHT_PERIPH : aliased CORESIGHT_PERIPH_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SYSINFO,
      --  and at what security/privilege levels they can do so. Defaults to
      --  fully open access. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SYSINFO          : aliased SYSINFO_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access RESETS,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      RESETS           : aliased RESETS_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access IO_BANK0,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      IO_BANK0         : aliased IO_BANK_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access IO_BANK1,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      IO_BANK1         : aliased IO_BANK_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access
      --  PADS_BANK0, and at what security/privilege levels they can do so.
      --  Defaults to Secure access from any master. This register is writable
      --  only from a Secure, Privileged processor or debugger, with the
      --  exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      PADS_BANK0       : aliased PADS_BANK0_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access
      --  PADS_QSPI, and at what security/privilege levels they can do so.
      --  Defaults to Secure access from any master. This register is writable
      --  only from a Secure, Privileged processor or debugger, with the
      --  exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      PADS_QSPI        : aliased PADS_QSPI_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access BUSCTRL,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      BUSCTRL          : aliased BUSCTRL_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access ADC0, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      ADC0             : aliased ADC0_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access HSTX, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      HSTX             : aliased HSTX_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access I2C0, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      I2C0             : aliased I2C_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access I2C1, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      I2C1             : aliased I2C_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access PWM, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      PWM              : aliased PWM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SPI0, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SPI0             : aliased SPI_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SPI1, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      SPI1             : aliased SPI_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access TIMER0,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      TIMER0           : aliased TIMER_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access TIMER1,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      TIMER1           : aliased TIMER_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access UART0,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      UART0            : aliased UART_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access UART1,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      UART1            : aliased UART_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access OTP, and
      --  at what security/privilege levels they can do so. Defaults to Secure
      --  access from any master. This register is writable only from a Secure,
      --  Privileged processor or debugger, with the exception of the NSU bit,
      --  which becomes Non-secure-Privileged-writable when the NSP bit is set.
      OTP              : aliased OTP_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access TBMAN,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure access from any master. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      TBMAN            : aliased TBMAN_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access POWMAN,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      POWMAN           : aliased POWMAN_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access TRNG, and
      --  at what security/privilege levels they can do so. Defaults to Secure,
      --  Privileged processor or debug access only. This register is writable
      --  only from a Secure, Privileged processor or debugger, with the
      --  exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      TRNG             : aliased TRNG_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SHA256,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged access only. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      SHA256           : aliased SHA256_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access SYSCFG,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      SYSCFG           : aliased SYSCFG_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access CLOCKS,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      CLOCKS           : aliased CLOCKS_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access XOSC, and
      --  at what security/privilege levels they can do so. Defaults to Secure,
      --  Privileged processor or debug access only. This register is writable
      --  only from a Secure, Privileged processor or debugger, with the
      --  exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      XOSC             : aliased XOSC_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access ROSC, and
      --  at what security/privilege levels they can do so. Defaults to Secure,
      --  Privileged processor or debug access only. This register is writable
      --  only from a Secure, Privileged processor or debugger, with the
      --  exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      ROSC             : aliased ROSC_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access PLL_SYS,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      PLL_SYS          : aliased PLL_SYS_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access PLL_USB,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      PLL_USB          : aliased PLL_USB_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access TICKS,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      TICKS            : aliased TICKS_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access WATCHDOG,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      WATCHDOG         : aliased WATCHDOG_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access RSM, and
      --  at what security/privilege levels they can do so. Defaults to Secure,
      --  Privileged processor or debug access only. This register is writable
      --  only from a Secure, Privileged processor or debugger, with the
      --  exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      RSM              : aliased RSM_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access XIP_CTRL,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      XIP_CTRL         : aliased XIP_CTRL_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access XIP_QMI,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged processor or debug access only. This register is
      --  writable only from a Secure, Privileged processor or debugger, with
      --  the exception of the NSU bit, which becomes
      --  Non-secure-Privileged-writable when the NSP bit is set.
      XIP_QMI          : aliased XIP_QMI_Register;
      --  Control whether debugger, DMA, core 0 and core 1 can access XIP_AUX,
      --  and at what security/privilege levels they can do so. Defaults to
      --  Secure, Privileged access only. This register is writable only from a
      --  Secure, Privileged processor or debugger, with the exception of the
      --  NSU bit, which becomes Non-secure-Privileged-writable when the NSP
      --  bit is set.
      XIP_AUX          : aliased XIP_AUX_Register;
   end record
     with Volatile;

   for ACCESSCTRL_Peripheral use record
      LOCK             at 16#0# range 0 .. 31;
      FORCE_CORE_NS    at 16#4# range 0 .. 31;
      CFGRESET         at 16#8# range 0 .. 31;
      GPIO_NSMASK0     at 16#C# range 0 .. 31;
      GPIO_NSMASK1     at 16#10# range 0 .. 31;
      ROM              at 16#14# range 0 .. 31;
      XIP_MAIN         at 16#18# range 0 .. 31;
      SRAM0            at 16#1C# range 0 .. 31;
      SRAM1            at 16#20# range 0 .. 31;
      SRAM2            at 16#24# range 0 .. 31;
      SRAM3            at 16#28# range 0 .. 31;
      SRAM4            at 16#2C# range 0 .. 31;
      SRAM5            at 16#30# range 0 .. 31;
      SRAM6            at 16#34# range 0 .. 31;
      SRAM7            at 16#38# range 0 .. 31;
      SRAM8            at 16#3C# range 0 .. 31;
      SRAM9            at 16#40# range 0 .. 31;
      DMA              at 16#44# range 0 .. 31;
      USBCTRL          at 16#48# range 0 .. 31;
      PIO0             at 16#4C# range 0 .. 31;
      PIO1             at 16#50# range 0 .. 31;
      PIO2             at 16#54# range 0 .. 31;
      CORESIGHT_TRACE  at 16#58# range 0 .. 31;
      CORESIGHT_PERIPH at 16#5C# range 0 .. 31;
      SYSINFO          at 16#60# range 0 .. 31;
      RESETS           at 16#64# range 0 .. 31;
      IO_BANK0         at 16#68# range 0 .. 31;
      IO_BANK1         at 16#6C# range 0 .. 31;
      PADS_BANK0       at 16#70# range 0 .. 31;
      PADS_QSPI        at 16#74# range 0 .. 31;
      BUSCTRL          at 16#78# range 0 .. 31;
      ADC0             at 16#7C# range 0 .. 31;
      HSTX             at 16#80# range 0 .. 31;
      I2C0             at 16#84# range 0 .. 31;
      I2C1             at 16#88# range 0 .. 31;
      PWM              at 16#8C# range 0 .. 31;
      SPI0             at 16#90# range 0 .. 31;
      SPI1             at 16#94# range 0 .. 31;
      TIMER0           at 16#98# range 0 .. 31;
      TIMER1           at 16#9C# range 0 .. 31;
      UART0            at 16#A0# range 0 .. 31;
      UART1            at 16#A4# range 0 .. 31;
      OTP              at 16#A8# range 0 .. 31;
      TBMAN            at 16#AC# range 0 .. 31;
      POWMAN           at 16#B0# range 0 .. 31;
      TRNG             at 16#B4# range 0 .. 31;
      SHA256           at 16#B8# range 0 .. 31;
      SYSCFG           at 16#BC# range 0 .. 31;
      CLOCKS           at 16#C0# range 0 .. 31;
      XOSC             at 16#C4# range 0 .. 31;
      ROSC             at 16#C8# range 0 .. 31;
      PLL_SYS          at 16#CC# range 0 .. 31;
      PLL_USB          at 16#D0# range 0 .. 31;
      TICKS            at 16#D4# range 0 .. 31;
      WATCHDOG         at 16#D8# range 0 .. 31;
      RSM              at 16#DC# range 0 .. 31;
      XIP_CTRL         at 16#E0# range 0 .. 31;
      XIP_QMI          at 16#E4# range 0 .. 31;
      XIP_AUX          at 16#E8# range 0 .. 31;
   end record;

   --  Hardware access control registers
   ACCESSCTRL_Periph : aliased ACCESSCTRL_Peripheral
     with Import, Address => ACCESSCTRL_Base;

end RP2350.ACCESSCTRL;
