pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with System;

--  TEAL registers accessible through the debug interface
package RP2350.PPB_NS is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   subtype ITM_TPR_PRIVMASK_Field is RP2350.UInt4;

   --  Controls which stimulus ports can be accessed by unprivileged code
   type ITM_TPR_Register is record
      --  Bit mask to enable tracing on ITM stimulus ports
      PRIVMASK      : ITM_TPR_PRIVMASK_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_TPR_Register use record
      PRIVMASK      at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ITM_TCR_ITMENA_Field is RP2350.Bit;
   subtype ITM_TCR_TSENA_Field is RP2350.Bit;
   subtype ITM_TCR_SYNCENA_Field is RP2350.Bit;
   subtype ITM_TCR_TXENA_Field is RP2350.Bit;
   subtype ITM_TCR_SWOENA_Field is RP2350.Bit;
   subtype ITM_TCR_STALLENA_Field is RP2350.Bit;
   subtype ITM_TCR_TSPRESCALE_Field is RP2350.UInt2;
   subtype ITM_TCR_GTSFREQ_Field is RP2350.UInt2;
   subtype ITM_TCR_TRACEBUSID_Field is RP2350.UInt7;
   subtype ITM_TCR_BUSY_Field is RP2350.Bit;

   --  Configures and controls transfers through the ITM interface
   type ITM_TCR_Register is record
      --  Enables the ITM
      ITMENA         : ITM_TCR_ITMENA_Field := 16#0#;
      --  Enables Local timestamp generation
      TSENA          : ITM_TCR_TSENA_Field := 16#0#;
      --  Enables Synchronization packet transmission for a synchronous TPIU
      SYNCENA        : ITM_TCR_SYNCENA_Field := 16#0#;
      --  Enables forwarding of hardware event packet from the DWT unit to the
      --  ITM for output to the TPIU
      TXENA          : ITM_TCR_TXENA_Field := 16#0#;
      --  Enables asynchronous clocking of the timestamp counter
      SWOENA         : ITM_TCR_SWOENA_Field := 16#0#;
      --  Stall the PE to guarantee delivery of Data Trace packets.
      STALLENA       : ITM_TCR_STALLENA_Field := 16#0#;
      --  unspecified
      Reserved_6_7   : RP2350.UInt2 := 16#0#;
      --  Local timestamp prescaler, used with the trace packet reference clock
      TSPRESCALE     : ITM_TCR_TSPRESCALE_Field := 16#0#;
      --  Defines how often the ITM generates a global timestamp, based on the
      --  global timestamp clock frequency, or disables generation of global
      --  timestamps
      GTSFREQ        : ITM_TCR_GTSFREQ_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4 := 16#0#;
      --  Identifier for multi-source trace stream formatting. If multi-source
      --  trace is in use, the debugger must write a unique non-zero trace ID
      --  value to this field
      TRACEBUSID     : ITM_TCR_TRACEBUSID_Field := 16#0#;
      --  Read-only. Indicates whether the ITM is currently processing events
      BUSY           : ITM_TCR_BUSY_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : RP2350.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_TCR_Register use record
      ITMENA         at 0 range 0 .. 0;
      TSENA          at 0 range 1 .. 1;
      SYNCENA        at 0 range 2 .. 2;
      TXENA          at 0 range 3 .. 3;
      SWOENA         at 0 range 4 .. 4;
      STALLENA       at 0 range 5 .. 5;
      Reserved_6_7   at 0 range 6 .. 7;
      TSPRESCALE     at 0 range 8 .. 9;
      GTSFREQ        at 0 range 10 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TRACEBUSID     at 0 range 16 .. 22;
      BUSY           at 0 range 23 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype INT_ATREADY_ATREADY_Field is RP2350.Bit;
   subtype INT_ATREADY_AFVALID_Field is RP2350.Bit;

   --  Integration Mode: Read ATB Ready
   type INT_ATREADY_Register is record
      --  Read-only. A read of this bit returns the value of ATREADY
      ATREADY       : INT_ATREADY_ATREADY_Field;
      --  Read-only. A read of this bit returns the value of AFVALID
      AFVALID       : INT_ATREADY_AFVALID_Field;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INT_ATREADY_Register use record
      ATREADY       at 0 range 0 .. 0;
      AFVALID       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype INT_ATVALID_ATREADY_Field is RP2350.Bit;
   subtype INT_ATVALID_AFREADY_Field is RP2350.Bit;

   --  Integration Mode: Write ATB Valid
   type INT_ATVALID_Register is record
      --  A write to this bit gives the value of ATVALID
      ATREADY       : INT_ATVALID_ATREADY_Field := 16#0#;
      --  A write to this bit gives the value of AFREADY
      AFREADY       : INT_ATVALID_AFREADY_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for INT_ATVALID_Register use record
      ATREADY       at 0 range 0 .. 0;
      AFREADY       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype ITM_ITCTRL_IME_Field is RP2350.Bit;

   --  Integration Mode Control Register
   type ITM_ITCTRL_Register is record
      --  Integration mode enable bit - The possible values are: 0 - The trace
      --  unit is not in integration mode. 1 - The trace unit is in integration
      --  mode. This mode enables: A debug agent to perform topology detection.
      --  SoC test software to perform integration testing.
      IME           : ITM_ITCTRL_IME_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : RP2350.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_ITCTRL_Register use record
      IME           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype ITM_DEVARCH_ARCHPART_Field is RP2350.UInt12;
   subtype ITM_DEVARCH_ARCHVER_Field is RP2350.UInt4;
   subtype ITM_DEVARCH_REVISION_Field is RP2350.UInt4;
   subtype ITM_DEVARCH_PRESENT_Field is RP2350.Bit;
   subtype ITM_DEVARCH_ARCHITECT_Field is RP2350.UInt11;

   --  Provides CoreSight discovery information for the ITM
   type ITM_DEVARCH_Register is record
      --  Read-only. Defines the architecture of the component
      ARCHPART  : ITM_DEVARCH_ARCHPART_Field;
      --  Read-only. Defines the architecture version of the component
      ARCHVER   : ITM_DEVARCH_ARCHVER_Field;
      --  Read-only. Defines the architecture revision of the component
      REVISION  : ITM_DEVARCH_REVISION_Field;
      --  Read-only. Defines that the DEVARCH register is present
      PRESENT   : ITM_DEVARCH_PRESENT_Field;
      --  Read-only. Defines the architect of the component. Bits [31:28] are
      --  the JEP106 continuation code (JEP106 bank ID, minus 1) and bits
      --  [27:21] are the JEP106 ID code.
      ARCHITECT : ITM_DEVARCH_ARCHITECT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_DEVARCH_Register use record
      ARCHPART  at 0 range 0 .. 11;
      ARCHVER   at 0 range 12 .. 15;
      REVISION  at 0 range 16 .. 19;
      PRESENT   at 0 range 20 .. 20;
      ARCHITECT at 0 range 21 .. 31;
   end record;

   subtype ITM_DEVTYPE_MAJOR_Field is RP2350.UInt4;
   subtype ITM_DEVTYPE_SUB_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the ITM
   type ITM_DEVTYPE_Register is record
      --  Read-only. Component major type
      MAJOR         : ITM_DEVTYPE_MAJOR_Field;
      --  Read-only. Component sub-type
      SUB           : ITM_DEVTYPE_SUB_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_DEVTYPE_Register use record
      MAJOR         at 0 range 0 .. 3;
      SUB           at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_PIDR4_DES_2_Field is RP2350.UInt4;
   subtype ITM_PIDR4_SIZE_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the ITM
   type ITM_PIDR4_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_2         : ITM_PIDR4_DES_2_Field;
      --  Read-only. See CoreSight Architecture Specification
      SIZE          : ITM_PIDR4_SIZE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PIDR4_Register use record
      DES_2         at 0 range 0 .. 3;
      SIZE          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_PIDR0_PART_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the ITM
   type ITM_PIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_0        : ITM_PIDR0_PART_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PIDR0_Register use record
      PART_0        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_PIDR1_PART_1_Field is RP2350.UInt4;
   subtype ITM_PIDR1_DES_0_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the ITM
   type ITM_PIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_1        : ITM_PIDR1_PART_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      DES_0         : ITM_PIDR1_DES_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PIDR1_Register use record
      PART_1        at 0 range 0 .. 3;
      DES_0         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_PIDR2_DES_1_Field is RP2350.UInt3;
   subtype ITM_PIDR2_JEDEC_Field is RP2350.Bit;
   subtype ITM_PIDR2_REVISION_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the ITM
   type ITM_PIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_1         : ITM_PIDR2_DES_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      JEDEC         : ITM_PIDR2_JEDEC_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVISION      : ITM_PIDR2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PIDR2_Register use record
      DES_1         at 0 range 0 .. 2;
      JEDEC         at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_PIDR3_CMOD_Field is RP2350.UInt4;
   subtype ITM_PIDR3_REVAND_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the ITM
   type ITM_PIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      CMOD          : ITM_PIDR3_CMOD_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVAND        : ITM_PIDR3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_PIDR3_Register use record
      CMOD          at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_CIDR0_PRMBL_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the ITM
   type ITM_CIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_0       : ITM_CIDR0_PRMBL_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_CIDR0_Register use record
      PRMBL_0       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_CIDR1_PRMBL_1_Field is RP2350.UInt4;
   subtype ITM_CIDR1_CLASS_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the ITM
   type ITM_CIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_1       : ITM_CIDR1_PRMBL_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      CLASS         : ITM_CIDR1_CLASS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_CIDR1_Register use record
      PRMBL_1       at 0 range 0 .. 3;
      CLASS         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_CIDR2_PRMBL_2_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the ITM
   type ITM_CIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_2       : ITM_CIDR2_PRMBL_2_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_CIDR2_Register use record
      PRMBL_2       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITM_CIDR3_PRMBL_3_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the ITM
   type ITM_CIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_3       : ITM_CIDR3_PRMBL_3_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITM_CIDR3_Register use record
      PRMBL_3       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_CTRL_CYCCNTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_POSTPRESET_Field is RP2350.UInt4;
   subtype DWT_CTRL_POSTINIT_Field is RP2350.UInt4;
   subtype DWT_CTRL_CYCTAP_Field is RP2350.Bit;
   subtype DWT_CTRL_SYNCTAP_Field is RP2350.UInt2;
   subtype DWT_CTRL_PCSAMPLENA_Field is RP2350.Bit;
   subtype DWT_CTRL_EXTTRCENA_Field is RP2350.Bit;
   subtype DWT_CTRL_CPIEVTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_EXCEVTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_SLEEPEVTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_LSUEVTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_FOLDEVTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_CYCEVTENA_Field is RP2350.Bit;
   subtype DWT_CTRL_CYCDISS_Field is RP2350.Bit;
   subtype DWT_CTRL_NOPRFCNT_Field is RP2350.Bit;
   subtype DWT_CTRL_NOCYCCNT_Field is RP2350.Bit;
   subtype DWT_CTRL_NOEXTTRIG_Field is RP2350.Bit;
   subtype DWT_CTRL_NOTRCPKT_Field is RP2350.Bit;
   subtype DWT_CTRL_NUMCOMP_Field is RP2350.UInt4;

   --  Provides configuration and status information for the DWT unit, and used
   --  to control features of the unit
   type DWT_CTRL_Register is record
      --  Enables CYCCNT
      CYCCNTENA      : DWT_CTRL_CYCCNTENA_Field := 16#0#;
      --  Reload value for the POSTCNT counter
      POSTPRESET     : DWT_CTRL_POSTPRESET_Field := 16#2#;
      --  Initial value for the POSTCNT counter
      POSTINIT       : DWT_CTRL_POSTINIT_Field := 16#1#;
      --  Selects the position of the POSTCNT tap on the CYCCNT counter
      CYCTAP         : DWT_CTRL_CYCTAP_Field := 16#0#;
      --  Selects the position of the synchronization packet counter tap on the
      --  CYCCNT counter. This determines the Synchronization packet rate
      SYNCTAP        : DWT_CTRL_SYNCTAP_Field := 16#2#;
      --  Enables use of POSTCNT counter as a timer for Periodic PC Sample
      --  packet generation
      PCSAMPLENA     : DWT_CTRL_PCSAMPLENA_Field := 16#1#;
      --  unspecified
      Reserved_13_15 : RP2350.UInt3 := 16#0#;
      --  Enables generation of Exception Trace packets
      EXTTRCENA      : DWT_CTRL_EXTTRCENA_Field := 16#0#;
      --  Enables DWT_CPICNT counter
      CPIEVTENA      : DWT_CTRL_CPIEVTENA_Field := 16#0#;
      --  Enables DWT_EXCCNT counter
      EXCEVTENA      : DWT_CTRL_EXCEVTENA_Field := 16#1#;
      --  Enable DWT_SLEEPCNT counter
      SLEEPEVTENA    : DWT_CTRL_SLEEPEVTENA_Field := 16#0#;
      --  Enables DWT_LSUCNT counter
      LSUEVTENA      : DWT_CTRL_LSUEVTENA_Field := 16#1#;
      --  Enables DWT_FOLDCNT counter
      FOLDEVTENA     : DWT_CTRL_FOLDEVTENA_Field := 16#1#;
      --  Enables Event Counter packet generation on POSTCNT underflow
      CYCEVTENA      : DWT_CTRL_CYCEVTENA_Field := 16#1#;
      --  Controls whether the cycle counter is disabled in Secure state
      CYCDISS        : DWT_CTRL_CYCDISS_Field := 16#0#;
      --  Read-only. Indicates whether the implementation does not include the
      --  profiling counters
      NOPRFCNT       : DWT_CTRL_NOPRFCNT_Field := 16#1#;
      --  Read-only. Indicates whether the implementation does not include a
      --  cycle counter
      NOCYCCNT       : DWT_CTRL_NOCYCCNT_Field := 16#1#;
      --  Read-only. Reserved, RAZ
      NOEXTTRIG      : DWT_CTRL_NOEXTTRIG_Field := 16#0#;
      --  Read-only. Indicates whether the implementation does not support
      --  trace
      NOTRCPKT       : DWT_CTRL_NOTRCPKT_Field := 16#0#;
      --  Read-only. Number of DWT comparators implemented
      NUMCOMP        : DWT_CTRL_NUMCOMP_Field := 16#7#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_CTRL_Register use record
      CYCCNTENA      at 0 range 0 .. 0;
      POSTPRESET     at 0 range 1 .. 4;
      POSTINIT       at 0 range 5 .. 8;
      CYCTAP         at 0 range 9 .. 9;
      SYNCTAP        at 0 range 10 .. 11;
      PCSAMPLENA     at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
      EXTTRCENA      at 0 range 16 .. 16;
      CPIEVTENA      at 0 range 17 .. 17;
      EXCEVTENA      at 0 range 18 .. 18;
      SLEEPEVTENA    at 0 range 19 .. 19;
      LSUEVTENA      at 0 range 20 .. 20;
      FOLDEVTENA     at 0 range 21 .. 21;
      CYCEVTENA      at 0 range 22 .. 22;
      CYCDISS        at 0 range 23 .. 23;
      NOPRFCNT       at 0 range 24 .. 24;
      NOCYCCNT       at 0 range 25 .. 25;
      NOEXTTRIG      at 0 range 26 .. 26;
      NOTRCPKT       at 0 range 27 .. 27;
      NUMCOMP        at 0 range 28 .. 31;
   end record;

   subtype DWT_EXCCNT_EXCCNT_Field is RP2350.Byte;

   --  Counts the total cycles spent in exception processing
   type DWT_EXCCNT_Register is record
      --  Counts one on each cycle when all of the following are true: -
      --  DWT_CTRL.EXCEVTENA == 1 and DEMCR.TRCENA == 1. - No instruction is
      --  executed, see DWT_CPICNT. - An exception-entry or exception-exit
      --  related operation is in progress. - Either
      --  SecureNoninvasiveDebugAllowed() == TRUE, or NS-Req for the operation
      --  is set to Non-secure and NoninvasiveDebugAllowed() == TRUE.
      EXCCNT        : DWT_EXCCNT_EXCCNT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_EXCCNT_Register use record
      EXCCNT        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_LSUCNT_LSUCNT_Field is RP2350.Byte;

   --  Increments on the additional cycles required to execute all load or
   --  store instructions
   type DWT_LSUCNT_Register is record
      --  Counts one on each cycle when all of the following are true: -
      --  DWT_CTRL.LSUEVTENA == 1 and DEMCR.TRCENA == 1. - No instruction is
      --  executed, see DWT_CPICNT. - No exception-entry or exception-exit
      --  operation is in progress, see DWT_EXCCNT. - A load-store operation is
      --  in progress. - Either SecureNoninvasiveDebugAllowed() == TRUE, or
      --  NS-Req for the operation is set to Non-secure and
      --  NoninvasiveDebugAllowed() == TRUE.
      LSUCNT        : DWT_LSUCNT_LSUCNT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_LSUCNT_Register use record
      LSUCNT        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_FOLDCNT_FOLDCNT_Field is RP2350.Byte;

   --  Increments on the additional cycles required to execute all load or
   --  store instructions
   type DWT_FOLDCNT_Register is record
      --  Counts on each cycle when all of the following are true: -
      --  DWT_CTRL.FOLDEVTENA == 1 and DEMCR.TRCENA == 1. - At least two
      --  instructions are executed, see DWT_CPICNT. - Either
      --  SecureNoninvasiveDebugAllowed() == TRUE, or the PE is in Non-secure
      --  state and NoninvasiveDebugAllowed() == TRUE. The counter is
      --  incremented by the number of instructions executed, minus one
      FOLDCNT       : DWT_FOLDCNT_FOLDCNT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_FOLDCNT_Register use record
      FOLDCNT       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_FUNCTION_MATCH_Field is RP2350.UInt4;
   subtype DWT_FUNCTION_ACTION_Field is RP2350.UInt2;
   subtype DWT_FUNCTION_DATAVSIZE_Field is RP2350.UInt2;
   subtype DWT_FUNCTION_MATCHED_Field is RP2350.Bit;
   subtype DWT_FUNCTION_ID_Field is RP2350.UInt5;

   --  Controls the operation of watchpoint comparator 0
   type DWT_FUNCTION_Register is record
      --  Controls the type of match generated by this comparator
      MATCH          : DWT_FUNCTION_MATCH_Field := 16#0#;
      --  Defines the action on a match. This field is ignored and the
      --  comparator generates no actions if it is disabled by MATCH
      ACTION         : DWT_FUNCTION_ACTION_Field := 16#0#;
      --  unspecified
      Reserved_6_9   : RP2350.UInt4 := 16#0#;
      --  Defines the size of the object being watched for by Data Value and
      --  Data Address comparators
      DATAVSIZE      : DWT_FUNCTION_DATAVSIZE_Field := 16#0#;
      --  unspecified
      Reserved_12_23 : RP2350.UInt12 := 16#0#;
      --  Read-only. Set to 1 when the comparator matches
      MATCHED        : DWT_FUNCTION_MATCHED_Field := 16#0#;
      --  unspecified
      Reserved_25_26 : RP2350.UInt2 := 16#0#;
      --  Read-only. Identifies the capabilities for MATCH for comparator *n
      ID             : DWT_FUNCTION_ID_Field := 16#B#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_FUNCTION_Register use record
      MATCH          at 0 range 0 .. 3;
      ACTION         at 0 range 4 .. 5;
      Reserved_6_9   at 0 range 6 .. 9;
      DATAVSIZE      at 0 range 10 .. 11;
      Reserved_12_23 at 0 range 12 .. 23;
      MATCHED        at 0 range 24 .. 24;
      Reserved_25_26 at 0 range 25 .. 26;
      ID             at 0 range 27 .. 31;
   end record;

   subtype DWT_DEVARCH_ARCHPART_Field is RP2350.UInt12;
   subtype DWT_DEVARCH_ARCHVER_Field is RP2350.UInt4;
   subtype DWT_DEVARCH_REVISION_Field is RP2350.UInt4;
   subtype DWT_DEVARCH_PRESENT_Field is RP2350.Bit;
   subtype DWT_DEVARCH_ARCHITECT_Field is RP2350.UInt11;

   --  Provides CoreSight discovery information for the DWT
   type DWT_DEVARCH_Register is record
      --  Read-only. Defines the architecture of the component
      ARCHPART  : DWT_DEVARCH_ARCHPART_Field;
      --  Read-only. Defines the architecture version of the component
      ARCHVER   : DWT_DEVARCH_ARCHVER_Field;
      --  Read-only. Defines the architecture revision of the component
      REVISION  : DWT_DEVARCH_REVISION_Field;
      --  Read-only. Defines that the DEVARCH register is present
      PRESENT   : DWT_DEVARCH_PRESENT_Field;
      --  Read-only. Defines the architect of the component. Bits [31:28] are
      --  the JEP106 continuation code (JEP106 bank ID, minus 1) and bits
      --  [27:21] are the JEP106 ID code.
      ARCHITECT : DWT_DEVARCH_ARCHITECT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_DEVARCH_Register use record
      ARCHPART  at 0 range 0 .. 11;
      ARCHVER   at 0 range 12 .. 15;
      REVISION  at 0 range 16 .. 19;
      PRESENT   at 0 range 20 .. 20;
      ARCHITECT at 0 range 21 .. 31;
   end record;

   subtype DWT_DEVTYPE_MAJOR_Field is RP2350.UInt4;
   subtype DWT_DEVTYPE_SUB_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the DWT
   type DWT_DEVTYPE_Register is record
      --  Read-only. Component major type
      MAJOR         : DWT_DEVTYPE_MAJOR_Field;
      --  Read-only. Component sub-type
      SUB           : DWT_DEVTYPE_SUB_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_DEVTYPE_Register use record
      MAJOR         at 0 range 0 .. 3;
      SUB           at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_PIDR4_DES_2_Field is RP2350.UInt4;
   subtype DWT_PIDR4_SIZE_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the DWT
   type DWT_PIDR4_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_2         : DWT_PIDR4_DES_2_Field;
      --  Read-only. See CoreSight Architecture Specification
      SIZE          : DWT_PIDR4_SIZE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_PIDR4_Register use record
      DES_2         at 0 range 0 .. 3;
      SIZE          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_PIDR0_PART_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the DWT
   type DWT_PIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_0        : DWT_PIDR0_PART_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_PIDR0_Register use record
      PART_0        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_PIDR1_PART_1_Field is RP2350.UInt4;
   subtype DWT_PIDR1_DES_0_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the DWT
   type DWT_PIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_1        : DWT_PIDR1_PART_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      DES_0         : DWT_PIDR1_DES_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_PIDR1_Register use record
      PART_1        at 0 range 0 .. 3;
      DES_0         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_PIDR2_DES_1_Field is RP2350.UInt3;
   subtype DWT_PIDR2_JEDEC_Field is RP2350.Bit;
   subtype DWT_PIDR2_REVISION_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the DWT
   type DWT_PIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_1         : DWT_PIDR2_DES_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      JEDEC         : DWT_PIDR2_JEDEC_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVISION      : DWT_PIDR2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_PIDR2_Register use record
      DES_1         at 0 range 0 .. 2;
      JEDEC         at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_PIDR3_CMOD_Field is RP2350.UInt4;
   subtype DWT_PIDR3_REVAND_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the DWT
   type DWT_PIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      CMOD          : DWT_PIDR3_CMOD_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVAND        : DWT_PIDR3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_PIDR3_Register use record
      CMOD          at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_CIDR0_PRMBL_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the DWT
   type DWT_CIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_0       : DWT_CIDR0_PRMBL_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_CIDR0_Register use record
      PRMBL_0       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_CIDR1_PRMBL_1_Field is RP2350.UInt4;
   subtype DWT_CIDR1_CLASS_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the DWT
   type DWT_CIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_1       : DWT_CIDR1_PRMBL_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      CLASS         : DWT_CIDR1_CLASS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_CIDR1_Register use record
      PRMBL_1       at 0 range 0 .. 3;
      CLASS         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_CIDR2_PRMBL_2_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the DWT
   type DWT_CIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_2       : DWT_CIDR2_PRMBL_2_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_CIDR2_Register use record
      PRMBL_2       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DWT_CIDR3_PRMBL_3_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the DWT
   type DWT_CIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_3       : DWT_CIDR3_PRMBL_3_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DWT_CIDR3_Register use record
      PRMBL_3       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_CTRL_ENABLE_Field is RP2350.Bit;
   subtype FP_CTRL_KEY_Field is RP2350.Bit;
   subtype FP_CTRL_NUM_CODE_7_4_Field is RP2350.UInt4;
   subtype FP_CTRL_NUM_LIT_Field is RP2350.UInt4;
   subtype FP_CTRL_NUM_CODE_14_12_Field is RP2350.UInt3;
   subtype FP_CTRL_REV_Field is RP2350.UInt4;

   --  Provides FPB implementation information, and the global enable for the
   --  FPB unit
   type FP_CTRL_Register is record
      --  Enables the FPB
      ENABLE         : FP_CTRL_ENABLE_Field := 16#0#;
      --  Writes to the FP_CTRL are ignored unless KEY is concurrently written
      --  to one
      KEY            : FP_CTRL_KEY_Field := 16#0#;
      --  unspecified
      Reserved_2_3   : RP2350.UInt2 := 16#0#;
      --  Read-only. Indicates the number of implemented instruction address
      --  comparators. Zero indicates no Instruction Address comparators are
      --  implemented. The Instruction Address comparators are numbered from 0
      --  to NUM_CODE - 1
      NUM_CODE_7_4   : FP_CTRL_NUM_CODE_7_4_Field := 16#8#;
      --  Read-only. Indicates the number of implemented literal address
      --  comparators. The Literal Address comparators are numbered from
      --  NUM_CODE to NUM_CODE + NUM_LIT - 1
      NUM_LIT        : FP_CTRL_NUM_LIT_Field := 16#5#;
      --  Read-only. Indicates the number of implemented instruction address
      --  comparators. Zero indicates no Instruction Address comparators are
      --  implemented. The Instruction Address comparators are numbered from 0
      --  to NUM_CODE - 1
      NUM_CODE_14_12 : FP_CTRL_NUM_CODE_14_12_Field := 16#5#;
      --  unspecified
      Reserved_15_27 : RP2350.UInt13 := 16#0#;
      --  Read-only. Flash Patch and Breakpoint Unit architecture revision
      REV            : FP_CTRL_REV_Field := 16#6#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_CTRL_Register use record
      ENABLE         at 0 range 0 .. 0;
      KEY            at 0 range 1 .. 1;
      Reserved_2_3   at 0 range 2 .. 3;
      NUM_CODE_7_4   at 0 range 4 .. 7;
      NUM_LIT        at 0 range 8 .. 11;
      NUM_CODE_14_12 at 0 range 12 .. 14;
      Reserved_15_27 at 0 range 15 .. 27;
      REV            at 0 range 28 .. 31;
   end record;

   subtype FP_REMAP_REMAP_Field is RP2350.UInt24;
   subtype FP_REMAP_RMPSPT_Field is RP2350.Bit;

   --  Indicates whether the implementation supports Flash Patch remap and, if
   --  it does, holds the target address for remap
   type FP_REMAP_Register is record
      --  unspecified
      Reserved_0_4   : RP2350.UInt5;
      --  Read-only. Holds the bits[28:5] of the Flash Patch remap address
      REMAP          : FP_REMAP_REMAP_Field;
      --  Read-only. Indicates whether the FPB unit supports the Flash Patch
      --  remap function
      RMPSPT         : FP_REMAP_RMPSPT_Field;
      --  unspecified
      Reserved_30_31 : RP2350.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_REMAP_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      REMAP          at 0 range 5 .. 28;
      RMPSPT         at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype FP_COMP_BE_Field is RP2350.Bit;

   --  Holds an address for comparison. The effect of the match depends on the
   --  configuration of the FPB and whether the comparator is an instruction
   --  address comparator or a literal address comparator
   type FP_COMP_Register is record
      --  Selects between flashpatch and breakpoint functionality
      BE            : FP_COMP_BE_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : RP2350.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_COMP_Register use record
      BE            at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype FP_DEVARCH_ARCHPART_Field is RP2350.UInt12;
   subtype FP_DEVARCH_ARCHVER_Field is RP2350.UInt4;
   subtype FP_DEVARCH_REVISION_Field is RP2350.UInt4;
   subtype FP_DEVARCH_PRESENT_Field is RP2350.Bit;
   subtype FP_DEVARCH_ARCHITECT_Field is RP2350.UInt11;

   --  Provides CoreSight discovery information for the FPB
   type FP_DEVARCH_Register is record
      --  Read-only. Defines the architecture of the component
      ARCHPART  : FP_DEVARCH_ARCHPART_Field;
      --  Read-only. Defines the architecture version of the component
      ARCHVER   : FP_DEVARCH_ARCHVER_Field;
      --  Read-only. Defines the architecture revision of the component
      REVISION  : FP_DEVARCH_REVISION_Field;
      --  Read-only. Defines that the DEVARCH register is present
      PRESENT   : FP_DEVARCH_PRESENT_Field;
      --  Read-only. Defines the architect of the component. Bits [31:28] are
      --  the JEP106 continuation code (JEP106 bank ID, minus 1) and bits
      --  [27:21] are the JEP106 ID code.
      ARCHITECT : FP_DEVARCH_ARCHITECT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_DEVARCH_Register use record
      ARCHPART  at 0 range 0 .. 11;
      ARCHVER   at 0 range 12 .. 15;
      REVISION  at 0 range 16 .. 19;
      PRESENT   at 0 range 20 .. 20;
      ARCHITECT at 0 range 21 .. 31;
   end record;

   subtype FP_DEVTYPE_MAJOR_Field is RP2350.UInt4;
   subtype FP_DEVTYPE_SUB_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the FPB
   type FP_DEVTYPE_Register is record
      --  Read-only. Component major type
      MAJOR         : FP_DEVTYPE_MAJOR_Field;
      --  Read-only. Component sub-type
      SUB           : FP_DEVTYPE_SUB_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_DEVTYPE_Register use record
      MAJOR         at 0 range 0 .. 3;
      SUB           at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_PIDR4_DES_2_Field is RP2350.UInt4;
   subtype FP_PIDR4_SIZE_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the FP
   type FP_PIDR4_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_2         : FP_PIDR4_DES_2_Field;
      --  Read-only. See CoreSight Architecture Specification
      SIZE          : FP_PIDR4_SIZE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_PIDR4_Register use record
      DES_2         at 0 range 0 .. 3;
      SIZE          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_PIDR0_PART_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the FP
   type FP_PIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_0        : FP_PIDR0_PART_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_PIDR0_Register use record
      PART_0        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_PIDR1_PART_1_Field is RP2350.UInt4;
   subtype FP_PIDR1_DES_0_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the FP
   type FP_PIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_1        : FP_PIDR1_PART_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      DES_0         : FP_PIDR1_DES_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_PIDR1_Register use record
      PART_1        at 0 range 0 .. 3;
      DES_0         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_PIDR2_DES_1_Field is RP2350.UInt3;
   subtype FP_PIDR2_JEDEC_Field is RP2350.Bit;
   subtype FP_PIDR2_REVISION_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the FP
   type FP_PIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_1         : FP_PIDR2_DES_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      JEDEC         : FP_PIDR2_JEDEC_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVISION      : FP_PIDR2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_PIDR2_Register use record
      DES_1         at 0 range 0 .. 2;
      JEDEC         at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_PIDR3_CMOD_Field is RP2350.UInt4;
   subtype FP_PIDR3_REVAND_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the FP
   type FP_PIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      CMOD          : FP_PIDR3_CMOD_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVAND        : FP_PIDR3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_PIDR3_Register use record
      CMOD          at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_CIDR0_PRMBL_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the FP
   type FP_CIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_0       : FP_CIDR0_PRMBL_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_CIDR0_Register use record
      PRMBL_0       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_CIDR1_PRMBL_1_Field is RP2350.UInt4;
   subtype FP_CIDR1_CLASS_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the FP
   type FP_CIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_1       : FP_CIDR1_PRMBL_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      CLASS         : FP_CIDR1_CLASS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_CIDR1_Register use record
      PRMBL_1       at 0 range 0 .. 3;
      CLASS         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_CIDR2_PRMBL_2_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the FP
   type FP_CIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_2       : FP_CIDR2_PRMBL_2_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_CIDR2_Register use record
      PRMBL_2       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype FP_CIDR3_PRMBL_3_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the FP
   type FP_CIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_3       : FP_CIDR3_PRMBL_3_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FP_CIDR3_Register use record
      PRMBL_3       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ICTR_INTLINESNUM_Field is RP2350.UInt4;

   --  Provides information about the interrupt controller
   type ICTR_Register is record
      --  Read-only. Indicates the number of the highest implemented register
      --  in each of the NVIC control register sets, or in the case of
      --  NVIC_IPR*n, 4×INTLINESNUM
      INTLINESNUM   : ICTR_INTLINESNUM_Field;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICTR_Register use record
      INTLINESNUM   at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ACTLR_DISMCYCINT_Field is RP2350.Bit;
   subtype ACTLR_DISFOLD_Field is RP2350.Bit;
   subtype ACTLR_DISOOFP_Field is RP2350.Bit;
   subtype ACTLR_FPEXCODIS_Field is RP2350.Bit;
   subtype ACTLR_DISITMATBFLUSH_Field is RP2350.Bit;
   subtype ACTLR_EXTEXCLALL_Field is RP2350.Bit;

   --  Provides IMPLEMENTATION DEFINED configuration and control options
   type ACTLR_Register is record
      --  Disable dual-issue.
      DISMCYCINT     : ACTLR_DISMCYCINT_Field := 16#0#;
      --  unspecified
      Reserved_1_1   : RP2350.Bit := 16#0#;
      --  Disable dual-issue.
      DISFOLD        : ACTLR_DISFOLD_Field := 16#0#;
      --  unspecified
      Reserved_3_8   : RP2350.UInt6 := 16#0#;
      --  Disable out-of-order FP instruction completion
      DISOOFP        : ACTLR_DISOOFP_Field := 16#0#;
      --  Disable FPU exception outputs
      FPEXCODIS      : ACTLR_FPEXCODIS_Field := 16#0#;
      --  unspecified
      Reserved_11_11 : RP2350.Bit := 16#0#;
      --  Disable ATB Flush
      DISITMATBFLUSH : ACTLR_DISITMATBFLUSH_Field := 16#0#;
      --  unspecified
      Reserved_13_28 : RP2350.UInt16 := 16#0#;
      --  External Exclusives Allowed with no MPU
      EXTEXCLALL     : ACTLR_EXTEXCLALL_Field := 16#0#;
      --  unspecified
      Reserved_30_31 : RP2350.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ACTLR_Register use record
      DISMCYCINT     at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      DISFOLD        at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      DISOOFP        at 0 range 9 .. 9;
      FPEXCODIS      at 0 range 10 .. 10;
      Reserved_11_11 at 0 range 11 .. 11;
      DISITMATBFLUSH at 0 range 12 .. 12;
      Reserved_13_28 at 0 range 13 .. 28;
      EXTEXCLALL     at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype SYST_CSR_ENABLE_Field is RP2350.Bit;
   subtype SYST_CSR_TICKINT_Field is RP2350.Bit;
   subtype SYST_CSR_CLKSOURCE_Field is RP2350.Bit;
   subtype SYST_CSR_COUNTFLAG_Field is RP2350.Bit;

   --  Use the SysTick Control and Status Register to enable the SysTick
   --  features.
   type SYST_CSR_Register is record
      --  Enable SysTick counter: 0 = Counter disabled. 1 = Counter enabled.
      ENABLE         : SYST_CSR_ENABLE_Field := 16#0#;
      --  Enables SysTick exception request: 0 = Counting down to zero does not
      --  assert the SysTick exception request. 1 = Counting down to zero to
      --  asserts the SysTick exception request.
      TICKINT        : SYST_CSR_TICKINT_Field := 16#0#;
      --  SysTick clock source. Always reads as one if SYST_CALIB reports
      --  NOREF. Selects the SysTick timer clock source: 0 = External reference
      --  clock. 1 = Processor clock.
      CLKSOURCE      : SYST_CSR_CLKSOURCE_Field := 16#0#;
      --  unspecified
      Reserved_3_15  : RP2350.UInt13 := 16#0#;
      --  Read-only. Returns 1 if timer counted to 0 since last time this was
      --  read. Clears on read by application or debugger.
      COUNTFLAG      : SYST_CSR_COUNTFLAG_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : RP2350.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_CSR_Register use record
      ENABLE         at 0 range 0 .. 0;
      TICKINT        at 0 range 1 .. 1;
      CLKSOURCE      at 0 range 2 .. 2;
      Reserved_3_15  at 0 range 3 .. 15;
      COUNTFLAG      at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype SYST_RVR_RELOAD_Field is RP2350.UInt24;

   --  Use the SysTick Reload Value Register to specify the start value to load
   --  into the current value register when the counter reaches 0. It can be
   --  any value between 0 and 0x00FFFFFF. A start value of 0 is possible, but
   --  has no effect because the SysTick interrupt and COUNTFLAG are activated
   --  when counting from 1 to 0. The reset value of this register is UNKNOWN.
   --  To generate a multi-shot timer with a period of N processor clock
   --  cycles, use a RELOAD value of N-1. For example, if the SysTick interrupt
   --  is required every 100 clock pulses, set RELOAD to 99.
   type SYST_RVR_Register is record
      --  Value to load into the SysTick Current Value Register when the
      --  counter reaches 0.
      RELOAD         : SYST_RVR_RELOAD_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : RP2350.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_RVR_Register use record
      RELOAD         at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SYST_CVR_CURRENT_Field is RP2350.UInt24;

   --  Use the SysTick Current Value Register to find the current value in the
   --  register. The reset value of this register is UNKNOWN.
   type SYST_CVR_Register is record
      --  Reads return the current value of the SysTick counter. This register
      --  is write-clear. Writing to it with any value clears the register to
      --  0. Clearing this register also clears the COUNTFLAG bit of the
      --  SysTick Control and Status Register.
      CURRENT        : SYST_CVR_CURRENT_Field := 16#0#;
      --  unspecified
      Reserved_24_31 : RP2350.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_CVR_Register use record
      CURRENT        at 0 range 0 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SYST_CALIB_TENMS_Field is RP2350.UInt24;
   subtype SYST_CALIB_SKEW_Field is RP2350.Bit;
   subtype SYST_CALIB_NOREF_Field is RP2350.Bit;

   --  Use the SysTick Calibration Value Register to enable software to scale
   --  to any required speed using divide and multiply.
   type SYST_CALIB_Register is record
      --  Read-only. An optional Reload value to be used for 10ms (100Hz)
      --  timing, subject to system clock skew errors. If the value reads as 0,
      --  the calibration value is not known.
      TENMS          : SYST_CALIB_TENMS_Field;
      --  unspecified
      Reserved_24_29 : RP2350.UInt6;
      --  Read-only. If reads as 1, the calibration value for 10ms is inexact
      --  (due to clock frequency).
      SKEW           : SYST_CALIB_SKEW_Field;
      --  Read-only. If reads as 1, the Reference clock is not provided - the
      --  CLKSOURCE bit of the SysTick Control and Status register will be
      --  forced to 1 and cannot be cleared to 0.
      NOREF          : SYST_CALIB_NOREF_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SYST_CALIB_Register use record
      TENMS          at 0 range 0 .. 23;
      Reserved_24_29 at 0 range 24 .. 29;
      SKEW           at 0 range 30 .. 30;
      NOREF          at 0 range 31 .. 31;
   end record;

   subtype NVIC_IPR_PRI_N0_Field is RP2350.UInt4;
   subtype NVIC_IPR_PRI_N1_Field is RP2350.UInt4;
   subtype NVIC_IPR_PRI_N2_Field is RP2350.UInt4;
   subtype NVIC_IPR_PRI_N3_Field is RP2350.UInt4;

   --  Sets or reads interrupt priorities
   type NVIC_IPR_Register is record
      --  unspecified
      Reserved_0_3   : RP2350.UInt4 := 16#0#;
      --  For register NVIC_IPRn, the priority of interrupt number 4*n+0, or
      --  RES0 if the PE does not implement this interrupt
      PRI_N0         : NVIC_IPR_PRI_N0_Field := 16#0#;
      --  unspecified
      Reserved_8_11  : RP2350.UInt4 := 16#0#;
      --  For register NVIC_IPRn, the priority of interrupt number 4*n+1, or
      --  RES0 if the PE does not implement this interrupt
      PRI_N1         : NVIC_IPR_PRI_N1_Field := 16#0#;
      --  unspecified
      Reserved_16_19 : RP2350.UInt4 := 16#0#;
      --  For register NVIC_IPRn, the priority of interrupt number 4*n+2, or
      --  RES0 if the PE does not implement this interrupt
      PRI_N2         : NVIC_IPR_PRI_N2_Field := 16#0#;
      --  unspecified
      Reserved_24_27 : RP2350.UInt4 := 16#0#;
      --  For register NVIC_IPRn, the priority of interrupt number 4*n+3, or
      --  RES0 if the PE does not implement this interrupt
      PRI_N3         : NVIC_IPR_PRI_N3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NVIC_IPR_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      PRI_N0         at 0 range 4 .. 7;
      Reserved_8_11  at 0 range 8 .. 11;
      PRI_N1         at 0 range 12 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      PRI_N2         at 0 range 20 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      PRI_N3         at 0 range 28 .. 31;
   end record;

   subtype CPUID_REVISION_Field is RP2350.UInt4;
   subtype CPUID_PARTNO_Field is RP2350.UInt12;
   subtype CPUID_ARCHITECTURE_Field is RP2350.UInt4;
   subtype CPUID_VARIANT_Field is RP2350.UInt4;
   subtype CPUID_IMPLEMENTER_Field is RP2350.Byte;

   --  Provides identification information for the PE, including an implementer
   --  code for the device and a device ID number
   type CPUID_Register is record
      --  Read-only. IMPLEMENTATION DEFINED revision number for the device
      REVISION     : CPUID_REVISION_Field;
      --  Read-only. IMPLEMENTATION DEFINED primary part number for the device
      PARTNO       : CPUID_PARTNO_Field;
      --  Read-only. Defines the Architecture implemented by the PE
      ARCHITECTURE : CPUID_ARCHITECTURE_Field;
      --  Read-only. IMPLEMENTATION DEFINED variant number. Typically, this
      --  field is used to distinguish between different product variants, or
      --  major revisions of a product
      VARIANT      : CPUID_VARIANT_Field;
      --  Read-only. This field must hold an implementer code that has been
      --  assigned by ARM
      IMPLEMENTER  : CPUID_IMPLEMENTER_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CPUID_Register use record
      REVISION     at 0 range 0 .. 3;
      PARTNO       at 0 range 4 .. 15;
      ARCHITECTURE at 0 range 16 .. 19;
      VARIANT      at 0 range 20 .. 23;
      IMPLEMENTER  at 0 range 24 .. 31;
   end record;

   subtype ICSR_VECTACTIVE_Field is RP2350.UInt9;
   subtype ICSR_RETTOBASE_Field is RP2350.Bit;
   subtype ICSR_VECTPENDING_Field is RP2350.UInt9;
   subtype ICSR_ISRPENDING_Field is RP2350.Bit;
   subtype ICSR_ISRPREEMPT_Field is RP2350.Bit;
   subtype ICSR_STTNS_Field is RP2350.Bit;
   subtype ICSR_PENDSTCLR_Field is RP2350.Bit;
   subtype ICSR_PENDSTSET_Field is RP2350.Bit;
   subtype ICSR_PENDSVCLR_Field is RP2350.Bit;
   subtype ICSR_PENDSVSET_Field is RP2350.Bit;
   subtype ICSR_PENDNMICLR_Field is RP2350.Bit;
   subtype ICSR_PENDNMISET_Field is RP2350.Bit;

   --  Controls and provides status information for NMI, PendSV, SysTick and
   --  interrupts
   type ICSR_Register is record
      --  Read-only. The exception number of the current executing exception
      VECTACTIVE     : ICSR_VECTACTIVE_Field := 16#0#;
      --  unspecified
      Reserved_9_10  : RP2350.UInt2 := 16#0#;
      --  Read-only. In Handler mode, indicates whether there is more than one
      --  active exception
      RETTOBASE      : ICSR_RETTOBASE_Field := 16#0#;
      --  Read-only. The exception number of the highest priority pending and
      --  enabled interrupt
      VECTPENDING    : ICSR_VECTPENDING_Field := 16#0#;
      --  unspecified
      Reserved_21_21 : RP2350.Bit := 16#0#;
      --  Read-only. Indicates whether an external interrupt, generated by the
      --  NVIC, is pending
      ISRPENDING     : ICSR_ISRPENDING_Field := 16#0#;
      --  Read-only. Indicates whether a pending exception will be serviced on
      --  exit from debug halt state
      ISRPREEMPT     : ICSR_ISRPREEMPT_Field := 16#0#;
      --  Controls whether in a single SysTick implementation, the SysTick is
      --  Secure or Non-secure
      STTNS          : ICSR_STTNS_Field := 16#0#;
      --  Allows the SysTick exception pend state to be cleared `FTSSS
      PENDSTCLR      : ICSR_PENDSTCLR_Field := 16#0#;
      --  Read-only. Indicates whether the SysTick `FTSSS exception is pending
      PENDSTSET      : ICSR_PENDSTSET_Field := 16#0#;
      --  Allows the PendSV exception pend state to be cleared `FTSSS
      PENDSVCLR      : ICSR_PENDSVCLR_Field := 16#0#;
      --  Read-only. Indicates whether the PendSV `FTSSS exception is pending
      PENDSVSET      : ICSR_PENDSVSET_Field := 16#0#;
      --  unspecified
      Reserved_29_29 : RP2350.Bit := 16#0#;
      --  Allows the NMI exception pend state to be cleared
      PENDNMICLR     : ICSR_PENDNMICLR_Field := 16#0#;
      --  Read-only. Indicates whether the NMI exception is pending
      PENDNMISET     : ICSR_PENDNMISET_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ICSR_Register use record
      VECTACTIVE     at 0 range 0 .. 8;
      Reserved_9_10  at 0 range 9 .. 10;
      RETTOBASE      at 0 range 11 .. 11;
      VECTPENDING    at 0 range 12 .. 20;
      Reserved_21_21 at 0 range 21 .. 21;
      ISRPENDING     at 0 range 22 .. 22;
      ISRPREEMPT     at 0 range 23 .. 23;
      STTNS          at 0 range 24 .. 24;
      PENDSTCLR      at 0 range 25 .. 25;
      PENDSTSET      at 0 range 26 .. 26;
      PENDSVCLR      at 0 range 27 .. 27;
      PENDSVSET      at 0 range 28 .. 28;
      Reserved_29_29 at 0 range 29 .. 29;
      PENDNMICLR     at 0 range 30 .. 30;
      PENDNMISET     at 0 range 31 .. 31;
   end record;

   subtype VTOR_TBLOFF_Field is RP2350.UInt25;

   --  The VTOR indicates the offset of the vector table base address from
   --  memory address 0x00000000.
   type VTOR_Register is record
      --  unspecified
      Reserved_0_6 : RP2350.UInt7 := 16#0#;
      --  Vector table base offset field. It contains bits[31:7] of the offset
      --  of the table base from the bottom of the memory map.
      TBLOFF       : VTOR_TBLOFF_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for VTOR_Register use record
      Reserved_0_6 at 0 range 0 .. 6;
      TBLOFF       at 0 range 7 .. 31;
   end record;

   subtype AIRCR_VECTCLRACTIVE_Field is RP2350.Bit;
   subtype AIRCR_SYSRESETREQ_Field is RP2350.Bit;
   subtype AIRCR_SYSRESETREQS_Field is RP2350.Bit;
   subtype AIRCR_PRIGROUP_Field is RP2350.UInt3;
   subtype AIRCR_BFHFNMINS_Field is RP2350.Bit;
   subtype AIRCR_PRIS_Field is RP2350.Bit;
   subtype AIRCR_ENDIANESS_Field is RP2350.Bit;
   subtype AIRCR_VECTKEY_Field is RP2350.UInt16;

   --  Use the Application Interrupt and Reset Control Register to: determine
   --  data endianness, clear all active state information from debug halt
   --  mode, request a system reset.
   type AIRCR_Register is record
      --  unspecified
      Reserved_0_0   : RP2350.Bit := 16#0#;
      --  Clears all active state information for fixed and configurable
      --  exceptions. This bit: is self-clearing, can only be set by the DAP
      --  when the core is halted. When set: clears all active exception status
      --  of the processor, forces a return to Thread mode, forces an IPSR of
      --  0. A debugger must re-initialize the stack.
      VECTCLRACTIVE  : AIRCR_VECTCLRACTIVE_Field := 16#0#;
      --  Writing 1 to this bit causes the SYSRESETREQ signal to the outer
      --  system to be asserted to request a reset. The intention is to force a
      --  large system reset of all major components except for debug. The
      --  C_HALT bit in the DHCSR is cleared as a result of the system reset
      --  requested. The debugger does not lose contact with the device.
      SYSRESETREQ    : AIRCR_SYSRESETREQ_Field := 16#0#;
      --  System reset request, Secure state only. 0	SYSRESETREQ functionality
      --  is available to both Security states. 1 SYSRESETREQ functionality is
      --  only available to Secure state.
      SYSRESETREQS   : AIRCR_SYSRESETREQS_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : RP2350.UInt4 := 16#0#;
      --  Interrupt priority grouping field. This field determines the split of
      --  group priority from subpriority. See
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  
      --  https://developer.arm.com/documentation/100235/0004/the-cortex-m33-peripherals/system-control-block/application-interrupt-and-reset-control-register?lang=en
      PRIGROUP       : AIRCR_PRIGROUP_Field := 16#0#;
      --  unspecified
      Reserved_11_12 : RP2350.UInt2 := 16#0#;
      --  BusFault, HardFault, and NMI Non-secure enable. 0	BusFault,
      --  HardFault, and NMI are Secure. 1	BusFault and NMI are Non-secure and
      --  exceptions can target Non-secure HardFault.
      BFHFNMINS      : AIRCR_BFHFNMINS_Field := 16#0#;
      --  Prioritize Secure exceptions. The value of this bit defines whether
      --  Secure exception priority boosting is enabled. 0	Priority ranges of
      --  Secure and Non-secure exceptions are identical. 1	Non-secure
      --  exceptions are de-prioritized.
      PRIS           : AIRCR_PRIS_Field := 16#0#;
      --  Read-only. Data endianness implemented: 0 = Little-endian.
      ENDIANESS      : AIRCR_ENDIANESS_Field := 16#0#;
      --  Register key: Reads as Unknown On writes, write 0x05FA to VECTKEY,
      --  otherwise the write is ignored.
      VECTKEY        : AIRCR_VECTKEY_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AIRCR_Register use record
      Reserved_0_0   at 0 range 0 .. 0;
      VECTCLRACTIVE  at 0 range 1 .. 1;
      SYSRESETREQ    at 0 range 2 .. 2;
      SYSRESETREQS   at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      PRIGROUP       at 0 range 8 .. 10;
      Reserved_11_12 at 0 range 11 .. 12;
      BFHFNMINS      at 0 range 13 .. 13;
      PRIS           at 0 range 14 .. 14;
      ENDIANESS      at 0 range 15 .. 15;
      VECTKEY        at 0 range 16 .. 31;
   end record;

   subtype SCR_SLEEPONEXIT_Field is RP2350.Bit;
   subtype SCR_SLEEPDEEP_Field is RP2350.Bit;
   subtype SCR_SLEEPDEEPS_Field is RP2350.Bit;
   subtype SCR_SEVONPEND_Field is RP2350.Bit;

   --  System Control Register. Use the System Control Register for
   --  power-management functions: signal to the system when the processor can
   --  enter a low power state, control how the processor enters and exits low
   --  power states.
   type SCR_Register is record
      --  unspecified
      Reserved_0_0  : RP2350.Bit := 16#0#;
      --  Indicates sleep-on-exit when returning from Handler mode to Thread
      --  mode: 0 = Do not sleep when returning to Thread mode. 1 = Enter
      --  sleep, or deep sleep, on return from an ISR to Thread mode. Setting
      --  this bit to 1 enables an interrupt driven application to avoid
      --  returning to an empty main application.
      SLEEPONEXIT   : SCR_SLEEPONEXIT_Field := 16#0#;
      --  Controls whether the processor uses sleep or deep sleep as its low
      --  power mode: 0 = Sleep. 1 = Deep sleep.
      SLEEPDEEP     : SCR_SLEEPDEEP_Field := 16#0#;
      --  0 SLEEPDEEP is available to both security states 1 SLEEPDEEP is only
      --  available to Secure state
      SLEEPDEEPS    : SCR_SLEEPDEEPS_Field := 16#0#;
      --  Send Event on Pending bit: 0 = Only enabled interrupts or events can
      --  wakeup the processor, disabled interrupts are excluded. 1 = Enabled
      --  events and all interrupts, including disabled interrupts, can wakeup
      --  the processor. When an event or interrupt becomes pending, the event
      --  signal wakes up the processor from WFE. If the processor is not
      --  waiting for an event, the event is registered and affects the next
      --  WFE. The processor also wakes up on execution of an SEV instruction
      --  or an external event.
      SEVONPEND     : SCR_SEVONPEND_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : RP2350.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      SLEEPONEXIT   at 0 range 1 .. 1;
      SLEEPDEEP     at 0 range 2 .. 2;
      SLEEPDEEPS    at 0 range 3 .. 3;
      SEVONPEND     at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype CCR_RES1_1_Field is RP2350.Bit;
   subtype CCR_USERSETMPEND_Field is RP2350.Bit;
   subtype CCR_UNALIGN_TRP_Field is RP2350.Bit;
   subtype CCR_DIV_0_TRP_Field is RP2350.Bit;
   subtype CCR_BFHFNMIGN_Field is RP2350.Bit;
   subtype CCR_RES1_Field is RP2350.Bit;
   subtype CCR_STKOFHFNMIGN_Field is RP2350.Bit;
   subtype CCR_DC_Field is RP2350.Bit;
   subtype CCR_IC_Field is RP2350.Bit;
   subtype CCR_BP_Field is RP2350.Bit;

   --  Sets or returns configuration and control data
   type CCR_Register is record
      --  Read-only. Reserved, RES1
      RES1_1         : CCR_RES1_1_Field := 16#1#;
      --  Determines whether unprivileged accesses are permitted to pend
      --  interrupts via the STIR
      USERSETMPEND   : CCR_USERSETMPEND_Field := 16#0#;
      --  unspecified
      Reserved_2_2   : RP2350.Bit := 16#0#;
      --  Controls the trapping of unaligned word or halfword accesses
      UNALIGN_TRP    : CCR_UNALIGN_TRP_Field := 16#0#;
      --  Controls the generation of a DIVBYZERO UsageFault when attempting to
      --  perform integer division by zero
      DIV_0_TRP      : CCR_DIV_0_TRP_Field := 16#0#;
      --  unspecified
      Reserved_5_7   : RP2350.UInt3 := 16#0#;
      --  Determines the effect of precise BusFaults on handlers running at a
      --  requested priority less than 0
      BFHFNMIGN      : CCR_BFHFNMIGN_Field := 16#0#;
      --  Read-only. Reserved, RES1
      RES1           : CCR_RES1_Field := 16#1#;
      --  Controls the effect of a stack limit violation while executing at a
      --  requested priority less than 0
      STKOFHFNMIGN   : CCR_STKOFHFNMIGN_Field := 16#0#;
      --  unspecified
      Reserved_11_15 : RP2350.UInt5 := 16#0#;
      --  Read-only. Enables data caching of all data accesses to Normal memory
      --  `FTSSS
      DC             : CCR_DC_Field := 16#0#;
      --  Read-only. This is a global enable bit for instruction caches in the
      --  selected Security state
      IC             : CCR_IC_Field := 16#0#;
      --  Read-only. Enables program flow prediction `FTSSS
      BP             : CCR_BP_Field := 16#0#;
      --  unspecified
      Reserved_19_31 : RP2350.UInt13 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR_Register use record
      RES1_1         at 0 range 0 .. 0;
      USERSETMPEND   at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      UNALIGN_TRP    at 0 range 3 .. 3;
      DIV_0_TRP      at 0 range 4 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      BFHFNMIGN      at 0 range 8 .. 8;
      RES1           at 0 range 9 .. 9;
      STKOFHFNMIGN   at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
      DC             at 0 range 16 .. 16;
      IC             at 0 range 17 .. 17;
      BP             at 0 range 18 .. 18;
      Reserved_19_31 at 0 range 19 .. 31;
   end record;

   subtype SHPR1_PRI_4_3_Field is RP2350.UInt3;
   subtype SHPR1_PRI_5_3_Field is RP2350.UInt3;
   subtype SHPR1_PRI_6_3_Field is RP2350.UInt3;
   subtype SHPR1_PRI_7_3_Field is RP2350.UInt3;

   --  Sets or returns priority for system handlers 4 - 7
   type SHPR1_Register is record
      --  unspecified
      Reserved_0_4   : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 4, SecureFault
      PRI_4_3        : SHPR1_PRI_4_3_Field := 16#0#;
      --  unspecified
      Reserved_8_12  : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 5, SecureFault
      PRI_5_3        : SHPR1_PRI_5_3_Field := 16#0#;
      --  unspecified
      Reserved_16_20 : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 6, SecureFault
      PRI_6_3        : SHPR1_PRI_6_3_Field := 16#0#;
      --  unspecified
      Reserved_24_28 : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 7, SecureFault
      PRI_7_3        : SHPR1_PRI_7_3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR1_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      PRI_4_3        at 0 range 5 .. 7;
      Reserved_8_12  at 0 range 8 .. 12;
      PRI_5_3        at 0 range 13 .. 15;
      Reserved_16_20 at 0 range 16 .. 20;
      PRI_6_3        at 0 range 21 .. 23;
      Reserved_24_28 at 0 range 24 .. 28;
      PRI_7_3        at 0 range 29 .. 31;
   end record;

   subtype SHPR2_PRI_8_Field is RP2350.Byte;
   subtype SHPR2_PRI_9_Field is RP2350.Byte;
   subtype SHPR2_PRI_10_Field is RP2350.Byte;
   subtype SHPR2_PRI_11_3_Field is RP2350.UInt3;

   --  Sets or returns priority for system handlers 8 - 11
   type SHPR2_Register is record
      --  Read-only. Reserved, RES0
      PRI_8          : SHPR2_PRI_8_Field := 16#0#;
      --  Read-only. Reserved, RES0
      PRI_9          : SHPR2_PRI_9_Field := 16#0#;
      --  Read-only. Reserved, RES0
      PRI_10         : SHPR2_PRI_10_Field := 16#0#;
      --  unspecified
      Reserved_24_28 : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 11, SecureFault
      PRI_11_3       : SHPR2_PRI_11_3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR2_Register use record
      PRI_8          at 0 range 0 .. 7;
      PRI_9          at 0 range 8 .. 15;
      PRI_10         at 0 range 16 .. 23;
      Reserved_24_28 at 0 range 24 .. 28;
      PRI_11_3       at 0 range 29 .. 31;
   end record;

   subtype SHPR3_PRI_12_3_Field is RP2350.UInt3;
   subtype SHPR3_PRI_13_Field is RP2350.Byte;
   subtype SHPR3_PRI_14_3_Field is RP2350.UInt3;
   subtype SHPR3_PRI_15_3_Field is RP2350.UInt3;

   --  Sets or returns priority for system handlers 12 - 15
   type SHPR3_Register is record
      --  unspecified
      Reserved_0_4   : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 12, SecureFault
      PRI_12_3       : SHPR3_PRI_12_3_Field := 16#0#;
      --  Read-only. Reserved, RES0
      PRI_13         : SHPR3_PRI_13_Field := 16#0#;
      --  unspecified
      Reserved_16_20 : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 14, SecureFault
      PRI_14_3       : SHPR3_PRI_14_3_Field := 16#0#;
      --  unspecified
      Reserved_24_28 : RP2350.UInt5 := 16#0#;
      --  Priority of system handler 15, SecureFault
      PRI_15_3       : SHPR3_PRI_15_3_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHPR3_Register use record
      Reserved_0_4   at 0 range 0 .. 4;
      PRI_12_3       at 0 range 5 .. 7;
      PRI_13         at 0 range 8 .. 15;
      Reserved_16_20 at 0 range 16 .. 20;
      PRI_14_3       at 0 range 21 .. 23;
      Reserved_24_28 at 0 range 24 .. 28;
      PRI_15_3       at 0 range 29 .. 31;
   end record;

   subtype SHCSR_MEMFAULTACT_Field is RP2350.Bit;
   subtype SHCSR_BUSFAULTACT_Field is RP2350.Bit;
   subtype SHCSR_HARDFAULTACT_Field is RP2350.Bit;
   subtype SHCSR_USGFAULTACT_Field is RP2350.Bit;
   subtype SHCSR_SECUREFAULTACT_Field is RP2350.Bit;
   subtype SHCSR_NMIACT_Field is RP2350.Bit;
   subtype SHCSR_SVCALLACT_Field is RP2350.Bit;
   subtype SHCSR_MONITORACT_Field is RP2350.Bit;
   subtype SHCSR_PENDSVACT_Field is RP2350.Bit;
   subtype SHCSR_SYSTICKACT_Field is RP2350.Bit;
   subtype SHCSR_USGFAULTPENDED_Field is RP2350.Bit;
   subtype SHCSR_MEMFAULTPENDED_Field is RP2350.Bit;
   subtype SHCSR_BUSFAULTPENDED_Field is RP2350.Bit;
   subtype SHCSR_SVCALLPENDED_Field is RP2350.Bit;
   subtype SHCSR_MEMFAULTENA_Field is RP2350.Bit;
   subtype SHCSR_BUSFAULTENA_Field is RP2350.Bit;
   subtype SHCSR_USGFAULTENA_Field is RP2350.Bit;
   subtype SHCSR_SECUREFAULTENA_Field is RP2350.Bit;
   subtype SHCSR_SECUREFAULTPENDED_Field is RP2350.Bit;
   subtype SHCSR_HARDFAULTPENDED_Field is RP2350.Bit;

   --  Provides access to the active and pending status of system exceptions
   type SHCSR_Register is record
      --  `IAAMO the active state of the MemManage exception `FTSSS
      MEMFAULTACT       : SHCSR_MEMFAULTACT_Field := 16#0#;
      --  `IAAMO the active state of the BusFault exception
      BUSFAULTACT       : SHCSR_BUSFAULTACT_Field := 16#0#;
      --  Indicates and allows limited modification of the active state of the
      --  HardFault exception `FTSSS
      HARDFAULTACT      : SHCSR_HARDFAULTACT_Field := 16#0#;
      --  `IAAMO the active state of the UsageFault exception `FTSSS
      USGFAULTACT       : SHCSR_USGFAULTACT_Field := 16#0#;
      --  `IAAMO the active state of the SecureFault exception
      SECUREFAULTACT    : SHCSR_SECUREFAULTACT_Field := 16#0#;
      --  `IAAMO the active state of the NMI exception
      NMIACT            : SHCSR_NMIACT_Field := 16#0#;
      --  unspecified
      Reserved_6_6      : RP2350.Bit := 16#0#;
      --  `IAAMO the active state of the SVCall exception `FTSSS
      SVCALLACT         : SHCSR_SVCALLACT_Field := 16#0#;
      --  `IAAMO the active state of the DebugMonitor exception
      MONITORACT        : SHCSR_MONITORACT_Field := 16#0#;
      --  unspecified
      Reserved_9_9      : RP2350.Bit := 16#0#;
      --  `IAAMO the active state of the PendSV exception `FTSSS
      PENDSVACT         : SHCSR_PENDSVACT_Field := 16#0#;
      --  `IAAMO the active state of the SysTick exception `FTSSS
      SYSTICKACT        : SHCSR_SYSTICKACT_Field := 16#0#;
      --  The UsageFault exception is banked between Security states, `IAAMO
      --  the pending state of the UsageFault exception `FTSSS
      USGFAULTPENDED    : SHCSR_USGFAULTPENDED_Field := 16#0#;
      --  `IAAMO the pending state of the MemManage exception `FTSSS
      MEMFAULTPENDED    : SHCSR_MEMFAULTPENDED_Field := 16#0#;
      --  `IAAMO the pending state of the BusFault exception
      BUSFAULTPENDED    : SHCSR_BUSFAULTPENDED_Field := 16#0#;
      --  `IAAMO the pending state of the SVCall exception `FTSSS
      SVCALLPENDED      : SHCSR_SVCALLPENDED_Field := 16#0#;
      --  `DW the MemManage exception is enabled `FTSSS
      MEMFAULTENA       : SHCSR_MEMFAULTENA_Field := 16#0#;
      --  `DW the BusFault exception is enabled
      BUSFAULTENA       : SHCSR_BUSFAULTENA_Field := 16#0#;
      --  `DW the UsageFault exception is enabled `FTSSS
      USGFAULTENA       : SHCSR_USGFAULTENA_Field := 16#0#;
      --  `DW the SecureFault exception is enabled
      SECUREFAULTENA    : SHCSR_SECUREFAULTENA_Field := 16#0#;
      --  `IAAMO the pending state of the SecureFault exception
      SECUREFAULTPENDED : SHCSR_SECUREFAULTPENDED_Field := 16#0#;
      --  `IAAMO the pending state of the HardFault exception `CTTSSS
      HARDFAULTPENDED   : SHCSR_HARDFAULTPENDED_Field := 16#0#;
      --  unspecified
      Reserved_22_31    : RP2350.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SHCSR_Register use record
      MEMFAULTACT       at 0 range 0 .. 0;
      BUSFAULTACT       at 0 range 1 .. 1;
      HARDFAULTACT      at 0 range 2 .. 2;
      USGFAULTACT       at 0 range 3 .. 3;
      SECUREFAULTACT    at 0 range 4 .. 4;
      NMIACT            at 0 range 5 .. 5;
      Reserved_6_6      at 0 range 6 .. 6;
      SVCALLACT         at 0 range 7 .. 7;
      MONITORACT        at 0 range 8 .. 8;
      Reserved_9_9      at 0 range 9 .. 9;
      PENDSVACT         at 0 range 10 .. 10;
      SYSTICKACT        at 0 range 11 .. 11;
      USGFAULTPENDED    at 0 range 12 .. 12;
      MEMFAULTPENDED    at 0 range 13 .. 13;
      BUSFAULTPENDED    at 0 range 14 .. 14;
      SVCALLPENDED      at 0 range 15 .. 15;
      MEMFAULTENA       at 0 range 16 .. 16;
      BUSFAULTENA       at 0 range 17 .. 17;
      USGFAULTENA       at 0 range 18 .. 18;
      SECUREFAULTENA    at 0 range 19 .. 19;
      SECUREFAULTPENDED at 0 range 20 .. 20;
      HARDFAULTPENDED   at 0 range 21 .. 21;
      Reserved_22_31    at 0 range 22 .. 31;
   end record;

   subtype CFSR_MMFSR_Field is RP2350.Byte;
   subtype CFSR_BFSR_IBUSERR_Field is RP2350.Bit;
   subtype CFSR_BFSR_PRECISERR_Field is RP2350.Bit;
   subtype CFSR_BFSR_IMPRECISERR_Field is RP2350.Bit;
   subtype CFSR_BFSR_UNSTKERR_Field is RP2350.Bit;
   subtype CFSR_BFSR_STKERR_Field is RP2350.Bit;
   subtype CFSR_BFSR_LSPERR_Field is RP2350.Bit;
   subtype CFSR_BFSR_BFARVALID_Field is RP2350.Bit;
   subtype CFSR_UFSR_UNDEFINSTR_Field is RP2350.Bit;
   subtype CFSR_UFSR_INVSTATE_Field is RP2350.Bit;
   subtype CFSR_UFSR_INVPC_Field is RP2350.Bit;
   subtype CFSR_UFSR_NOCP_Field is RP2350.Bit;
   subtype CFSR_UFSR_STKOF_Field is RP2350.Bit;
   subtype CFSR_UFSR_UNALIGNED_Field is RP2350.Bit;
   subtype CFSR_UFSR_DIVBYZERO_Field is RP2350.Bit;

   --  Contains the three Configurable Fault Status Registers. 31:16 UFSR:
   --  Provides information on UsageFault exceptions 15:8 BFSR: Provides
   --  information on BusFault exceptions 7:0 MMFSR: Provides information on
   --  MemManage exceptions
   type CFSR_Register is record
      --  Provides information on MemManage exceptions
      MMFSR            : CFSR_MMFSR_Field := 16#0#;
      --  Records whether a BusFault on an instruction prefetch has occurred
      BFSR_IBUSERR     : CFSR_BFSR_IBUSERR_Field := 16#0#;
      --  Records whether a precise data access error has occurred
      BFSR_PRECISERR   : CFSR_BFSR_PRECISERR_Field := 16#0#;
      --  Records whether an imprecise data access error has occurred
      BFSR_IMPRECISERR : CFSR_BFSR_IMPRECISERR_Field := 16#0#;
      --  Records whether a derived BusFault occurred during exception return
      --  unstacking
      BFSR_UNSTKERR    : CFSR_BFSR_UNSTKERR_Field := 16#0#;
      --  Records whether a derived BusFault occurred during exception entry
      --  stacking
      BFSR_STKERR      : CFSR_BFSR_STKERR_Field := 16#0#;
      --  Records whether a BusFault occurred during FP lazy state preservation
      BFSR_LSPERR      : CFSR_BFSR_LSPERR_Field := 16#0#;
      --  unspecified
      Reserved_14_14   : RP2350.Bit := 16#0#;
      --  Indicates validity of the contents of the BFAR register
      BFSR_BFARVALID   : CFSR_BFSR_BFARVALID_Field := 16#0#;
      --  Sticky flag indicating whether an undefined instruction error has
      --  occurred
      UFSR_UNDEFINSTR  : CFSR_UFSR_UNDEFINSTR_Field := 16#0#;
      --  Sticky flag indicating whether an EPSR.T or EPSR.IT validity error
      --  has occurred
      UFSR_INVSTATE    : CFSR_UFSR_INVSTATE_Field := 16#0#;
      --  Sticky flag indicating whether an integrity check error has occurred
      UFSR_INVPC       : CFSR_UFSR_INVPC_Field := 16#0#;
      --  Sticky flag indicating whether a coprocessor disabled or not present
      --  error has occurred
      UFSR_NOCP        : CFSR_UFSR_NOCP_Field := 16#0#;
      --  Sticky flag indicating whether a stack overflow error has occurred
      UFSR_STKOF       : CFSR_UFSR_STKOF_Field := 16#0#;
      --  unspecified
      Reserved_21_23   : RP2350.UInt3 := 16#0#;
      --  Sticky flag indicating whether an unaligned access error has occurred
      UFSR_UNALIGNED   : CFSR_UFSR_UNALIGNED_Field := 16#0#;
      --  Sticky flag indicating whether an integer division by zero error has
      --  occurred
      UFSR_DIVBYZERO   : CFSR_UFSR_DIVBYZERO_Field := 16#0#;
      --  unspecified
      Reserved_26_31   : RP2350.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CFSR_Register use record
      MMFSR            at 0 range 0 .. 7;
      BFSR_IBUSERR     at 0 range 8 .. 8;
      BFSR_PRECISERR   at 0 range 9 .. 9;
      BFSR_IMPRECISERR at 0 range 10 .. 10;
      BFSR_UNSTKERR    at 0 range 11 .. 11;
      BFSR_STKERR      at 0 range 12 .. 12;
      BFSR_LSPERR      at 0 range 13 .. 13;
      Reserved_14_14   at 0 range 14 .. 14;
      BFSR_BFARVALID   at 0 range 15 .. 15;
      UFSR_UNDEFINSTR  at 0 range 16 .. 16;
      UFSR_INVSTATE    at 0 range 17 .. 17;
      UFSR_INVPC       at 0 range 18 .. 18;
      UFSR_NOCP        at 0 range 19 .. 19;
      UFSR_STKOF       at 0 range 20 .. 20;
      Reserved_21_23   at 0 range 21 .. 23;
      UFSR_UNALIGNED   at 0 range 24 .. 24;
      UFSR_DIVBYZERO   at 0 range 25 .. 25;
      Reserved_26_31   at 0 range 26 .. 31;
   end record;

   subtype HFSR_VECTTBL_Field is RP2350.Bit;
   subtype HFSR_FORCED_Field is RP2350.Bit;
   subtype HFSR_DEBUGEVT_Field is RP2350.Bit;

   --  Shows the cause of any HardFaults
   type HFSR_Register is record
      --  unspecified
      Reserved_0_0  : RP2350.Bit := 16#0#;
      --  Indicates when a fault has occurred because of a vector table read
      --  error on exception processing
      VECTTBL       : HFSR_VECTTBL_Field := 16#0#;
      --  unspecified
      Reserved_2_29 : RP2350.UInt28 := 16#0#;
      --  Indicates that a fault with configurable priority has been escalated
      --  to a HardFault exception, because it could not be made active,
      --  because of priority, or because it was disabled
      FORCED        : HFSR_FORCED_Field := 16#0#;
      --  Indicates when a Debug event has occurred
      DEBUGEVT      : HFSR_DEBUGEVT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for HFSR_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      VECTTBL       at 0 range 1 .. 1;
      Reserved_2_29 at 0 range 2 .. 29;
      FORCED        at 0 range 30 .. 30;
      DEBUGEVT      at 0 range 31 .. 31;
   end record;

   subtype DFSR_HALTED_Field is RP2350.Bit;
   subtype DFSR_BKPT_Field is RP2350.Bit;
   subtype DFSR_DWTTRAP_Field is RP2350.Bit;
   subtype DFSR_VCATCH_Field is RP2350.Bit;
   subtype DFSR_EXTERNAL_Field is RP2350.Bit;

   --  Shows which debug event occurred
   type DFSR_Register is record
      --  Sticky flag indicating that a Halt request debug event or Step debug
      --  event has occurred
      HALTED        : DFSR_HALTED_Field := 16#0#;
      --  Sticky flag indicating whether a Breakpoint debug event has occurred
      BKPT          : DFSR_BKPT_Field := 16#0#;
      --  Sticky flag indicating whether a Watchpoint debug event has occurred
      DWTTRAP       : DFSR_DWTTRAP_Field := 16#0#;
      --  Sticky flag indicating whether a Vector catch debug event has
      --  occurred
      VCATCH        : DFSR_VCATCH_Field := 16#0#;
      --  Sticky flag indicating whether an External debug request debug event
      --  has occurred
      EXTERNAL      : DFSR_EXTERNAL_Field := 16#0#;
      --  unspecified
      Reserved_5_31 : RP2350.UInt27 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DFSR_Register use record
      HALTED        at 0 range 0 .. 0;
      BKPT          at 0 range 1 .. 1;
      DWTTRAP       at 0 range 2 .. 2;
      VCATCH        at 0 range 3 .. 3;
      EXTERNAL      at 0 range 4 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   --  ID_PFR0_STATE array element
   subtype ID_PFR0_STATE_Element is RP2350.UInt4;

   --  ID_PFR0_STATE array
   type ID_PFR0_STATE_Field_Array is array (0 .. 1) of ID_PFR0_STATE_Element
     with Component_Size => 4, Size => 8;

   --  Type definition for ID_PFR0_STATE
   type ID_PFR0_STATE_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  STATE as a value
            Val : RP2350.Byte;
         when True =>
            --  STATE as an array
            Arr : ID_PFR0_STATE_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for ID_PFR0_STATE_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  Gives top-level information about the instruction set supported by the
   --  PE
   type ID_PFR0_Register is record
      --  Read-only. A32 instruction set support
      STATE         : ID_PFR0_STATE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_PFR0_Register use record
      STATE         at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ID_PFR1_SECURITY_Field is RP2350.UInt4;
   subtype ID_PFR1_MPROGMOD_Field is RP2350.UInt4;

   --  Gives information about the programmers' model and Extensions support
   type ID_PFR1_Register is record
      --  unspecified
      Reserved_0_3   : RP2350.UInt4;
      --  Read-only. Identifies whether the Security Extension is implemented
      SECURITY       : ID_PFR1_SECURITY_Field;
      --  Read-only. Identifies support for the M-Profile programmers' model
      --  support
      MPROGMOD       : ID_PFR1_MPROGMOD_Field;
      --  unspecified
      Reserved_12_31 : RP2350.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_PFR1_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      SECURITY       at 0 range 4 .. 7;
      MPROGMOD       at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype ID_DFR0_MPROFDBG_Field is RP2350.UInt4;

   --  Provides top level information about the debug system
   type ID_DFR0_Register is record
      --  unspecified
      Reserved_0_19  : RP2350.UInt20;
      --  Read-only. Indicates the supported M-profile debug architecture
      MPROFDBG       : ID_DFR0_MPROFDBG_Field;
      --  unspecified
      Reserved_24_31 : RP2350.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_DFR0_Register use record
      Reserved_0_19  at 0 range 0 .. 19;
      MPROFDBG       at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  ID_AFR0_IMPDEF array element
   subtype ID_AFR0_IMPDEF_Element is RP2350.UInt4;

   --  ID_AFR0_IMPDEF array
   type ID_AFR0_IMPDEF_Field_Array is array (0 .. 3)
     of ID_AFR0_IMPDEF_Element
     with Component_Size => 4, Size => 16;

   --  Type definition for ID_AFR0_IMPDEF
   type ID_AFR0_IMPDEF_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  IMPDEF as a value
            Val : RP2350.UInt16;
         when True =>
            --  IMPDEF as an array
            Arr : ID_AFR0_IMPDEF_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for ID_AFR0_IMPDEF_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  Provides information about the IMPLEMENTATION DEFINED features of the PE
   type ID_AFR0_Register is record
      --  Read-only. IMPLEMENTATION DEFINED meaning
      IMPDEF         : ID_AFR0_IMPDEF_Field;
      --  unspecified
      Reserved_16_31 : RP2350.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_AFR0_Register use record
      IMPDEF         at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype ID_MMFR0_PMSA_Field is RP2350.UInt4;
   subtype ID_MMFR0_OUTERSHR_Field is RP2350.UInt4;
   subtype ID_MMFR0_SHARELVL_Field is RP2350.UInt4;
   subtype ID_MMFR0_TCM_Field is RP2350.UInt4;
   subtype ID_MMFR0_AUXREG_Field is RP2350.UInt4;

   --  Provides information about the implemented memory model and memory
   --  management support
   type ID_MMFR0_Register is record
      --  unspecified
      Reserved_0_3   : RP2350.UInt4;
      --  Read-only. Indicates support for the protected memory system
      --  architecture (PMSA)
      PMSA           : ID_MMFR0_PMSA_Field;
      --  Read-only. Indicates the outermost shareability domain implemented
      OUTERSHR       : ID_MMFR0_OUTERSHR_Field;
      --  Read-only. Indicates the number of shareability levels implemented
      SHARELVL       : ID_MMFR0_SHARELVL_Field;
      --  Read-only. Indicates support for tightly coupled memories (TCMs)
      TCM            : ID_MMFR0_TCM_Field;
      --  Read-only. Indicates support for Auxiliary Control Registers
      AUXREG         : ID_MMFR0_AUXREG_Field;
      --  unspecified
      Reserved_24_31 : RP2350.Byte;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_MMFR0_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      PMSA           at 0 range 4 .. 7;
      OUTERSHR       at 0 range 8 .. 11;
      SHARELVL       at 0 range 12 .. 15;
      TCM            at 0 range 16 .. 19;
      AUXREG         at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype ID_MMFR2_WFISTALL_Field is RP2350.UInt4;

   --  Provides information about the implemented memory model and memory
   --  management support
   type ID_MMFR2_Register is record
      --  unspecified
      Reserved_0_23  : RP2350.UInt24;
      --  Read-only. Indicates the support for Wait For Interrupt (WFI)
      --  stalling
      WFISTALL       : ID_MMFR2_WFISTALL_Field;
      --  unspecified
      Reserved_28_31 : RP2350.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_MMFR2_Register use record
      Reserved_0_23  at 0 range 0 .. 23;
      WFISTALL       at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ID_MMFR3_CMAINTVA_Field is RP2350.UInt4;
   subtype ID_MMFR3_CMAINTSW_Field is RP2350.UInt4;
   subtype ID_MMFR3_BPMAINT_Field is RP2350.UInt4;

   --  Provides information about the implemented memory model and memory
   --  management support
   type ID_MMFR3_Register is record
      --  Read-only. Indicates the supported cache maintenance operations by
      --  address
      CMAINTVA       : ID_MMFR3_CMAINTVA_Field;
      --  Read-only. Indicates the supported cache maintenance operations by
      --  set/way
      CMAINTSW       : ID_MMFR3_CMAINTSW_Field;
      --  Read-only. Indicates the supported branch predictor maintenance
      BPMAINT        : ID_MMFR3_BPMAINT_Field;
      --  unspecified
      Reserved_12_31 : RP2350.UInt20;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_MMFR3_Register use record
      CMAINTVA       at 0 range 0 .. 3;
      CMAINTSW       at 0 range 4 .. 7;
      BPMAINT        at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype ID_ISAR0_BITCOUNT_Field is RP2350.UInt4;
   subtype ID_ISAR0_BITFIELD_Field is RP2350.UInt4;
   subtype ID_ISAR0_CMPBRANCH_Field is RP2350.UInt4;
   subtype ID_ISAR0_COPROC_Field is RP2350.UInt4;
   subtype ID_ISAR0_DEBUG_Field is RP2350.UInt4;
   subtype ID_ISAR0_DIVIDE_Field is RP2350.UInt4;

   --  Provides information about the instruction set implemented by the PE
   type ID_ISAR0_Register is record
      --  unspecified
      Reserved_0_3   : RP2350.UInt4;
      --  Read-only. Indicates the supported bit count instructions
      BITCOUNT       : ID_ISAR0_BITCOUNT_Field;
      --  Read-only. Indicates the supported bit field instructions
      BITFIELD       : ID_ISAR0_BITFIELD_Field;
      --  Read-only. Indicates the supported combined Compare and Branch
      --  instructions
      CMPBRANCH      : ID_ISAR0_CMPBRANCH_Field;
      --  Read-only. Indicates the supported Coprocessor instructions
      COPROC         : ID_ISAR0_COPROC_Field;
      --  Read-only. Indicates the implemented Debug instructions
      DEBUG          : ID_ISAR0_DEBUG_Field;
      --  Read-only. Indicates the supported Divide instructions
      DIVIDE         : ID_ISAR0_DIVIDE_Field;
      --  unspecified
      Reserved_28_31 : RP2350.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_ISAR0_Register use record
      Reserved_0_3   at 0 range 0 .. 3;
      BITCOUNT       at 0 range 4 .. 7;
      BITFIELD       at 0 range 8 .. 11;
      CMPBRANCH      at 0 range 12 .. 15;
      COPROC         at 0 range 16 .. 19;
      DEBUG          at 0 range 20 .. 23;
      DIVIDE         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ID_ISAR1_EXTEND_Field is RP2350.UInt4;
   subtype ID_ISAR1_IFTHEN_Field is RP2350.UInt4;
   subtype ID_ISAR1_IMMEDIATE_Field is RP2350.UInt4;
   subtype ID_ISAR1_INTERWORK_Field is RP2350.UInt4;

   --  Provides information about the instruction set implemented by the PE
   type ID_ISAR1_Register is record
      --  unspecified
      Reserved_0_11  : RP2350.UInt12;
      --  Read-only. Indicates the implemented Extend instructions
      EXTEND         : ID_ISAR1_EXTEND_Field;
      --  Read-only. Indicates the implemented If-Then instructions
      IFTHEN         : ID_ISAR1_IFTHEN_Field;
      --  Read-only. Indicates the implemented for data-processing instructions
      --  with long immediates
      IMMEDIATE      : ID_ISAR1_IMMEDIATE_Field;
      --  Read-only. Indicates the implemented Interworking instructions
      INTERWORK      : ID_ISAR1_INTERWORK_Field;
      --  unspecified
      Reserved_28_31 : RP2350.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_ISAR1_Register use record
      Reserved_0_11  at 0 range 0 .. 11;
      EXTEND         at 0 range 12 .. 15;
      IFTHEN         at 0 range 16 .. 19;
      IMMEDIATE      at 0 range 20 .. 23;
      INTERWORK      at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ID_ISAR2_LOADSTORE_Field is RP2350.UInt4;
   subtype ID_ISAR2_MEMHINT_Field is RP2350.UInt4;
   subtype ID_ISAR2_MULTIACCESSINT_Field is RP2350.UInt4;
   subtype ID_ISAR2_MULT_Field is RP2350.UInt4;
   subtype ID_ISAR2_MULTS_Field is RP2350.UInt4;
   subtype ID_ISAR2_MULTU_Field is RP2350.UInt4;
   subtype ID_ISAR2_REVERSAL_Field is RP2350.UInt4;

   --  Provides information about the instruction set implemented by the PE
   type ID_ISAR2_Register is record
      --  Read-only. Indicates the implemented additional load/store
      --  instructions
      LOADSTORE      : ID_ISAR2_LOADSTORE_Field;
      --  Read-only. Indicates the implemented Memory Hint instructions
      MEMHINT        : ID_ISAR2_MEMHINT_Field;
      --  Read-only. Indicates the support for interruptible multi-access
      --  instructions
      MULTIACCESSINT : ID_ISAR2_MULTIACCESSINT_Field;
      --  Read-only. Indicates the implemented additional Multiply instructions
      MULT           : ID_ISAR2_MULT_Field;
      --  Read-only. Indicates the implemented advanced signed Multiply
      --  instructions
      MULTS          : ID_ISAR2_MULTS_Field;
      --  Read-only. Indicates the implemented advanced unsigned Multiply
      --  instructions
      MULTU          : ID_ISAR2_MULTU_Field;
      --  unspecified
      Reserved_24_27 : RP2350.UInt4;
      --  Read-only. Indicates the implemented Reversal instructions
      REVERSAL       : ID_ISAR2_REVERSAL_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_ISAR2_Register use record
      LOADSTORE      at 0 range 0 .. 3;
      MEMHINT        at 0 range 4 .. 7;
      MULTIACCESSINT at 0 range 8 .. 11;
      MULT           at 0 range 12 .. 15;
      MULTS          at 0 range 16 .. 19;
      MULTU          at 0 range 20 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      REVERSAL       at 0 range 28 .. 31;
   end record;

   subtype ID_ISAR3_SATURATE_Field is RP2350.UInt4;
   subtype ID_ISAR3_SIMD_Field is RP2350.UInt4;
   subtype ID_ISAR3_SVC_Field is RP2350.UInt4;
   subtype ID_ISAR3_SYNCHPRIM_Field is RP2350.UInt4;
   subtype ID_ISAR3_TABBRANCH_Field is RP2350.UInt4;
   subtype ID_ISAR3_T32COPY_Field is RP2350.UInt4;
   subtype ID_ISAR3_TRUENOP_Field is RP2350.UInt4;

   --  Provides information about the instruction set implemented by the PE
   type ID_ISAR3_Register is record
      --  Read-only. Indicates the implemented saturating instructions
      SATURATE       : ID_ISAR3_SATURATE_Field;
      --  Read-only. Indicates the implemented SIMD instructions
      SIMD           : ID_ISAR3_SIMD_Field;
      --  Read-only. Indicates the implemented SVC instructions
      SVC            : ID_ISAR3_SVC_Field;
      --  Read-only. Used in conjunction with ID_ISAR4.SynchPrim_frac to
      --  indicate the implemented Synchronization Primitive instructions
      SYNCHPRIM      : ID_ISAR3_SYNCHPRIM_Field;
      --  Read-only. Indicates the implemented Table Branch instructions
      TABBRANCH      : ID_ISAR3_TABBRANCH_Field;
      --  Read-only. Indicates the support for T32 non flag-setting MOV
      --  instructions
      T32COPY        : ID_ISAR3_T32COPY_Field;
      --  Read-only. Indicates the implemented true NOP instructions
      TRUENOP        : ID_ISAR3_TRUENOP_Field;
      --  unspecified
      Reserved_28_31 : RP2350.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_ISAR3_Register use record
      SATURATE       at 0 range 0 .. 3;
      SIMD           at 0 range 4 .. 7;
      SVC            at 0 range 8 .. 11;
      SYNCHPRIM      at 0 range 12 .. 15;
      TABBRANCH      at 0 range 16 .. 19;
      T32COPY        at 0 range 20 .. 23;
      TRUENOP        at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype ID_ISAR4_UNPRIV_Field is RP2350.UInt4;
   subtype ID_ISAR4_WITHSHIFTS_Field is RP2350.UInt4;
   subtype ID_ISAR4_WRITEBACK_Field is RP2350.UInt4;
   subtype ID_ISAR4_BARRIER_Field is RP2350.UInt4;
   subtype ID_ISAR4_SYNCPRIM_FRAC_Field is RP2350.UInt4;
   subtype ID_ISAR4_PSR_M_Field is RP2350.UInt4;

   --  Provides information about the instruction set implemented by the PE
   type ID_ISAR4_Register is record
      --  Read-only. Indicates the implemented unprivileged instructions
      UNPRIV         : ID_ISAR4_UNPRIV_Field;
      --  Read-only. Indicates the support for writeback addressing modes
      WITHSHIFTS     : ID_ISAR4_WITHSHIFTS_Field;
      --  Read-only. Indicates the support for writeback addressing modes
      WRITEBACK      : ID_ISAR4_WRITEBACK_Field;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4;
      --  Read-only. Indicates the implemented Barrier instructions
      BARRIER        : ID_ISAR4_BARRIER_Field;
      --  Read-only. Used in conjunction with ID_ISAR3.SynchPrim to indicate
      --  the implemented Synchronization Primitive instructions
      SYNCPRIM_FRAC  : ID_ISAR4_SYNCPRIM_FRAC_Field;
      --  Read-only. Indicates the implemented M profile instructions to modify
      --  the PSRs
      PSR_M          : ID_ISAR4_PSR_M_Field;
      --  unspecified
      Reserved_28_31 : RP2350.UInt4;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ID_ISAR4_Register use record
      UNPRIV         at 0 range 0 .. 3;
      WITHSHIFTS     at 0 range 4 .. 7;
      WRITEBACK      at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      BARRIER        at 0 range 16 .. 19;
      SYNCPRIM_FRAC  at 0 range 20 .. 23;
      PSR_M          at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   subtype CTR_IMINLINE_Field is RP2350.UInt4;
   subtype CTR_RES1_1_Field is RP2350.UInt2;
   subtype CTR_DMINLINE_Field is RP2350.UInt4;
   subtype CTR_ERG_Field is RP2350.UInt4;
   subtype CTR_CWG_Field is RP2350.UInt4;
   subtype CTR_RES1_Field is RP2350.Bit;

   --  Provides information about the architecture of the caches. CTR is RES0
   --  if CLIDR is zero.
   type CTR_Register is record
      --  Read-only. Log2 of the number of words in the smallest cache line of
      --  all the instruction caches that are controlled by the PE
      IMINLINE       : CTR_IMINLINE_Field;
      --  unspecified
      Reserved_4_13  : RP2350.UInt10;
      --  Read-only. Reserved, RES1
      RES1_1         : CTR_RES1_1_Field;
      --  Read-only. Log2 of the number of words in the smallest cache line of
      --  all the data caches and unified caches that are controlled by the PE
      DMINLINE       : CTR_DMINLINE_Field;
      --  Read-only. Log2 of the number of words of the maximum size of the
      --  reservation granule that has been implemented for the Load-Exclusive
      --  and Store-Exclusive instructions
      ERG            : CTR_ERG_Field;
      --  Read-only. Log2 of the number of words of the maximum size of memory
      --  that can be overwritten as a result of the eviction of a cache entry
      --  that has had a memory location in it modified
      CWG            : CTR_CWG_Field;
      --  unspecified
      Reserved_28_30 : RP2350.UInt3;
      --  Read-only. Reserved, RES1
      RES1           : CTR_RES1_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTR_Register use record
      IMINLINE       at 0 range 0 .. 3;
      Reserved_4_13  at 0 range 4 .. 13;
      RES1_1         at 0 range 14 .. 15;
      DMINLINE       at 0 range 16 .. 19;
      ERG            at 0 range 20 .. 23;
      CWG            at 0 range 24 .. 27;
      Reserved_28_30 at 0 range 28 .. 30;
      RES1           at 0 range 31 .. 31;
   end record;

   --  CPACR_CP array element
   subtype CPACR_CP_Element is RP2350.UInt2;

   --  CPACR_CP array
   type CPACR_CP_Field_Array is array (0 .. 7) of CPACR_CP_Element
     with Component_Size => 2, Size => 16;

   --  Type definition for CPACR_CP
   type CPACR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : RP2350.UInt16;
         when True =>
            --  CP as an array
            Arr : CPACR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 16;

   for CPACR_CP_Field use record
      Val at 0 range 0 .. 15;
      Arr at 0 range 0 .. 15;
   end record;

   --  CPACR_CP array
   type CPACR_CP_Field_Array_1 is array (10 .. 11) of CPACR_CP_Element
     with Component_Size => 2, Size => 4;

   --  Type definition for CPACR_CP
   type CPACR_CP_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : RP2350.UInt4;
         when True =>
            --  CP as an array
            Arr : CPACR_CP_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for CPACR_CP_Field_1 use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Specifies the access privileges for coprocessors and the FP Extension
   type CPACR_Register is record
      --  Controls access privileges for coprocessor 0
      CP             : CPACR_CP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_16_19 : RP2350.UInt4 := 16#0#;
      --  Defines the access rights for the floating-point functionality
      CP_1           : CPACR_CP_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_24_31 : RP2350.Byte := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CPACR_Register use record
      CP             at 0 range 0 .. 15;
      Reserved_16_19 at 0 range 16 .. 19;
      CP_1           at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   --  NSACR_CP array element
   subtype NSACR_CP_Element is RP2350.Bit;

   --  NSACR_CP array
   type NSACR_CP_Field_Array is array (0 .. 7) of NSACR_CP_Element
     with Component_Size => 1, Size => 8;

   --  Type definition for NSACR_CP
   type NSACR_CP_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : RP2350.Byte;
         when True =>
            --  CP as an array
            Arr : NSACR_CP_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 8;

   for NSACR_CP_Field use record
      Val at 0 range 0 .. 7;
      Arr at 0 range 0 .. 7;
   end record;

   --  NSACR_CP array
   type NSACR_CP_Field_Array_1 is array (10 .. 11) of NSACR_CP_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for NSACR_CP
   type NSACR_CP_Field_1
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CP as a value
            Val : RP2350.UInt2;
         when True =>
            --  CP as an array
            Arr : NSACR_CP_Field_Array_1;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for NSACR_CP_Field_1 use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   --  Defines the Non-secure access permissions for both the FP Extension and
   --  coprocessors CP0 to CP7
   type NSACR_Register is record
      --  Enables Non-secure access to coprocessor CP0
      CP             : NSACR_CP_Field := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_8_9   : RP2350.UInt2 := 16#0#;
      --  Enables Non-secure access to the Floating-point Extension
      CP_1           : NSACR_CP_Field_1 := (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_12_31 : RP2350.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for NSACR_Register use record
      CP             at 0 range 0 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      CP_1           at 0 range 10 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype MPU_TYPE_SEPARATE_Field is RP2350.Bit;
   subtype MPU_TYPE_DREGION_Field is RP2350.Byte;

   --  The MPU Type Register indicates how many regions the MPU `FTSSS supports
   type MPU_TYPE_Register is record
      --  Read-only. Indicates support for separate instructions and data
      --  address regions
      SEPARATE_k     : MPU_TYPE_SEPARATE_Field;
      --  unspecified
      Reserved_1_7   : RP2350.UInt7;
      --  Read-only. Number of regions supported by the MPU
      DREGION        : MPU_TYPE_DREGION_Field;
      --  unspecified
      Reserved_16_31 : RP2350.UInt16;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_TYPE_Register use record
      SEPARATE_k     at 0 range 0 .. 0;
      Reserved_1_7   at 0 range 1 .. 7;
      DREGION        at 0 range 8 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype MPU_CTRL_ENABLE_Field is RP2350.Bit;
   subtype MPU_CTRL_HFNMIENA_Field is RP2350.Bit;
   subtype MPU_CTRL_PRIVDEFENA_Field is RP2350.Bit;

   --  Enables the MPU and, when the MPU is enabled, controls whether the
   --  default memory map is enabled as a background region for privileged
   --  accesses, and whether the MPU is enabled for HardFaults, NMIs, and
   --  exception handlers when FAULTMASK is set to 1
   type MPU_CTRL_Register is record
      --  Enables the MPU
      ENABLE        : MPU_CTRL_ENABLE_Field := 16#0#;
      --  Controls whether handlers executing with priority less than 0 access
      --  memory with the MPU enabled or disabled. This applies to HardFaults,
      --  NMIs, and exception handlers when FAULTMASK is set to 1
      HFNMIENA      : MPU_CTRL_HFNMIENA_Field := 16#0#;
      --  Controls whether the default memory map is enabled for privileged
      --  software
      PRIVDEFENA    : MPU_CTRL_PRIVDEFENA_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : RP2350.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      HFNMIENA      at 0 range 1 .. 1;
      PRIVDEFENA    at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype MPU_RNR_REGION_Field is RP2350.UInt3;

   --  Selects the region currently accessed by MPU_RBAR and MPU_RLAR
   type MPU_RNR_Register is record
      --  Indicates the memory region accessed by MPU_RBAR and MPU_RLAR
      REGION        : MPU_RNR_REGION_Field := 16#0#;
      --  unspecified
      Reserved_3_31 : RP2350.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RNR_Register use record
      REGION        at 0 range 0 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   subtype MPU_RBAR_XN_Field is RP2350.Bit;
   subtype MPU_RBAR_AP_Field is RP2350.UInt2;
   subtype MPU_RBAR_SH_Field is RP2350.UInt2;
   subtype MPU_RBAR_BASE_Field is RP2350.UInt27;

   --  Provides indirect read and write access to the base address of the
   --  currently selected MPU region `FTSSS
   type MPU_RBAR_Register is record
      --  Defines whether code can be executed from this region
      XN   : MPU_RBAR_XN_Field := 16#0#;
      --  Defines the access permissions for this region
      AP   : MPU_RBAR_AP_Field := 16#0#;
      --  Defines the Shareability domain of this region for Normal memory
      SH   : MPU_RBAR_SH_Field := 16#0#;
      --  Contains bits [31:5] of the lower inclusive limit of the selected MPU
      --  memory region. This value is zero extended to provide the base
      --  address to be checked against
      BASE : MPU_RBAR_BASE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RBAR_Register use record
      XN   at 0 range 0 .. 0;
      AP   at 0 range 1 .. 2;
      SH   at 0 range 3 .. 4;
      BASE at 0 range 5 .. 31;
   end record;

   subtype MPU_RLAR_EN_Field is RP2350.Bit;
   subtype MPU_RLAR_ATTRINDX_Field is RP2350.UInt3;
   subtype MPU_RLAR_LIMIT_Field is RP2350.UInt27;

   --  Provides indirect read and write access to the limit address of the
   --  currently selected MPU region `FTSSS
   type MPU_RLAR_Register is record
      --  Region enable
      EN           : MPU_RLAR_EN_Field := 16#0#;
      --  Associates a set of attributes in the MPU_MAIR0 and MPU_MAIR1 fields
      ATTRINDX     : MPU_RLAR_ATTRINDX_Field := 16#0#;
      --  unspecified
      Reserved_4_4 : RP2350.Bit := 16#0#;
      --  Contains bits [31:5] of the upper inclusive limit of the selected MPU
      --  memory region. This value is postfixed with 0x1F to provide the limit
      --  address to be checked against
      LIMIT        : MPU_RLAR_LIMIT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RLAR_Register use record
      EN           at 0 range 0 .. 0;
      ATTRINDX     at 0 range 1 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      LIMIT        at 0 range 5 .. 31;
   end record;

   subtype MPU_RBAR_A_XN_Field is RP2350.Bit;
   subtype MPU_RBAR_A_AP_Field is RP2350.UInt2;
   subtype MPU_RBAR_A_SH_Field is RP2350.UInt2;
   subtype MPU_RBAR_A_BASE_Field is RP2350.UInt27;

   --  Provides indirect read and write access to the base address of the MPU
   --  region selected by MPU_RNR[7:2]:(1[1:0]) `FTSSS
   type MPU_RBAR_A_Register is record
      --  Defines whether code can be executed from this region
      XN   : MPU_RBAR_A_XN_Field := 16#0#;
      --  Defines the access permissions for this region
      AP   : MPU_RBAR_A_AP_Field := 16#0#;
      --  Defines the Shareability domain of this region for Normal memory
      SH   : MPU_RBAR_A_SH_Field := 16#0#;
      --  Contains bits [31:5] of the lower inclusive limit of the selected MPU
      --  memory region. This value is zero extended to provide the base
      --  address to be checked against
      BASE : MPU_RBAR_A_BASE_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RBAR_A_Register use record
      XN   at 0 range 0 .. 0;
      AP   at 0 range 1 .. 2;
      SH   at 0 range 3 .. 4;
      BASE at 0 range 5 .. 31;
   end record;

   subtype MPU_RLAR_A_EN_Field is RP2350.Bit;
   subtype MPU_RLAR_A_ATTRINDX_Field is RP2350.UInt3;
   subtype MPU_RLAR_A_LIMIT_Field is RP2350.UInt27;

   --  Provides indirect read and write access to the limit address of the
   --  currently selected MPU region selected by MPU_RNR[7:2]:(1[1:0]) `FTSSS
   type MPU_RLAR_A_Register is record
      --  Region enable
      EN           : MPU_RLAR_A_EN_Field := 16#0#;
      --  Associates a set of attributes in the MPU_MAIR0 and MPU_MAIR1 fields
      ATTRINDX     : MPU_RLAR_A_ATTRINDX_Field := 16#0#;
      --  unspecified
      Reserved_4_4 : RP2350.Bit := 16#0#;
      --  Contains bits [31:5] of the upper inclusive limit of the selected MPU
      --  memory region. This value is postfixed with 0x1F to provide the limit
      --  address to be checked against
      LIMIT        : MPU_RLAR_A_LIMIT_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_RLAR_A_Register use record
      EN           at 0 range 0 .. 0;
      ATTRINDX     at 0 range 1 .. 3;
      Reserved_4_4 at 0 range 4 .. 4;
      LIMIT        at 0 range 5 .. 31;
   end record;

   --  MPU_MAIR0_ATTR array element
   subtype MPU_MAIR0_ATTR_Element is RP2350.Byte;

   --  MPU_MAIR0_ATTR array
   type MPU_MAIR0_ATTR_Field_Array is array (0 .. 3)
     of MPU_MAIR0_ATTR_Element
     with Component_Size => 8, Size => 32;

   --  Along with MPU_MAIR1, provides the memory attribute encodings
   --  corresponding to the AttrIndex values
   type MPU_MAIR0_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ATTR as a value
            Val : RP2350.UInt32;
         when True =>
            --  ATTR as an array
            Arr : MPU_MAIR0_ATTR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_MAIR0_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   --  MPU_MAIR1_ATTR array element
   subtype MPU_MAIR1_ATTR_Element is RP2350.Byte;

   --  MPU_MAIR1_ATTR array
   type MPU_MAIR1_ATTR_Field_Array is array (4 .. 7)
     of MPU_MAIR1_ATTR_Element
     with Component_Size => 8, Size => 32;

   --  Along with MPU_MAIR0, provides the memory attribute encodings
   --  corresponding to the AttrIndex values
   type MPU_MAIR1_Register
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  ATTR as a value
            Val : RP2350.UInt32;
         when True =>
            --  ATTR as an array
            Arr : MPU_MAIR1_ATTR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 32, Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MPU_MAIR1_Register use record
      Val at 0 range 0 .. 31;
      Arr at 0 range 0 .. 31;
   end record;

   subtype SAU_CTRL_ENABLE_Field is RP2350.Bit;
   subtype SAU_CTRL_ALLNS_Field is RP2350.Bit;

   --  Allows enabling of the Security Attribution Unit
   type SAU_CTRL_Register is record
      --  Enables the SAU
      ENABLE        : SAU_CTRL_ENABLE_Field := 16#0#;
      --  When SAU_CTRL.ENABLE is 0 this bit controls if the memory is marked
      --  as Non-secure or Secure
      ALLNS         : SAU_CTRL_ALLNS_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SAU_CTRL_Register use record
      ENABLE        at 0 range 0 .. 0;
      ALLNS         at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype SAU_TYPE_SREGION_Field is RP2350.Byte;

   --  Indicates the number of regions implemented by the Security Attribution
   --  Unit
   type SAU_TYPE_Register is record
      --  Read-only. The number of implemented SAU regions
      SREGION       : SAU_TYPE_SREGION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SAU_TYPE_Register use record
      SREGION       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SAU_RNR_REGION_Field is RP2350.Byte;

   --  Selects the region currently accessed by SAU_RBAR and SAU_RLAR
   type SAU_RNR_Register is record
      --  Indicates the SAU region accessed by SAU_RBAR and SAU_RLAR
      REGION        : SAU_RNR_REGION_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SAU_RNR_Register use record
      REGION        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SAU_RBAR_BADDR_Field is RP2350.UInt27;

   --  Provides indirect read and write access to the base address of the
   --  currently selected SAU region
   type SAU_RBAR_Register is record
      --  unspecified
      Reserved_0_4 : RP2350.UInt5 := 16#0#;
      --  Holds bits [31:5] of the base address for the selected SAU region
      BADDR        : SAU_RBAR_BADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SAU_RBAR_Register use record
      Reserved_0_4 at 0 range 0 .. 4;
      BADDR        at 0 range 5 .. 31;
   end record;

   subtype SAU_RLAR_ENABLE_Field is RP2350.Bit;
   subtype SAU_RLAR_NSC_Field is RP2350.Bit;
   subtype SAU_RLAR_LADDR_Field is RP2350.UInt27;

   --  Provides indirect read and write access to the limit address of the
   --  currently selected SAU region
   type SAU_RLAR_Register is record
      --  SAU region enable
      ENABLE       : SAU_RLAR_ENABLE_Field := 16#0#;
      --  Controls whether Non-secure state is permitted to execute an SG
      --  instruction from this region
      NSC          : SAU_RLAR_NSC_Field := 16#0#;
      --  unspecified
      Reserved_2_4 : RP2350.UInt3 := 16#0#;
      --  Holds bits [31:5] of the limit address for the selected SAU region
      LADDR        : SAU_RLAR_LADDR_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SAU_RLAR_Register use record
      ENABLE       at 0 range 0 .. 0;
      NSC          at 0 range 1 .. 1;
      Reserved_2_4 at 0 range 2 .. 4;
      LADDR        at 0 range 5 .. 31;
   end record;

   subtype SFSR_INVEP_Field is RP2350.Bit;
   subtype SFSR_INVIS_Field is RP2350.Bit;
   subtype SFSR_INVER_Field is RP2350.Bit;
   subtype SFSR_AUVIOL_Field is RP2350.Bit;
   subtype SFSR_INVTRAN_Field is RP2350.Bit;
   subtype SFSR_LSPERR_Field is RP2350.Bit;
   subtype SFSR_SFARVALID_Field is RP2350.Bit;
   subtype SFSR_LSERR_Field is RP2350.Bit;

   --  Provides information about any security related faults
   type SFSR_Register is record
      --  This bit is set if a function call from the Non-secure state or
      --  exception targets a non-SG instruction in the Secure state. This bit
      --  is also set if the target address is a SG instruction, but there is
      --  no matching SAU/IDAU region with the NSC flag set
      INVEP         : SFSR_INVEP_Field := 16#0#;
      --  This bit is set if the integrity signature in an exception stack
      --  frame is found to be invalid during the unstacking operation
      INVIS         : SFSR_INVIS_Field := 16#0#;
      --  This can be caused by EXC_RETURN.DCRS being set to 0 when returning
      --  from an exception in the Non-secure state, or by EXC_RETURN.ES being
      --  set to 1 when returning from an exception in the Non-secure state
      INVER         : SFSR_INVER_Field := 16#0#;
      --  Sticky flag indicating that an attempt was made to access parts of
      --  the address space that are marked as Secure with NS-Req for the
      --  transaction set to Non-secure. This bit is not set if the violation
      --  occurred during lazy state preservation. See LSPERR
      AUVIOL        : SFSR_AUVIOL_Field := 16#0#;
      --  Sticky flag indicating that an exception was raised due to a branch
      --  that was not flagged as being domain crossing causing a transition
      --  from Secure to Non-secure memory
      INVTRAN       : SFSR_INVTRAN_Field := 16#0#;
      --  Stick flag indicating that an SAU or IDAU violation occurred during
      --  the lazy preservation of floating-point state
      LSPERR        : SFSR_LSPERR_Field := 16#0#;
      --  This bit is set when the SFAR register contains a valid value. As
      --  with similar fields, such as BFSR.BFARVALID and MMFSR.MMARVALID, this
      --  bit can be cleared by other exceptions, such as BusFault
      SFARVALID     : SFSR_SFARVALID_Field := 16#0#;
      --  Sticky flag indicating that an error occurred during lazy state
      --  activation or deactivation
      LSERR         : SFSR_LSERR_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SFSR_Register use record
      INVEP         at 0 range 0 .. 0;
      INVIS         at 0 range 1 .. 1;
      INVER         at 0 range 2 .. 2;
      AUVIOL        at 0 range 3 .. 3;
      INVTRAN       at 0 range 4 .. 4;
      LSPERR        at 0 range 5 .. 5;
      SFARVALID     at 0 range 6 .. 6;
      LSERR         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DHCSR_C_DEBUGEN_Field is RP2350.Bit;
   subtype DHCSR_C_HALT_Field is RP2350.Bit;
   subtype DHCSR_C_STEP_Field is RP2350.Bit;
   subtype DHCSR_C_MASKINTS_Field is RP2350.Bit;
   subtype DHCSR_C_SNAPSTALL_Field is RP2350.Bit;
   subtype DHCSR_S_REGRDY_Field is RP2350.Bit;
   subtype DHCSR_S_HALT_Field is RP2350.Bit;
   subtype DHCSR_S_SLEEP_Field is RP2350.Bit;
   subtype DHCSR_S_LOCKUP_Field is RP2350.Bit;
   subtype DHCSR_S_SDE_Field is RP2350.Bit;
   subtype DHCSR_S_RETIRE_ST_Field is RP2350.Bit;
   subtype DHCSR_S_RESET_ST_Field is RP2350.Bit;
   subtype DHCSR_S_RESTART_ST_Field is RP2350.Bit;

   --  Controls halting debug
   type DHCSR_Register is record
      --  Enable Halting debug
      C_DEBUGEN      : DHCSR_C_DEBUGEN_Field := 16#0#;
      --  PE enter Debug state halt request
      C_HALT         : DHCSR_C_HALT_Field := 16#0#;
      --  Enable single instruction step
      C_STEP         : DHCSR_C_STEP_Field := 16#0#;
      --  When debug is enabled, the debugger can write to this bit to mask
      --  PendSV, SysTick and external configurable interrupts
      C_MASKINTS     : DHCSR_C_MASKINTS_Field := 16#0#;
      --  unspecified
      Reserved_4_4   : RP2350.Bit := 16#0#;
      --  Allow imprecise entry to Debug state
      C_SNAPSTALL    : DHCSR_C_SNAPSTALL_Field := 16#0#;
      --  unspecified
      Reserved_6_15  : RP2350.UInt10 := 16#0#;
      --  Read-only. Handshake flag to transfers through the DCRDR
      S_REGRDY       : DHCSR_S_REGRDY_Field := 16#0#;
      --  Read-only. Indicates whether the PE is in Debug state
      S_HALT         : DHCSR_S_HALT_Field := 16#0#;
      --  Read-only. Indicates whether the PE is sleeping
      S_SLEEP        : DHCSR_S_SLEEP_Field := 16#0#;
      --  Read-only. Indicates whether the PE is in Lockup state
      S_LOCKUP       : DHCSR_S_LOCKUP_Field := 16#0#;
      --  Read-only. Indicates whether Secure invasive debug is allowed
      S_SDE          : DHCSR_S_SDE_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : RP2350.UInt3 := 16#0#;
      --  Read-only. Set to 1 every time the PE retires one of more
      --  instructions
      S_RETIRE_ST    : DHCSR_S_RETIRE_ST_Field := 16#0#;
      --  Read-only. Indicates whether the PE has been reset since the last
      --  read of the DHCSR
      S_RESET_ST     : DHCSR_S_RESET_ST_Field := 16#0#;
      --  Read-only. Indicates the PE has processed a request to clear
      --  DHCSR.C_HALT to 0. That is, either a write to DHCSR that clears
      --  DHCSR.C_HALT from 1 to 0, or an External Restart Request
      S_RESTART_ST   : DHCSR_S_RESTART_ST_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : RP2350.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DHCSR_Register use record
      C_DEBUGEN      at 0 range 0 .. 0;
      C_HALT         at 0 range 1 .. 1;
      C_STEP         at 0 range 2 .. 2;
      C_MASKINTS     at 0 range 3 .. 3;
      Reserved_4_4   at 0 range 4 .. 4;
      C_SNAPSTALL    at 0 range 5 .. 5;
      Reserved_6_15  at 0 range 6 .. 15;
      S_REGRDY       at 0 range 16 .. 16;
      S_HALT         at 0 range 17 .. 17;
      S_SLEEP        at 0 range 18 .. 18;
      S_LOCKUP       at 0 range 19 .. 19;
      S_SDE          at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      S_RETIRE_ST    at 0 range 24 .. 24;
      S_RESET_ST     at 0 range 25 .. 25;
      S_RESTART_ST   at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype DCRSR_REGSEL_Field is RP2350.UInt7;
   subtype DCRSR_REGWNR_Field is RP2350.Bit;

   --  With the DCRDR, provides debug access to the general-purpose registers,
   --  special-purpose registers, and the FP extension registers. A write to
   --  the DCRSR specifies the register to transfer, whether the transfer is a
   --  read or write, and starts the transfer
   type DCRSR_Register is record
      --  Specifies the general-purpose register, special-purpose register, or
      --  FP register to transfer
      REGSEL         : DCRSR_REGSEL_Field := 16#0#;
      --  unspecified
      Reserved_7_15  : RP2350.UInt9 := 16#0#;
      --  Specifies the access type for the transfer
      REGWNR         : DCRSR_REGWNR_Field := 16#0#;
      --  unspecified
      Reserved_17_31 : RP2350.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCRSR_Register use record
      REGSEL         at 0 range 0 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      REGWNR         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   subtype DEMCR_VC_CORERESET_Field is RP2350.Bit;
   subtype DEMCR_VC_MMERR_Field is RP2350.Bit;
   subtype DEMCR_VC_NOCPERR_Field is RP2350.Bit;
   subtype DEMCR_VC_CHKERR_Field is RP2350.Bit;
   subtype DEMCR_VC_STATERR_Field is RP2350.Bit;
   subtype DEMCR_VC_BUSERR_Field is RP2350.Bit;
   subtype DEMCR_VC_INTERR_Field is RP2350.Bit;
   subtype DEMCR_VC_HARDERR_Field is RP2350.Bit;
   subtype DEMCR_VC_SFERR_Field is RP2350.Bit;
   subtype DEMCR_MON_EN_Field is RP2350.Bit;
   subtype DEMCR_MON_PEND_Field is RP2350.Bit;
   subtype DEMCR_MON_STEP_Field is RP2350.Bit;
   subtype DEMCR_MON_REQ_Field is RP2350.Bit;
   subtype DEMCR_SDME_Field is RP2350.Bit;
   subtype DEMCR_TRCENA_Field is RP2350.Bit;

   --  Manages vector catch behavior and DebugMonitor handling when debugging
   type DEMCR_Register is record
      --  Enable Reset Vector Catch. This causes a warm reset to halt a running
      --  system
      VC_CORERESET   : DEMCR_VC_CORERESET_Field := 16#0#;
      --  unspecified
      Reserved_1_3   : RP2350.UInt3 := 16#0#;
      --  Enable halting debug trap on a MemManage exception
      VC_MMERR       : DEMCR_VC_MMERR_Field := 16#0#;
      --  Enable halting debug trap on a UsageFault caused by an access to a
      --  coprocessor
      VC_NOCPERR     : DEMCR_VC_NOCPERR_Field := 16#0#;
      --  Enable halting debug trap on a UsageFault exception caused by a
      --  checking error, for example an alignment check error
      VC_CHKERR      : DEMCR_VC_CHKERR_Field := 16#0#;
      --  Enable halting debug trap on a UsageFault exception caused by a state
      --  information error, for example an Undefined Instruction exception
      VC_STATERR     : DEMCR_VC_STATERR_Field := 16#0#;
      --  BusFault exception halting debug vector catch enable
      VC_BUSERR      : DEMCR_VC_BUSERR_Field := 16#0#;
      --  Enable halting debug vector catch for faults during exception entry
      --  and return
      VC_INTERR      : DEMCR_VC_INTERR_Field := 16#0#;
      --  HardFault exception halting debug vector catch enable
      VC_HARDERR     : DEMCR_VC_HARDERR_Field := 16#0#;
      --  SecureFault exception halting debug vector catch enable
      VC_SFERR       : DEMCR_VC_SFERR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4 := 16#0#;
      --  Enable the DebugMonitor exception
      MON_EN         : DEMCR_MON_EN_Field := 16#0#;
      --  Sets or clears the pending state of the DebugMonitor exception
      MON_PEND       : DEMCR_MON_PEND_Field := 16#0#;
      --  Enable DebugMonitor stepping
      MON_STEP       : DEMCR_MON_STEP_Field := 16#0#;
      --  DebugMonitor semaphore bit
      MON_REQ        : DEMCR_MON_REQ_Field := 16#0#;
      --  Read-only. Indicates whether the DebugMonitor targets the Secure or
      --  the Non-secure state and whether debug events are allowed in Secure
      --  state
      SDME           : DEMCR_SDME_Field := 16#0#;
      --  unspecified
      Reserved_21_23 : RP2350.UInt3 := 16#0#;
      --  Global enable for all DWT and ITM features
      TRCENA         : DEMCR_TRCENA_Field := 16#0#;
      --  unspecified
      Reserved_25_31 : RP2350.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEMCR_Register use record
      VC_CORERESET   at 0 range 0 .. 0;
      Reserved_1_3   at 0 range 1 .. 3;
      VC_MMERR       at 0 range 4 .. 4;
      VC_NOCPERR     at 0 range 5 .. 5;
      VC_CHKERR      at 0 range 6 .. 6;
      VC_STATERR     at 0 range 7 .. 7;
      VC_BUSERR      at 0 range 8 .. 8;
      VC_INTERR      at 0 range 9 .. 9;
      VC_HARDERR     at 0 range 10 .. 10;
      VC_SFERR       at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      MON_EN         at 0 range 16 .. 16;
      MON_PEND       at 0 range 17 .. 17;
      MON_STEP       at 0 range 18 .. 18;
      MON_REQ        at 0 range 19 .. 19;
      SDME           at 0 range 20 .. 20;
      Reserved_21_23 at 0 range 21 .. 23;
      TRCENA         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype DSCSR_SBRSELEN_Field is RP2350.Bit;
   subtype DSCSR_SBRSEL_Field is RP2350.Bit;
   subtype DSCSR_CDS_Field is RP2350.Bit;
   subtype DSCSR_CDSKEY_Field is RP2350.Bit;

   --  Provides control and status information for Secure debug
   type DSCSR_Register is record
      --  Controls whether the SBRSEL field or the current Security state of
      --  the processor selects which version of the memory-mapped Banked
      --  registers are accessed to the debugger
      SBRSELEN       : DSCSR_SBRSELEN_Field := 16#0#;
      --  If SBRSELEN is 1 this bit selects whether the Non-secure or the
      --  Secure version of the memory-mapped Banked registers are accessible
      --  to the debugger
      SBRSEL         : DSCSR_SBRSEL_Field := 16#0#;
      --  unspecified
      Reserved_2_15  : RP2350.UInt14 := 16#0#;
      --  This field indicates the current Security state of the processor
      CDS            : DSCSR_CDS_Field := 16#0#;
      --  Writes to the CDS bit are ignored unless CDSKEY is concurrently
      --  written to zero
      CDSKEY         : DSCSR_CDSKEY_Field := 16#0#;
      --  unspecified
      Reserved_18_31 : RP2350.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DSCSR_Register use record
      SBRSELEN       at 0 range 0 .. 0;
      SBRSEL         at 0 range 1 .. 1;
      Reserved_2_15  at 0 range 2 .. 15;
      CDS            at 0 range 16 .. 16;
      CDSKEY         at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   subtype STIR_INTID_Field is RP2350.UInt9;

   --  Provides a mechanism for software to generate an interrupt
   type STIR_Register is record
      --  Indicates the interrupt to be pended. The value written is
      --  (ExceptionNumber - 16)
      INTID         : STIR_INTID_Field := 16#0#;
      --  unspecified
      Reserved_9_31 : RP2350.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for STIR_Register use record
      INTID         at 0 range 0 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   subtype FPCCR_LSPACT_Field is RP2350.Bit;
   subtype FPCCR_USER_Field is RP2350.Bit;
   subtype FPCCR_S_Field is RP2350.Bit;
   subtype FPCCR_THREAD_Field is RP2350.Bit;
   subtype FPCCR_HFRDY_Field is RP2350.Bit;
   subtype FPCCR_MMRDY_Field is RP2350.Bit;
   subtype FPCCR_BFRDY_Field is RP2350.Bit;
   subtype FPCCR_SFRDY_Field is RP2350.Bit;
   subtype FPCCR_MONRDY_Field is RP2350.Bit;
   subtype FPCCR_SPLIMVIOL_Field is RP2350.Bit;
   subtype FPCCR_UFRDY_Field is RP2350.Bit;
   subtype FPCCR_TS_Field is RP2350.Bit;
   subtype FPCCR_CLRONRETS_Field is RP2350.Bit;
   subtype FPCCR_CLRONRET_Field is RP2350.Bit;
   subtype FPCCR_LSPENS_Field is RP2350.Bit;
   subtype FPCCR_LSPEN_Field is RP2350.Bit;
   subtype FPCCR_ASPEN_Field is RP2350.Bit;

   --  Holds control data for the Floating-point extension
   type FPCCR_Register is record
      --  Indicates whether lazy preservation of the floating-point state is
      --  active
      LSPACT         : FPCCR_LSPACT_Field := 16#0#;
      --  Indicates the privilege level of the software executing when the PE
      --  allocated the floating-point stack frame
      USER           : FPCCR_USER_Field := 16#1#;
      --  Security status of the floating-point context. This bit is only
      --  present in the Secure version of the register, and behaves as RAZ/WI
      --  when accessed from the Non-secure state. This bit is updated whenever
      --  lazy state preservation is activated, or when a floating-point
      --  instruction is executed
      S              : FPCCR_S_Field := 16#0#;
      --  Indicates the PE mode when it allocated the floating-point stack
      --  frame
      THREAD         : FPCCR_THREAD_Field := 16#0#;
      --  Indicates whether the software executing when the PE allocated the
      --  floating-point stack frame was able to set the HardFault exception to
      --  pending
      HFRDY          : FPCCR_HFRDY_Field := 16#1#;
      --  Indicates whether the software executing when the PE allocated the
      --  floating-point stack frame was able to set the MemManage exception to
      --  pending
      MMRDY          : FPCCR_MMRDY_Field := 16#1#;
      --  Indicates whether the software executing when the PE allocated the
      --  floating-point stack frame was able to set the BusFault exception to
      --  pending
      BFRDY          : FPCCR_BFRDY_Field := 16#1#;
      --  Indicates whether the software executing when the PE allocated the
      --  floating-point stack frame was able to set the SecureFault exception
      --  to pending. This bit is only present in the Secure version of the
      --  register, and behaves as RAZ/WI when accessed from the Non-secure
      --  state
      SFRDY          : FPCCR_SFRDY_Field := 16#0#;
      --  Indicates whether the software executing when the PE allocated the
      --  floating-point stack frame was able to set the DebugMonitor exception
      --  to pending
      MONRDY         : FPCCR_MONRDY_Field := 16#0#;
      --  This bit is banked between the Security states and indicates whether
      --  the floating-point context violates the stack pointer limit that was
      --  active when lazy state preservation was activated. SPLIMVIOL modifies
      --  the lazy floating-point state preservation behavior
      SPLIMVIOL      : FPCCR_SPLIMVIOL_Field := 16#0#;
      --  Indicates whether the software executing when the PE allocated the
      --  floating-point stack frame was able to set the UsageFault exception
      --  to pending
      UFRDY          : FPCCR_UFRDY_Field := 16#1#;
      --  unspecified
      Reserved_11_25 : RP2350.UInt15 := 16#0#;
      --  Treat floating-point registers as Secure enable
      TS             : FPCCR_TS_Field := 16#0#;
      --  This bit controls whether the CLRONRET bit is writeable from the
      --  Non-secure state
      CLRONRETS      : FPCCR_CLRONRETS_Field := 16#0#;
      --  Clear floating-point caller saved registers on exception return
      CLRONRET       : FPCCR_CLRONRET_Field := 16#0#;
      --  This bit controls whether the LSPEN bit is writeable from the
      --  Non-secure state
      LSPENS         : FPCCR_LSPENS_Field := 16#1#;
      --  Enables lazy context save of floating-point state
      LSPEN          : FPCCR_LSPEN_Field := 16#0#;
      --  When this bit is set to 1, execution of a floating-point instruction
      --  sets the CONTROL.FPCA bit to 1
      ASPEN          : FPCCR_ASPEN_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPCCR_Register use record
      LSPACT         at 0 range 0 .. 0;
      USER           at 0 range 1 .. 1;
      S              at 0 range 2 .. 2;
      THREAD         at 0 range 3 .. 3;
      HFRDY          at 0 range 4 .. 4;
      MMRDY          at 0 range 5 .. 5;
      BFRDY          at 0 range 6 .. 6;
      SFRDY          at 0 range 7 .. 7;
      MONRDY         at 0 range 8 .. 8;
      SPLIMVIOL      at 0 range 9 .. 9;
      UFRDY          at 0 range 10 .. 10;
      Reserved_11_25 at 0 range 11 .. 25;
      TS             at 0 range 26 .. 26;
      CLRONRETS      at 0 range 27 .. 27;
      CLRONRET       at 0 range 28 .. 28;
      LSPENS         at 0 range 29 .. 29;
      LSPEN          at 0 range 30 .. 30;
      ASPEN          at 0 range 31 .. 31;
   end record;

   subtype FPCAR_ADDRESS_Field is RP2350.UInt29;

   --  Holds the location of the unpopulated floating-point register space
   --  allocated on an exception stack frame
   type FPCAR_Register is record
      --  unspecified
      Reserved_0_2 : RP2350.UInt3 := 16#0#;
      --  The location of the unpopulated floating-point register space
      --  allocated on an exception stack frame
      ADDRESS      : FPCAR_ADDRESS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPCAR_Register use record
      Reserved_0_2 at 0 range 0 .. 2;
      ADDRESS      at 0 range 3 .. 31;
   end record;

   subtype FPDSCR_RMODE_Field is RP2350.UInt2;
   subtype FPDSCR_FZ_Field is RP2350.Bit;
   subtype FPDSCR_DN_Field is RP2350.Bit;
   subtype FPDSCR_AHP_Field is RP2350.Bit;

   --  Holds the default values for the floating-point status control data that
   --  the PE assigns to the FPSCR when it creates a new floating-point context
   type FPDSCR_Register is record
      --  unspecified
      Reserved_0_21  : RP2350.UInt22 := 16#0#;
      --  Default value for FPSCR.RMode
      RMODE          : FPDSCR_RMODE_Field := 16#0#;
      --  Default value for FPSCR.FZ
      FZ             : FPDSCR_FZ_Field := 16#0#;
      --  Default value for FPSCR.DN
      DN             : FPDSCR_DN_Field := 16#0#;
      --  Default value for FPSCR.AHP
      AHP            : FPDSCR_AHP_Field := 16#0#;
      --  unspecified
      Reserved_27_31 : RP2350.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for FPDSCR_Register use record
      Reserved_0_21  at 0 range 0 .. 21;
      RMODE          at 0 range 22 .. 23;
      FZ             at 0 range 24 .. 24;
      DN             at 0 range 25 .. 25;
      AHP            at 0 range 26 .. 26;
      Reserved_27_31 at 0 range 27 .. 31;
   end record;

   subtype MVFR0_SIMDREG_Field is RP2350.UInt4;
   subtype MVFR0_FPSP_Field is RP2350.UInt4;
   subtype MVFR0_FPDP_Field is RP2350.UInt4;
   subtype MVFR0_FPDIVIDE_Field is RP2350.UInt4;
   subtype MVFR0_FPSQRT_Field is RP2350.UInt4;
   subtype MVFR0_FPROUND_Field is RP2350.UInt4;

   --  Describes the features provided by the Floating-point Extension
   type MVFR0_Register is record
      --  Read-only. Indicates size of FP register file
      SIMDREG        : MVFR0_SIMDREG_Field;
      --  Read-only. Indicates support for FP single-precision operations
      FPSP           : MVFR0_FPSP_Field;
      --  Read-only. Indicates support for FP double-precision operations
      FPDP           : MVFR0_FPDP_Field;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4;
      --  Read-only. Indicates the support for FP divide operations
      FPDIVIDE       : MVFR0_FPDIVIDE_Field;
      --  Read-only. Indicates the support for FP square root operations
      FPSQRT         : MVFR0_FPSQRT_Field;
      --  unspecified
      Reserved_24_27 : RP2350.UInt4;
      --  Read-only. Indicates the rounding modes supported by the FP Extension
      FPROUND        : MVFR0_FPROUND_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MVFR0_Register use record
      SIMDREG        at 0 range 0 .. 3;
      FPSP           at 0 range 4 .. 7;
      FPDP           at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      FPDIVIDE       at 0 range 16 .. 19;
      FPSQRT         at 0 range 20 .. 23;
      Reserved_24_27 at 0 range 24 .. 27;
      FPROUND        at 0 range 28 .. 31;
   end record;

   subtype MVFR1_FPFTZ_Field is RP2350.UInt4;
   subtype MVFR1_FPDNAN_Field is RP2350.UInt4;
   subtype MVFR1_FPHP_Field is RP2350.UInt4;
   subtype MVFR1_FMAC_Field is RP2350.UInt4;

   --  Describes the features provided by the Floating-point Extension
   type MVFR1_Register is record
      --  Read-only. Indicates whether subnormals are always flushed-to-zero
      FPFTZ         : MVFR1_FPFTZ_Field;
      --  Read-only. Indicates whether the FP hardware implementation supports
      --  NaN propagation
      FPDNAN        : MVFR1_FPDNAN_Field;
      --  unspecified
      Reserved_8_23 : RP2350.UInt16;
      --  Read-only. Indicates whether the FP Extension implements
      --  half-precision FP conversion instructions
      FPHP          : MVFR1_FPHP_Field;
      --  Read-only. Indicates whether the FP Extension implements the fused
      --  multiply accumulate instructions
      FMAC          : MVFR1_FMAC_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MVFR1_Register use record
      FPFTZ         at 0 range 0 .. 3;
      FPDNAN        at 0 range 4 .. 7;
      Reserved_8_23 at 0 range 8 .. 23;
      FPHP          at 0 range 24 .. 27;
      FMAC          at 0 range 28 .. 31;
   end record;

   subtype MVFR2_FPMISC_Field is RP2350.UInt4;

   --  Describes the features provided by the Floating-point Extension
   type MVFR2_Register is record
      --  unspecified
      Reserved_0_3  : RP2350.UInt4;
      --  Read-only. Indicates support for miscellaneous FP features
      FPMISC        : MVFR2_FPMISC_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for MVFR2_Register use record
      Reserved_0_3  at 0 range 0 .. 3;
      FPMISC        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DDEVARCH_ARCHPART_Field is RP2350.UInt12;
   subtype DDEVARCH_ARCHVER_Field is RP2350.UInt4;
   subtype DDEVARCH_REVISION_Field is RP2350.UInt4;
   subtype DDEVARCH_PRESENT_Field is RP2350.Bit;
   subtype DDEVARCH_ARCHITECT_Field is RP2350.UInt11;

   --  Provides CoreSight discovery information for the SCS
   type DDEVARCH_Register is record
      --  Read-only. Defines the architecture of the component
      ARCHPART  : DDEVARCH_ARCHPART_Field;
      --  Read-only. Defines the architecture version of the component
      ARCHVER   : DDEVARCH_ARCHVER_Field;
      --  Read-only. Defines the architecture revision of the component
      REVISION  : DDEVARCH_REVISION_Field;
      --  Read-only. Defines that the DEVARCH register is present
      PRESENT   : DDEVARCH_PRESENT_Field;
      --  Read-only. Defines the architect of the component. Bits [31:28] are
      --  the JEP106 continuation code (JEP106 bank ID, minus 1) and bits
      --  [27:21] are the JEP106 ID code.
      ARCHITECT : DDEVARCH_ARCHITECT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DDEVARCH_Register use record
      ARCHPART  at 0 range 0 .. 11;
      ARCHVER   at 0 range 12 .. 15;
      REVISION  at 0 range 16 .. 19;
      PRESENT   at 0 range 20 .. 20;
      ARCHITECT at 0 range 21 .. 31;
   end record;

   subtype DDEVTYPE_MAJOR_Field is RP2350.UInt4;
   subtype DDEVTYPE_SUB_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the SCS
   type DDEVTYPE_Register is record
      --  Read-only. CoreSight major type
      MAJOR         : DDEVTYPE_MAJOR_Field;
      --  Read-only. Component sub-type
      SUB           : DDEVTYPE_SUB_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DDEVTYPE_Register use record
      MAJOR         at 0 range 0 .. 3;
      SUB           at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DPIDR4_DES_2_Field is RP2350.UInt4;
   subtype DPIDR4_SIZE_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the SCS
   type DPIDR4_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_2         : DPIDR4_DES_2_Field;
      --  Read-only. See CoreSight Architecture Specification
      SIZE          : DPIDR4_SIZE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DPIDR4_Register use record
      DES_2         at 0 range 0 .. 3;
      SIZE          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DPIDR0_PART_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the SCS
   type DPIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_0        : DPIDR0_PART_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DPIDR0_Register use record
      PART_0        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DPIDR1_PART_1_Field is RP2350.UInt4;
   subtype DPIDR1_DES_0_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the SCS
   type DPIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PART_1        : DPIDR1_PART_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      DES_0         : DPIDR1_DES_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DPIDR1_Register use record
      PART_1        at 0 range 0 .. 3;
      DES_0         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DPIDR2_DES_1_Field is RP2350.UInt3;
   subtype DPIDR2_JEDEC_Field is RP2350.Bit;
   subtype DPIDR2_REVISION_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the SCS
   type DPIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      DES_1         : DPIDR2_DES_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      JEDEC         : DPIDR2_JEDEC_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVISION      : DPIDR2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DPIDR2_Register use record
      DES_1         at 0 range 0 .. 2;
      JEDEC         at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DPIDR3_CMOD_Field is RP2350.UInt4;
   subtype DPIDR3_REVAND_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the SCS
   type DPIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      CMOD          : DPIDR3_CMOD_Field;
      --  Read-only. See CoreSight Architecture Specification
      REVAND        : DPIDR3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DPIDR3_Register use record
      CMOD          at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DCIDR0_PRMBL_0_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the SCS
   type DCIDR0_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_0       : DCIDR0_PRMBL_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCIDR0_Register use record
      PRMBL_0       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DCIDR1_PRMBL_1_Field is RP2350.UInt4;
   subtype DCIDR1_CLASS_Field is RP2350.UInt4;

   --  Provides CoreSight discovery information for the SCS
   type DCIDR1_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_1       : DCIDR1_PRMBL_1_Field;
      --  Read-only. See CoreSight Architecture Specification
      CLASS         : DCIDR1_CLASS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCIDR1_Register use record
      PRMBL_1       at 0 range 0 .. 3;
      CLASS         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DCIDR2_PRMBL_2_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the SCS
   type DCIDR2_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_2       : DCIDR2_PRMBL_2_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCIDR2_Register use record
      PRMBL_2       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype DCIDR3_PRMBL_3_Field is RP2350.Byte;

   --  Provides CoreSight discovery information for the SCS
   type DCIDR3_Register is record
      --  Read-only. See CoreSight Architecture Specification
      PRMBL_3       : DCIDR3_PRMBL_3_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DCIDR3_Register use record
      PRMBL_3       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCPRGCTLR_EN_Field is RP2350.Bit;

   --  Programming Control Register
   type TRCPRGCTLR_Register is record
      --  Trace Unit Enable
      EN            : TRCPRGCTLR_EN_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : RP2350.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPRGCTLR_Register use record
      EN            at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype TRCSTATR_IDLE_Field is RP2350.Bit;
   subtype TRCSTATR_PMSTABLE_Field is RP2350.Bit;

   --  The TRCSTATR indicates the ETM-Teal status
   type TRCSTATR_Register is record
      --  Read-only. Indicates that the trace unit is inactive
      IDLE          : TRCSTATR_IDLE_Field;
      --  Read-only. Indicates whether the ETM-Teal registers are stable and
      --  can be read
      PMSTABLE      : TRCSTATR_PMSTABLE_Field;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCSTATR_Register use record
      IDLE          at 0 range 0 .. 0;
      PMSTABLE      at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TRCCONFIGR_BB_Field is RP2350.Bit;
   subtype TRCCONFIGR_CCI_Field is RP2350.Bit;
   subtype TRCCONFIGR_COND_Field is RP2350.UInt6;
   subtype TRCCONFIGR_TS_Field is RP2350.Bit;
   subtype TRCCONFIGR_RS_Field is RP2350.Bit;

   --  The TRCCONFIGR sets the basic tracing options for the trace unit
   type TRCCONFIGR_Register is record
      --  unspecified
      Reserved_0_2   : RP2350.UInt3 := 16#0#;
      --  Branch broadcast mode
      BB             : TRCCONFIGR_BB_Field := 16#0#;
      --  Cycle counting in instruction trace
      CCI            : TRCCONFIGR_CCI_Field := 16#0#;
      --  Conditional instruction tracing
      COND           : TRCCONFIGR_COND_Field := 16#0#;
      --  Global timestamp tracing
      TS             : TRCCONFIGR_TS_Field := 16#0#;
      --  Return stack enable
      RS             : TRCCONFIGR_RS_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : RP2350.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCONFIGR_Register use record
      Reserved_0_2   at 0 range 0 .. 2;
      BB             at 0 range 3 .. 3;
      CCI            at 0 range 4 .. 4;
      COND           at 0 range 5 .. 10;
      TS             at 0 range 11 .. 11;
      RS             at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype TRCEVENTCTL0R_SEL0_Field is RP2350.UInt3;
   subtype TRCEVENTCTL0R_TYPE0_Field is RP2350.Bit;
   subtype TRCEVENTCTL0R_SEL1_Field is RP2350.UInt3;
   subtype TRCEVENTCTL0R_TYPE1_Field is RP2350.Bit;

   --  The TRCEVENTCTL0R controls the tracing of events in the trace stream.
   --  The events also drive the ETM-Teal external outputs.
   type TRCEVENTCTL0R_Register is record
      --  Selects the resource number, based on the value of TYPE0: When TYPE1
      --  is 0, selects a single selected resource from 0-15 defined by
      --  SEL0[2:0]. When TYPE1 is 1, selects a Boolean combined resource pair
      --  from 0-7 defined by SEL0[2:0]
      SEL0           : TRCEVENTCTL0R_SEL0_Field := 16#0#;
      --  unspecified
      Reserved_3_6   : RP2350.UInt4 := 16#0#;
      --  Selects the resource type for event 0
      TYPE0          : TRCEVENTCTL0R_TYPE0_Field := 16#0#;
      --  Selects the resource number, based on the value of TYPE1: When TYPE1
      --  is 0, selects a single selected resource from 0-15 defined by
      --  SEL1[2:0]. When TYPE1 is 1, selects a Boolean combined resource pair
      --  from 0-7 defined by SEL1[2:0]
      SEL1           : TRCEVENTCTL0R_SEL1_Field := 16#0#;
      --  unspecified
      Reserved_11_14 : RP2350.UInt4 := 16#0#;
      --  Selects the resource type for event 1
      TYPE1          : TRCEVENTCTL0R_TYPE1_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : RP2350.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCEVENTCTL0R_Register use record
      SEL0           at 0 range 0 .. 2;
      Reserved_3_6   at 0 range 3 .. 6;
      TYPE0          at 0 range 7 .. 7;
      SEL1           at 0 range 8 .. 10;
      Reserved_11_14 at 0 range 11 .. 14;
      TYPE1          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  TRCEVENTCTL1R_INSTEN array element
   subtype TRCEVENTCTL1R_INSTEN_Element is RP2350.Bit;

   --  TRCEVENTCTL1R_INSTEN array
   type TRCEVENTCTL1R_INSTEN_Field_Array is array (0 .. 1)
     of TRCEVENTCTL1R_INSTEN_Element
     with Component_Size => 1, Size => 2;

   --  Type definition for TRCEVENTCTL1R_INSTEN
   type TRCEVENTCTL1R_INSTEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  INSTEN as a value
            Val : RP2350.UInt2;
         when True =>
            --  INSTEN as an array
            Arr : TRCEVENTCTL1R_INSTEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 2;

   for TRCEVENTCTL1R_INSTEN_Field use record
      Val at 0 range 0 .. 1;
      Arr at 0 range 0 .. 1;
   end record;

   subtype TRCEVENTCTL1R_ATB_Field is RP2350.Bit;
   subtype TRCEVENTCTL1R_LPOVERRIDE_Field is RP2350.Bit;

   --  The TRCEVENTCTL1R controls how the events selected by TRCEVENTCTL0R
   --  behave
   type TRCEVENTCTL1R_Register is record
      --  One bit per event, to enable generation of an event element in the
      --  instruction trace stream when the selected event occurs
      INSTEN         : TRCEVENTCTL1R_INSTEN_Field :=
                        (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_2_10  : RP2350.UInt9 := 16#0#;
      --  ATB enabled
      ATB            : TRCEVENTCTL1R_ATB_Field := 16#0#;
      --  Low power state behavior override
      LPOVERRIDE     : TRCEVENTCTL1R_LPOVERRIDE_Field := 16#0#;
      --  unspecified
      Reserved_13_31 : RP2350.UInt19 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCEVENTCTL1R_Register use record
      INSTEN         at 0 range 0 .. 1;
      Reserved_2_10  at 0 range 2 .. 10;
      ATB            at 0 range 11 .. 11;
      LPOVERRIDE     at 0 range 12 .. 12;
      Reserved_13_31 at 0 range 13 .. 31;
   end record;

   subtype TRCSTALLCTLR_LEVEL_Field is RP2350.UInt2;
   subtype TRCSTALLCTLR_ISTALL_Field is RP2350.Bit;
   subtype TRCSTALLCTLR_INSTPRIORITY_Field is RP2350.Bit;

   --  The TRCSTALLCTLR enables ETM-Teal to stall the processor if the ETM-Teal
   --  FIFO goes over the programmed level to minimize risk of overflow
   type TRCSTALLCTLR_Register is record
      --  unspecified
      Reserved_0_1   : RP2350.UInt2 := 16#0#;
      --  Threshold at which stalling becomes active. This provides four
      --  levels. This level can be varied to optimize the level of invasion
      --  caused by stalling, balanced against the risk of a FIFO overflow
      LEVEL          : TRCSTALLCTLR_LEVEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : RP2350.UInt4 := 16#0#;
      --  Stall processor based on instruction trace buffer space
      ISTALL         : TRCSTALLCTLR_ISTALL_Field := 16#0#;
      --  unspecified
      Reserved_9_9   : RP2350.Bit := 16#0#;
      --  Read-only. Reserved, RES0
      INSTPRIORITY   : TRCSTALLCTLR_INSTPRIORITY_Field := 16#0#;
      --  unspecified
      Reserved_11_31 : RP2350.UInt21 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCSTALLCTLR_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      LEVEL          at 0 range 2 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      ISTALL         at 0 range 8 .. 8;
      Reserved_9_9   at 0 range 9 .. 9;
      INSTPRIORITY   at 0 range 10 .. 10;
      Reserved_11_31 at 0 range 11 .. 31;
   end record;

   subtype TRCTSCTLR_SEL0_Field is RP2350.UInt2;
   subtype TRCTSCTLR_TYPE0_Field is RP2350.Bit;

   --  The TRCTSCTLR controls the insertion of global timestamps into the trace
   --  stream. A timestamp is always inserted into the instruction trace stream
   type TRCTSCTLR_Register is record
      --  Selects the resource number, based on the value of TYPE0: When TYPE1
      --  is 0, selects a single selected resource from 0-15 defined by
      --  SEL0[2:0]. When TYPE1 is 1, selects a Boolean combined resource pair
      --  from 0-7 defined by SEL0[2:0]
      SEL0          : TRCTSCTLR_SEL0_Field := 16#0#;
      --  unspecified
      Reserved_2_6  : RP2350.UInt5 := 16#0#;
      --  Selects the resource type for event 0
      TYPE0         : TRCTSCTLR_TYPE0_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCTSCTLR_Register use record
      SEL0          at 0 range 0 .. 1;
      Reserved_2_6  at 0 range 2 .. 6;
      TYPE0         at 0 range 7 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCSYNCPR_PERIOD_Field is RP2350.UInt5;

   --  The TRCSYNCPR specifies the period of trace synchronization of the trace
   --  streams. TRCSYNCPR defines a number of bytes of trace between requests
   --  for trace synchronization. This value is always a power of two
   type TRCSYNCPR_Register is record
      --  Read-only. Defines the number of bytes of trace between trace
      --  synchronization requests as a total of the number of bytes generated
      --  by the instruction stream. The number of bytes is 2N where N is the
      --  value of this field: - A value of zero disables these periodic trace
      --  synchronization requests, but does not disable other trace
      --  synchronization requests. - The minimum value that can be programmed,
      --  other than zero, is 8, providing a minimum trace synchronization
      --  period of 256 bytes. - The maximum value is 20, providing a maximum
      --  trace synchronization period of 2^20 bytes
      PERIOD        : TRCSYNCPR_PERIOD_Field;
      --  unspecified
      Reserved_5_31 : RP2350.UInt27;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCSYNCPR_Register use record
      PERIOD        at 0 range 0 .. 4;
      Reserved_5_31 at 0 range 5 .. 31;
   end record;

   subtype TRCCCCTLR_THRESHOLD_Field is RP2350.UInt12;

   --  The TRCCCCTLR sets the threshold value for instruction trace cycle
   --  counting. The threshold represents the minimum interval between cycle
   --  count trace packets
   type TRCCCCTLR_Register is record
      --  Instruction trace cycle count threshold
      THRESHOLD      : TRCCCCTLR_THRESHOLD_Field := 16#0#;
      --  unspecified
      Reserved_12_31 : RP2350.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCCCTLR_Register use record
      THRESHOLD      at 0 range 0 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TRCVICTLR_SEL0_Field is RP2350.UInt2;
   subtype TRCVICTLR_TYPE0_Field is RP2350.Bit;
   subtype TRCVICTLR_SSSTATUS_Field is RP2350.Bit;
   subtype TRCVICTLR_TRCRESET_Field is RP2350.Bit;
   subtype TRCVICTLR_TRCERR_Field is RP2350.Bit;
   subtype TRCVICTLR_EXLEVEL_S0_Field is RP2350.Bit;
   subtype TRCVICTLR_EXLEVEL_S3_Field is RP2350.Bit;

   --  The TRCVICTLR controls instruction trace filtering
   type TRCVICTLR_Register is record
      --  Selects the resource number, based on the value of TYPE0: When TYPE1
      --  is 0, selects a single selected resource from 0-15 defined by
      --  SEL0[2:0]. When TYPE1 is 1, selects a Boolean combined resource pair
      --  from 0-7 defined by SEL0[2:0]
      SEL0           : TRCVICTLR_SEL0_Field := 16#0#;
      --  unspecified
      Reserved_2_6   : RP2350.UInt5 := 16#0#;
      --  Selects the resource type for event 0
      TYPE0          : TRCVICTLR_TYPE0_Field := 16#0#;
      --  unspecified
      Reserved_8_8   : RP2350.Bit := 16#0#;
      --  Indicates the current status of the start/stop logic
      SSSTATUS       : TRCVICTLR_SSSTATUS_Field := 16#0#;
      --  Selects whether a reset exception must always be traced
      TRCRESET       : TRCVICTLR_TRCRESET_Field := 16#0#;
      --  Selects whether a system error exception must always be traced
      TRCERR         : TRCVICTLR_TRCERR_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4 := 16#0#;
      --  In Secure state, each bit controls whether instruction tracing is
      --  enabled for the corresponding exception level
      EXLEVEL_S0     : TRCVICTLR_EXLEVEL_S0_Field := 16#0#;
      --  unspecified
      Reserved_17_18 : RP2350.UInt2 := 16#0#;
      --  In Secure state, each bit controls whether instruction tracing is
      --  enabled for the corresponding exception level
      EXLEVEL_S3     : TRCVICTLR_EXLEVEL_S3_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : RP2350.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCVICTLR_Register use record
      SEL0           at 0 range 0 .. 1;
      Reserved_2_6   at 0 range 2 .. 6;
      TYPE0          at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      SSSTATUS       at 0 range 9 .. 9;
      TRCRESET       at 0 range 10 .. 10;
      TRCERR         at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      EXLEVEL_S0     at 0 range 16 .. 16;
      Reserved_17_18 at 0 range 17 .. 18;
      EXLEVEL_S3     at 0 range 19 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype TRCCNTRLDVR0_VALUE_Field is RP2350.UInt16;

   --  The TRCCNTRLDVR defines the reload value for the reduced function
   --  counter
   type TRCCNTRLDVR0_Register is record
      --  Defines the reload value for the counter. This value is loaded into
      --  the counter each time the reload event occurs
      VALUE          : TRCCNTRLDVR0_VALUE_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : RP2350.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCNTRLDVR0_Register use record
      VALUE          at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TRCIMSPEC_SUPPORT_Field is RP2350.UInt4;

   --  The TRCIMSPEC shows the presence of any IMPLEMENTATION SPECIFIC
   --  features, and enables any features that are provided
   type TRCIMSPEC_Register is record
      --  Read-only. Reserved, RES0
      SUPPORT       : TRCIMSPEC_SUPPORT_Field;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIMSPEC_Register use record
      SUPPORT       at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TRCIDR0_RES1_Field is RP2350.Bit;
   subtype TRCIDR0_INSTP0_Field is RP2350.UInt2;
   subtype TRCIDR0_TRCDATA_Field is RP2350.UInt2;
   subtype TRCIDR0_TRCBB_Field is RP2350.Bit;
   subtype TRCIDR0_TRCCOND_Field is RP2350.Bit;
   subtype TRCIDR0_TRCCCI_Field is RP2350.Bit;
   subtype TRCIDR0_RETSTACK_Field is RP2350.Bit;
   subtype TRCIDR0_NUMEVENT_Field is RP2350.UInt2;
   subtype TRCIDR0_CONDTYPE_Field is RP2350.UInt2;
   subtype TRCIDR0_QFILT_Field is RP2350.Bit;
   subtype TRCIDR0_QSUPP_Field is RP2350.UInt2;
   subtype TRCIDR0_TRCEXDATA_Field is RP2350.Bit;
   subtype TRCIDR0_TSSIZE_Field is RP2350.UInt5;
   subtype TRCIDR0_COMMOPT_Field is RP2350.Bit;

   --  TRCIDR0
   type TRCIDR0_Register is record
      --  Read-only. Reserved, RES1
      RES1           : TRCIDR0_RES1_Field;
      --  Read-only. reads as `ImpDef
      INSTP0         : TRCIDR0_INSTP0_Field;
      --  Read-only. reads as `ImpDef
      TRCDATA        : TRCIDR0_TRCDATA_Field;
      --  Read-only. reads as `ImpDef
      TRCBB          : TRCIDR0_TRCBB_Field;
      --  Read-only. reads as `ImpDef
      TRCCOND        : TRCIDR0_TRCCOND_Field;
      --  Read-only. reads as `ImpDef
      TRCCCI         : TRCIDR0_TRCCCI_Field;
      --  unspecified
      Reserved_8_8   : RP2350.Bit;
      --  Read-only. reads as `ImpDef
      RETSTACK       : TRCIDR0_RETSTACK_Field;
      --  Read-only. reads as `ImpDef
      NUMEVENT       : TRCIDR0_NUMEVENT_Field;
      --  Read-only. reads as `ImpDef
      CONDTYPE       : TRCIDR0_CONDTYPE_Field;
      --  Read-only. reads as `ImpDef
      QFILT          : TRCIDR0_QFILT_Field;
      --  Read-only. reads as `ImpDef
      QSUPP          : TRCIDR0_QSUPP_Field;
      --  Read-only. reads as `ImpDef
      TRCEXDATA      : TRCIDR0_TRCEXDATA_Field;
      --  unspecified
      Reserved_18_23 : RP2350.UInt6;
      --  Read-only. reads as `ImpDef
      TSSIZE         : TRCIDR0_TSSIZE_Field;
      --  Read-only. reads as `ImpDef
      COMMOPT        : TRCIDR0_COMMOPT_Field;
      --  unspecified
      Reserved_30_31 : RP2350.UInt2;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIDR0_Register use record
      RES1           at 0 range 0 .. 0;
      INSTP0         at 0 range 1 .. 2;
      TRCDATA        at 0 range 3 .. 4;
      TRCBB          at 0 range 5 .. 5;
      TRCCOND        at 0 range 6 .. 6;
      TRCCCI         at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      RETSTACK       at 0 range 9 .. 9;
      NUMEVENT       at 0 range 10 .. 11;
      CONDTYPE       at 0 range 12 .. 13;
      QFILT          at 0 range 14 .. 14;
      QSUPP          at 0 range 15 .. 16;
      TRCEXDATA      at 0 range 17 .. 17;
      Reserved_18_23 at 0 range 18 .. 23;
      TSSIZE         at 0 range 24 .. 28;
      COMMOPT        at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   subtype TRCIDR1_REVISION_Field is RP2350.UInt4;
   subtype TRCIDR1_TRCARCHMIN_Field is RP2350.UInt4;
   subtype TRCIDR1_TRCARCHMAJ_Field is RP2350.UInt4;
   subtype TRCIDR1_RES1_Field is RP2350.UInt4;
   subtype TRCIDR1_DESIGNER_Field is RP2350.Byte;

   --  TRCIDR1
   type TRCIDR1_Register is record
      --  Read-only. reads as `ImpDef
      REVISION       : TRCIDR1_REVISION_Field;
      --  Read-only. reads as 0b0000
      TRCARCHMIN     : TRCIDR1_TRCARCHMIN_Field;
      --  Read-only. reads as 0b0100
      TRCARCHMAJ     : TRCIDR1_TRCARCHMAJ_Field;
      --  Read-only. Reserved, RES1
      RES1           : TRCIDR1_RES1_Field;
      --  unspecified
      Reserved_16_23 : RP2350.Byte;
      --  Read-only. reads as `ImpDef
      DESIGNER       : TRCIDR1_DESIGNER_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIDR1_Register use record
      REVISION       at 0 range 0 .. 3;
      TRCARCHMIN     at 0 range 4 .. 7;
      TRCARCHMAJ     at 0 range 8 .. 11;
      RES1           at 0 range 12 .. 15;
      Reserved_16_23 at 0 range 16 .. 23;
      DESIGNER       at 0 range 24 .. 31;
   end record;

   subtype TRCIDR2_IASIZE_Field is RP2350.UInt5;
   subtype TRCIDR2_CIDSIZE_Field is RP2350.UInt5;
   subtype TRCIDR2_VMIDSIZE_Field is RP2350.UInt5;
   subtype TRCIDR2_DASIZE_Field is RP2350.UInt5;
   subtype TRCIDR2_DVSIZE_Field is RP2350.UInt5;
   subtype TRCIDR2_CCSIZE_Field is RP2350.UInt4;

   --  TRCIDR2
   type TRCIDR2_Register is record
      --  Read-only. reads as `ImpDef
      IASIZE         : TRCIDR2_IASIZE_Field;
      --  Read-only. reads as `ImpDef
      CIDSIZE        : TRCIDR2_CIDSIZE_Field;
      --  Read-only. reads as `ImpDef
      VMIDSIZE       : TRCIDR2_VMIDSIZE_Field;
      --  Read-only. reads as `ImpDef
      DASIZE         : TRCIDR2_DASIZE_Field;
      --  Read-only. reads as `ImpDef
      DVSIZE         : TRCIDR2_DVSIZE_Field;
      --  Read-only. reads as `ImpDef
      CCSIZE         : TRCIDR2_CCSIZE_Field;
      --  unspecified
      Reserved_29_31 : RP2350.UInt3;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIDR2_Register use record
      IASIZE         at 0 range 0 .. 4;
      CIDSIZE        at 0 range 5 .. 9;
      VMIDSIZE       at 0 range 10 .. 14;
      DASIZE         at 0 range 15 .. 19;
      DVSIZE         at 0 range 20 .. 24;
      CCSIZE         at 0 range 25 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   subtype TRCIDR3_CCITMIN_Field is RP2350.UInt12;
   subtype TRCIDR3_EXLEVEL_S_Field is RP2350.UInt4;
   subtype TRCIDR3_EXLEVEL_NS_Field is RP2350.UInt4;
   subtype TRCIDR3_TRCERR_Field is RP2350.Bit;
   subtype TRCIDR3_SYNCPR_Field is RP2350.Bit;
   subtype TRCIDR3_STALLCTL_Field is RP2350.Bit;
   subtype TRCIDR3_SYSSTALL_Field is RP2350.Bit;
   subtype TRCIDR3_NUMPROC_Field is RP2350.UInt3;
   subtype TRCIDR3_NOOVERFLOW_Field is RP2350.Bit;

   --  TRCIDR3
   type TRCIDR3_Register is record
      --  Read-only. reads as `ImpDef
      CCITMIN        : TRCIDR3_CCITMIN_Field;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4;
      --  Read-only. reads as `ImpDef
      EXLEVEL_S      : TRCIDR3_EXLEVEL_S_Field;
      --  Read-only. reads as `ImpDef
      EXLEVEL_NS     : TRCIDR3_EXLEVEL_NS_Field;
      --  Read-only. reads as `ImpDef
      TRCERR         : TRCIDR3_TRCERR_Field;
      --  Read-only. reads as `ImpDef
      SYNCPR         : TRCIDR3_SYNCPR_Field;
      --  Read-only. reads as `ImpDef
      STALLCTL       : TRCIDR3_STALLCTL_Field;
      --  Read-only. reads as `ImpDef
      SYSSTALL       : TRCIDR3_SYSSTALL_Field;
      --  Read-only. reads as `ImpDef
      NUMPROC        : TRCIDR3_NUMPROC_Field;
      --  Read-only. reads as `ImpDef
      NOOVERFLOW     : TRCIDR3_NOOVERFLOW_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIDR3_Register use record
      CCITMIN        at 0 range 0 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      EXLEVEL_S      at 0 range 16 .. 19;
      EXLEVEL_NS     at 0 range 20 .. 23;
      TRCERR         at 0 range 24 .. 24;
      SYNCPR         at 0 range 25 .. 25;
      STALLCTL       at 0 range 26 .. 26;
      SYSSTALL       at 0 range 27 .. 27;
      NUMPROC        at 0 range 28 .. 30;
      NOOVERFLOW     at 0 range 31 .. 31;
   end record;

   subtype TRCIDR4_NUMACPAIRS_Field is RP2350.UInt4;
   subtype TRCIDR4_NUMDVC_Field is RP2350.UInt4;
   subtype TRCIDR4_SUPPDAC_Field is RP2350.Bit;
   subtype TRCIDR4_NUMPC_Field is RP2350.UInt4;
   subtype TRCIDR4_NUMRSPAIR_Field is RP2350.UInt4;
   subtype TRCIDR4_NUMSSCC_Field is RP2350.UInt4;
   subtype TRCIDR4_NUMCIDC_Field is RP2350.UInt4;
   subtype TRCIDR4_NUMVMIDC_Field is RP2350.UInt4;

   --  TRCIDR4
   type TRCIDR4_Register is record
      --  Read-only. reads as `ImpDef
      NUMACPAIRS    : TRCIDR4_NUMACPAIRS_Field;
      --  Read-only. reads as `ImpDef
      NUMDVC        : TRCIDR4_NUMDVC_Field;
      --  Read-only. reads as `ImpDef
      SUPPDAC       : TRCIDR4_SUPPDAC_Field;
      --  unspecified
      Reserved_9_11 : RP2350.UInt3;
      --  Read-only. reads as `ImpDef
      NUMPC         : TRCIDR4_NUMPC_Field;
      --  Read-only. reads as `ImpDef
      NUMRSPAIR     : TRCIDR4_NUMRSPAIR_Field;
      --  Read-only. reads as `ImpDef
      NUMSSCC       : TRCIDR4_NUMSSCC_Field;
      --  Read-only. reads as `ImpDef
      NUMCIDC       : TRCIDR4_NUMCIDC_Field;
      --  Read-only. reads as `ImpDef
      NUMVMIDC      : TRCIDR4_NUMVMIDC_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIDR4_Register use record
      NUMACPAIRS    at 0 range 0 .. 3;
      NUMDVC        at 0 range 4 .. 7;
      SUPPDAC       at 0 range 8 .. 8;
      Reserved_9_11 at 0 range 9 .. 11;
      NUMPC         at 0 range 12 .. 15;
      NUMRSPAIR     at 0 range 16 .. 19;
      NUMSSCC       at 0 range 20 .. 23;
      NUMCIDC       at 0 range 24 .. 27;
      NUMVMIDC      at 0 range 28 .. 31;
   end record;

   subtype TRCIDR5_NUMEXTIN_Field is RP2350.UInt9;
   subtype TRCIDR5_NUMEXTINSEL_Field is RP2350.UInt3;
   subtype TRCIDR5_TRACEIDSIZE_Field is RP2350.UInt6;
   subtype TRCIDR5_ATBTRIG_Field is RP2350.Bit;
   subtype TRCIDR5_LPOVERRIDE_Field is RP2350.Bit;
   subtype TRCIDR5_NUMSEQSTATE_Field is RP2350.UInt3;
   subtype TRCIDR5_NUMCNTR_Field is RP2350.UInt3;
   subtype TRCIDR5_REDFUNCNTR_Field is RP2350.Bit;

   --  TRCIDR5
   type TRCIDR5_Register is record
      --  Read-only. reads as `ImpDef
      NUMEXTIN       : TRCIDR5_NUMEXTIN_Field;
      --  Read-only. reads as `ImpDef
      NUMEXTINSEL    : TRCIDR5_NUMEXTINSEL_Field;
      --  unspecified
      Reserved_12_15 : RP2350.UInt4;
      --  Read-only. reads as 0x07
      TRACEIDSIZE    : TRCIDR5_TRACEIDSIZE_Field;
      --  Read-only. reads as `ImpDef
      ATBTRIG        : TRCIDR5_ATBTRIG_Field;
      --  Read-only. reads as `ImpDef
      LPOVERRIDE     : TRCIDR5_LPOVERRIDE_Field;
      --  unspecified
      Reserved_24_24 : RP2350.Bit;
      --  Read-only. reads as `ImpDef
      NUMSEQSTATE    : TRCIDR5_NUMSEQSTATE_Field;
      --  Read-only. reads as `ImpDef
      NUMCNTR        : TRCIDR5_NUMCNTR_Field;
      --  Read-only. reads as `ImpDef
      REDFUNCNTR     : TRCIDR5_REDFUNCNTR_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCIDR5_Register use record
      NUMEXTIN       at 0 range 0 .. 8;
      NUMEXTINSEL    at 0 range 9 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TRACEIDSIZE    at 0 range 16 .. 21;
      ATBTRIG        at 0 range 22 .. 22;
      LPOVERRIDE     at 0 range 23 .. 23;
      Reserved_24_24 at 0 range 24 .. 24;
      NUMSEQSTATE    at 0 range 25 .. 27;
      NUMCNTR        at 0 range 28 .. 30;
      REDFUNCNTR     at 0 range 31 .. 31;
   end record;

   subtype TRCRSCTLR_SELECT_Field is RP2350.Byte;
   subtype TRCRSCTLR_GROUP_Field is RP2350.UInt3;
   subtype TRCRSCTLR_INV_Field is RP2350.Bit;
   subtype TRCRSCTLR_PAIRINV_Field is RP2350.Bit;

   --  The TRCRSCTLR controls the trace resources
   type TRCRSCTLR_Register is record
      --  Selects one or more resources from the wanted group. One bit is
      --  provided per resource from the group
      SELECT_k       : TRCRSCTLR_SELECT_Field := 16#0#;
      --  unspecified
      Reserved_8_15  : RP2350.Byte := 16#0#;
      --  Selects a group of resource
      GROUP          : TRCRSCTLR_GROUP_Field := 16#0#;
      --  unspecified
      Reserved_19_19 : RP2350.Bit := 16#0#;
      --  Inverts the selected resources
      INV            : TRCRSCTLR_INV_Field := 16#0#;
      --  Inverts the result of a combined pair of resources. This bit is only
      --  implemented on the lower register for a pair of resource selectors
      PAIRINV        : TRCRSCTLR_PAIRINV_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : RP2350.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCRSCTLR_Register use record
      SELECT_k       at 0 range 0 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      GROUP          at 0 range 16 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      INV            at 0 range 20 .. 20;
      PAIRINV        at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype TRCSSCSR_INST_Field is RP2350.Bit;
   subtype TRCSSCSR_DA_Field is RP2350.Bit;
   subtype TRCSSCSR_DV_Field is RP2350.Bit;
   subtype TRCSSCSR_PC_Field is RP2350.Bit;
   subtype TRCSSCSR_STATUS_Field is RP2350.Bit;

   --  Controls the corresponding single-shot comparator resource
   type TRCSSCSR_Register is record
      --  Read-only. Reserved, RES0
      INST          : TRCSSCSR_INST_Field := 16#0#;
      --  Read-only. Reserved, RES0
      DA            : TRCSSCSR_DA_Field := 16#0#;
      --  Read-only. Reserved, RES0
      DV            : TRCSSCSR_DV_Field := 16#0#;
      --  Read-only. Reserved, RES1
      PC            : TRCSSCSR_PC_Field := 16#0#;
      --  unspecified
      Reserved_4_30 : RP2350.UInt27 := 16#0#;
      --  Single-shot status bit. Indicates if any of the comparators, that
      --  TRCSSCCRn.SAC or TRCSSCCRn.ARC selects, have matched
      STATUS        : TRCSSCSR_STATUS_Field := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCSSCSR_Register use record
      INST          at 0 range 0 .. 0;
      DA            at 0 range 1 .. 1;
      DV            at 0 range 2 .. 2;
      PC            at 0 range 3 .. 3;
      Reserved_4_30 at 0 range 4 .. 30;
      STATUS        at 0 range 31 .. 31;
   end record;

   subtype TRCSSPCICR_PC_Field is RP2350.UInt4;

   --  Selects the PE comparator inputs for Single-shot control
   type TRCSSPCICR_Register is record
      --  Selects one or more PE comparator inputs for Single-shot control.
      --  TRCIDR4.NUMPC defines the size of the PC field. 1 bit is provided for
      --  each implemented PE comparator input. For example, if bit[1] == 1
      --  this selects PE comparator input 1 for Single-shot control
      PC            : TRCSSPCICR_PC_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCSSPCICR_Register use record
      PC            at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TRCPDCR_PU_Field is RP2350.Bit;

   --  Requests the system to provide power to the trace unit
   type TRCPDCR_Register is record
      --  unspecified
      Reserved_0_2  : RP2350.UInt3 := 16#0#;
      --  Powerup request bit:
      PU            : TRCPDCR_PU_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPDCR_Register use record
      Reserved_0_2  at 0 range 0 .. 2;
      PU            at 0 range 3 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TRCPDSR_POWER_Field is RP2350.Bit;
   subtype TRCPDSR_STICKYPD_Field is RP2350.Bit;
   subtype TRCPDSR_OSLK_Field is RP2350.Bit;

   --  Returns the following information about the trace unit: - OS Lock
   --  status. - Core power domain status. - Power interruption status
   type TRCPDSR_Register is record
      --  Read-only. Power status bit:
      POWER         : TRCPDSR_POWER_Field;
      --  Read-only. Sticky powerdown status bit. Indicates whether the trace
      --  register state is valid:
      STICKYPD      : TRCPDSR_STICKYPD_Field;
      --  unspecified
      Reserved_2_4  : RP2350.UInt3;
      --  Read-only. OS Lock status bit:
      OSLK          : TRCPDSR_OSLK_Field;
      --  unspecified
      Reserved_6_31 : RP2350.UInt26;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPDSR_Register use record
      POWER         at 0 range 0 .. 0;
      STICKYPD      at 0 range 1 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      OSLK          at 0 range 5 .. 5;
      Reserved_6_31 at 0 range 6 .. 31;
   end record;

   subtype TRCITATBIDR_ID_Field is RP2350.UInt7;

   --  Trace Integration ATB Identification Register
   type TRCITATBIDR_Register is record
      --  Trace ID
      ID            : TRCITATBIDR_ID_Field := 16#0#;
      --  unspecified
      Reserved_7_31 : RP2350.UInt25 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCITATBIDR_Register use record
      ID            at 0 range 0 .. 6;
      Reserved_7_31 at 0 range 7 .. 31;
   end record;

   subtype TRCITIATBINR_ATREADYM_Field is RP2350.Bit;
   subtype TRCITIATBINR_AFVALIDM_Field is RP2350.Bit;

   --  Trace Integration Instruction ATB In Register
   type TRCITIATBINR_Register is record
      --  Integration Mode instruction ATREADYM in
      ATREADYM      : TRCITIATBINR_ATREADYM_Field := 16#0#;
      --  Integration Mode instruction AFVALIDM in
      AFVALIDM      : TRCITIATBINR_AFVALIDM_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCITIATBINR_Register use record
      ATREADYM      at 0 range 0 .. 0;
      AFVALIDM      at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype TRCITIATBOUTR_ATVALID_Field is RP2350.Bit;
   subtype TRCITIATBOUTR_AFREADY_Field is RP2350.Bit;

   --  Trace Integration Instruction ATB Out Register
   type TRCITIATBOUTR_Register is record
      --  Integration Mode instruction ATVALID out
      ATVALID       : TRCITIATBOUTR_ATVALID_Field := 16#0#;
      --  Integration Mode instruction AFREADY out
      AFREADY       : TRCITIATBOUTR_AFREADY_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : RP2350.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCITIATBOUTR_Register use record
      ATVALID       at 0 range 0 .. 0;
      AFREADY       at 0 range 1 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   --  TRCCLAIMSET_SET array element
   subtype TRCCLAIMSET_SET_Element is RP2350.Bit;

   --  TRCCLAIMSET_SET array
   type TRCCLAIMSET_SET_Field_Array is array (0 .. 3)
     of TRCCLAIMSET_SET_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for TRCCLAIMSET_SET
   type TRCCLAIMSET_SET_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  SET as a value
            Val : RP2350.UInt4;
         when True =>
            --  SET as an array
            Arr : TRCCLAIMSET_SET_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TRCCLAIMSET_SET_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Claim Tag Set Register
   type TRCCLAIMSET_Register is record
      --  When a write to one of these bits occurs, with the value:
      SET           : TRCCLAIMSET_SET_Field :=
                       (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCLAIMSET_Register use record
      SET           at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   --  TRCCLAIMCLR_CLR array element
   subtype TRCCLAIMCLR_CLR_Element is RP2350.Bit;

   --  TRCCLAIMCLR_CLR array
   type TRCCLAIMCLR_CLR_Field_Array is array (0 .. 3)
     of TRCCLAIMCLR_CLR_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for TRCCLAIMCLR_CLR
   type TRCCLAIMCLR_CLR_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CLR as a value
            Val : RP2350.UInt4;
         when True =>
            --  CLR as an array
            Arr : TRCCLAIMCLR_CLR_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for TRCCLAIMCLR_CLR_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Claim Tag Clear Register
   type TRCCLAIMCLR_Register is record
      --  When a write to one of these bits occurs, with the value:
      CLR           : TRCCLAIMCLR_CLR_Field :=
                       (As_Array => False, Val => 16#0#);
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCLAIMCLR_Register use record
      CLR           at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype TRCAUTHSTATUS_NSID_Field is RP2350.UInt2;
   subtype TRCAUTHSTATUS_NSNID_Field is RP2350.UInt2;
   subtype TRCAUTHSTATUS_SID_Field is RP2350.UInt2;
   subtype TRCAUTHSTATUS_SNID_Field is RP2350.UInt2;

   --  Returns the level of tracing that the trace unit can support
   type TRCAUTHSTATUS_Register is record
      --  Read-only. Indicates whether the trace unit supports Non-secure
      --  invasive debug:
      NSID          : TRCAUTHSTATUS_NSID_Field;
      --  Read-only. Indicates whether the system enables the trace unit to
      --  support Non-secure non-invasive debug:
      NSNID         : TRCAUTHSTATUS_NSNID_Field;
      --  Read-only. Indicates whether the trace unit supports Secure invasive
      --  debug:
      SID           : TRCAUTHSTATUS_SID_Field;
      --  Read-only. Indicates whether the system enables the trace unit to
      --  support Secure non-invasive debug:
      SNID          : TRCAUTHSTATUS_SNID_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCAUTHSTATUS_Register use record
      NSID          at 0 range 0 .. 1;
      NSNID         at 0 range 2 .. 3;
      SID           at 0 range 4 .. 5;
      SNID          at 0 range 6 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCDEVARCH_ARCHID_Field is RP2350.UInt16;
   subtype TRCDEVARCH_REVISION_Field is RP2350.UInt4;
   subtype TRCDEVARCH_PRESENT_Field is RP2350.Bit;
   subtype TRCDEVARCH_ARCHITECT_Field is RP2350.UInt11;

   --  TRCDEVARCH
   type TRCDEVARCH_Register is record
      --  Read-only. reads as 0b0100101000010011
      ARCHID    : TRCDEVARCH_ARCHID_Field;
      --  Read-only. reads as 0b0000
      REVISION  : TRCDEVARCH_REVISION_Field;
      --  Read-only. reads as 0b1
      PRESENT   : TRCDEVARCH_PRESENT_Field;
      --  Read-only. reads as 0b01000111011
      ARCHITECT : TRCDEVARCH_ARCHITECT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCDEVARCH_Register use record
      ARCHID    at 0 range 0 .. 15;
      REVISION  at 0 range 16 .. 19;
      PRESENT   at 0 range 20 .. 20;
      ARCHITECT at 0 range 21 .. 31;
   end record;

   subtype TRCDEVTYPE_MAJOR_Field is RP2350.UInt4;
   subtype TRCDEVTYPE_SUB_Field is RP2350.UInt4;

   --  TRCDEVTYPE
   type TRCDEVTYPE_Register is record
      --  Read-only. reads as 0b0011
      MAJOR         : TRCDEVTYPE_MAJOR_Field;
      --  Read-only. reads as 0b0001
      SUB           : TRCDEVTYPE_SUB_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCDEVTYPE_Register use record
      MAJOR         at 0 range 0 .. 3;
      SUB           at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCPIDR4_DES_2_Field is RP2350.UInt4;
   subtype TRCPIDR4_SIZE_Field is RP2350.UInt4;

   --  TRCPIDR4
   type TRCPIDR4_Register is record
      --  Read-only. reads as `ImpDef
      DES_2         : TRCPIDR4_DES_2_Field;
      --  Read-only. reads as `ImpDef
      SIZE          : TRCPIDR4_SIZE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPIDR4_Register use record
      DES_2         at 0 range 0 .. 3;
      SIZE          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCPIDR0_PART_0_Field is RP2350.Byte;

   --  TRCPIDR0
   type TRCPIDR0_Register is record
      --  Read-only. reads as `ImpDef
      PART_0        : TRCPIDR0_PART_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPIDR0_Register use record
      PART_0        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCPIDR1_PART_0_Field is RP2350.UInt4;
   subtype TRCPIDR1_DES_0_Field is RP2350.UInt4;

   --  TRCPIDR1
   type TRCPIDR1_Register is record
      --  Read-only. reads as `ImpDef
      PART_0        : TRCPIDR1_PART_0_Field;
      --  Read-only. reads as `ImpDef
      DES_0         : TRCPIDR1_DES_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPIDR1_Register use record
      PART_0        at 0 range 0 .. 3;
      DES_0         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCPIDR2_DES_0_Field is RP2350.UInt3;
   subtype TRCPIDR2_JEDEC_Field is RP2350.Bit;
   subtype TRCPIDR2_REVISION_Field is RP2350.UInt4;

   --  TRCPIDR2
   type TRCPIDR2_Register is record
      --  Read-only. reads as `ImpDef
      DES_0         : TRCPIDR2_DES_0_Field;
      --  Read-only. reads as 0b1
      JEDEC         : TRCPIDR2_JEDEC_Field;
      --  Read-only. reads as `ImpDef
      REVISION      : TRCPIDR2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPIDR2_Register use record
      DES_0         at 0 range 0 .. 2;
      JEDEC         at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCPIDR3_CMOD_Field is RP2350.UInt4;
   subtype TRCPIDR3_REVAND_Field is RP2350.UInt4;

   --  TRCPIDR3
   type TRCPIDR3_Register is record
      --  Read-only. reads as `ImpDef
      CMOD          : TRCPIDR3_CMOD_Field;
      --  Read-only. reads as `ImpDef
      REVAND        : TRCPIDR3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCPIDR3_Register use record
      CMOD          at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCCIDR0_PRMBL_0_Field is RP2350.Byte;

   --  TRCCIDR0
   type TRCCIDR0_Register is record
      --  Read-only. reads as 0b00001101
      PRMBL_0       : TRCCIDR0_PRMBL_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCIDR0_Register use record
      PRMBL_0       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCCIDR1_PRMBL_1_Field is RP2350.UInt4;
   subtype TRCCIDR1_CLASS_Field is RP2350.UInt4;

   --  TRCCIDR1
   type TRCCIDR1_Register is record
      --  Read-only. reads as 0b0000
      PRMBL_1       : TRCCIDR1_PRMBL_1_Field;
      --  Read-only. reads as 0b1001
      CLASS         : TRCCIDR1_CLASS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCIDR1_Register use record
      PRMBL_1       at 0 range 0 .. 3;
      CLASS         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCCIDR2_PRMBL_2_Field is RP2350.Byte;

   --  TRCCIDR2
   type TRCCIDR2_Register is record
      --  Read-only. reads as 0b00000101
      PRMBL_2       : TRCCIDR2_PRMBL_2_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCIDR2_Register use record
      PRMBL_2       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TRCCIDR3_PRMBL_3_Field is RP2350.Byte;

   --  TRCCIDR3
   type TRCCIDR3_Register is record
      --  Read-only. reads as 0b10110001
      PRMBL_3       : TRCCIDR3_PRMBL_3_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TRCCIDR3_Register use record
      PRMBL_3       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CTICONTROL_GLBEN_Field is RP2350.Bit;

   --  CTI Control Register
   type CTICONTROL_Register is record
      --  Enables or disables the CTI
      GLBEN         : CTICONTROL_GLBEN_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : RP2350.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTICONTROL_Register use record
      GLBEN         at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype CTIINTACK_INTACK_Field is RP2350.Byte;

   --  CTI Interrupt Acknowledge Register
   type CTIINTACK_Register is record
      --  Acknowledges the corresponding ctitrigout output. There is one bit of
      --  the register for each ctitrigout output. When a 1 is written to a bit
      --  in this register, the corresponding ctitrigout is acknowledged,
      --  causing it to be cleared.
      INTACK        : CTIINTACK_INTACK_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIINTACK_Register use record
      INTACK        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CTIAPPSET_APPSET_Field is RP2350.UInt4;

   --  CTI Application Trigger Set Register
   type CTIAPPSET_Register is record
      --  Setting a bit HIGH generates a channel event for the selected
      --  channel. There is one bit of the register for each channel
      APPSET        : CTIAPPSET_APPSET_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIAPPSET_Register use record
      APPSET        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CTIAPPCLEAR_APPCLEAR_Field is RP2350.UInt4;

   --  CTI Application Trigger Clear Register
   type CTIAPPCLEAR_Register is record
      --  Sets the corresponding bits in the CTIAPPSET to 0. There is one bit
      --  of the register for each channel.
      APPCLEAR      : CTIAPPCLEAR_APPCLEAR_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIAPPCLEAR_Register use record
      APPCLEAR      at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CTIAPPPULSE_APPULSE_Field is RP2350.UInt4;

   --  CTI Application Pulse Register
   type CTIAPPPULSE_Register is record
      --  Setting a bit HIGH generates a channel event pulse for the selected
      --  channel. There is one bit of the register for each channel.
      APPULSE       : CTIAPPPULSE_APPULSE_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIAPPPULSE_Register use record
      APPULSE       at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CTIINEN_TRIGINEN_Field is RP2350.UInt4;

   --  CTI Trigger to Channel Enable Registers
   type CTIINEN_Register is record
      --  Enables a cross trigger event to the corresponding channel when a
      --  ctitrigin input is activated. There is one bit of the field for each
      --  of the four channels
      TRIGINEN      : CTIINEN_TRIGINEN_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIINEN_Register use record
      TRIGINEN      at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CTIOUTEN_TRIGOUTEN_Field is RP2350.UInt4;

   --  CTI Trigger to Channel Enable Registers
   type CTIOUTEN_Register is record
      --  Enables a cross trigger event to ctitrigout when the corresponding
      --  channel is activated. There is one bit of the field for each of the
      --  four channels.
      TRIGOUTEN     : CTIOUTEN_TRIGOUTEN_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIOUTEN_Register use record
      TRIGOUTEN     at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype CTITRIGINSTATUS_TRIGINSTATUS_Field is RP2350.Byte;

   --  CTI Trigger to Channel Enable Registers
   type CTITRIGINSTATUS_Register is record
      --  Read-only. Shows the status of the ctitrigin inputs. There is one bit
      --  of the field for each trigger input.Because the register provides a
      --  view of the raw ctitrigin inputs, the reset value is UNKNOWN.
      TRIGINSTATUS  : CTITRIGINSTATUS_TRIGINSTATUS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTITRIGINSTATUS_Register use record
      TRIGINSTATUS  at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CTITRIGOUTSTATUS_TRIGOUTSTATUS_Field is RP2350.Byte;

   --  CTI Trigger In Status Register
   type CTITRIGOUTSTATUS_Register is record
      --  Read-only. Shows the status of the ctitrigout outputs. There is one
      --  bit of the field for each trigger output.
      TRIGOUTSTATUS : CTITRIGOUTSTATUS_TRIGOUTSTATUS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTITRIGOUTSTATUS_Register use record
      TRIGOUTSTATUS at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CTICHINSTATUS_CTICHOUTSTATUS_Field is RP2350.UInt4;

   --  CTI Channel In Status Register
   type CTICHINSTATUS_Register is record
      --  Read-only. Shows the status of the ctichout outputs. There is one bit
      --  of the field for each channel output
      CTICHOUTSTATUS : CTICHINSTATUS_CTICHOUTSTATUS_Field;
      --  unspecified
      Reserved_4_31  : RP2350.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTICHINSTATUS_Register use record
      CTICHOUTSTATUS at 0 range 0 .. 3;
      Reserved_4_31  at 0 range 4 .. 31;
   end record;

   --  CTIGATE_CTIGATEEN array element
   subtype CTIGATE_CTIGATEEN_Element is RP2350.Bit;

   --  CTIGATE_CTIGATEEN array
   type CTIGATE_CTIGATEEN_Field_Array is array (0 .. 3)
     of CTIGATE_CTIGATEEN_Element
     with Component_Size => 1, Size => 4;

   --  Type definition for CTIGATE_CTIGATEEN
   type CTIGATE_CTIGATEEN_Field
     (As_Array : Boolean := False)
   is record
      case As_Array is
         when False =>
            --  CTIGATEEN as a value
            Val : RP2350.UInt4;
         when True =>
            --  CTIGATEEN as an array
            Arr : CTIGATE_CTIGATEEN_Field_Array;
      end case;
   end record
     with Unchecked_Union, Size => 4;

   for CTIGATE_CTIGATEEN_Field use record
      Val at 0 range 0 .. 3;
      Arr at 0 range 0 .. 3;
   end record;

   --  Enable CTI Channel Gate register
   type CTIGATE_Register is record
      --  Enable ctichout0. Set to 0 to disable channel propagation.
      CTIGATEEN     : CTIGATE_CTIGATEEN_Field :=
                       (As_Array => False, Val => 16#1#);
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTIGATE_Register use record
      CTIGATEEN     at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ITCHOUT_CTCHOUT_Field is RP2350.UInt4;

   --  Integration Test Channel Output register
   type ITCHOUT_Register is record
      --  Sets the value of the ctichout outputs
      CTCHOUT       : ITCHOUT_CTCHOUT_Field := 16#0#;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITCHOUT_Register use record
      CTCHOUT       at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ITTRIGOUT_CTTRIGOUT_Field is RP2350.Byte;

   --  Integration Test Trigger Output register
   type ITTRIGOUT_Register is record
      --  Sets the value of the ctitrigout outputs
      CTTRIGOUT     : ITTRIGOUT_CTTRIGOUT_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITTRIGOUT_Register use record
      CTTRIGOUT     at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype ITCHIN_CTCHIN_Field is RP2350.UInt4;

   --  Integration Test Channel Input register
   type ITCHIN_Register is record
      --  Read-only. Reads the value of the ctichin inputs.
      CTCHIN        : ITCHIN_CTCHIN_Field;
      --  unspecified
      Reserved_4_31 : RP2350.UInt28;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITCHIN_Register use record
      CTCHIN        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   subtype ITCTRL_IME_Field is RP2350.Bit;

   --  Integration Mode Control register
   type ITCTRL_Register is record
      --  Integration Mode Enable
      IME           : ITCTRL_IME_Field := 16#0#;
      --  unspecified
      Reserved_1_31 : RP2350.UInt31 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for ITCTRL_Register use record
      IME           at 0 range 0 .. 0;
      Reserved_1_31 at 0 range 1 .. 31;
   end record;

   subtype DEVARCH_ARCHID_Field is RP2350.UInt16;
   subtype DEVARCH_REVISION_Field is RP2350.UInt4;
   subtype DEVARCH_PRESENT_Field is RP2350.Bit;
   subtype DEVARCH_ARCHITECT_Field is RP2350.UInt11;

   --  Device Architecture register
   type DEVARCH_Register is record
      --  Read-only. Indicates the component
      ARCHID    : DEVARCH_ARCHID_Field;
      --  Read-only. Indicates the architecture revision
      REVISION  : DEVARCH_REVISION_Field;
      --  Read-only. Indicates whether the DEVARCH register is present
      PRESENT   : DEVARCH_PRESENT_Field;
      --  Read-only. Indicates the component architect
      ARCHITECT : DEVARCH_ARCHITECT_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEVARCH_Register use record
      ARCHID    at 0 range 0 .. 15;
      REVISION  at 0 range 16 .. 19;
      PRESENT   at 0 range 20 .. 20;
      ARCHITECT at 0 range 21 .. 31;
   end record;

   subtype DEVID_EXTMUXNUM_Field is RP2350.UInt5;
   subtype DEVID_NUMTRIG_Field is RP2350.Byte;
   subtype DEVID_NUMCH_Field is RP2350.UInt4;

   --  Device Configuration register
   type DEVID_Register is record
      --  Read-only. Indicates the number of multiplexers available on Trigger
      --  Inputs and Trigger Outputs that are using asicctl. The default value
      --  of 0b00000 indicates that no multiplexing is present. This value of
      --  this bit depends on the Verilog define EXTMUXNUM that you must change
      --  accordingly.
      EXTMUXNUM      : DEVID_EXTMUXNUM_Field;
      --  unspecified
      Reserved_5_7   : RP2350.UInt3;
      --  Read-only. Number of ECT triggers available.
      NUMTRIG        : DEVID_NUMTRIG_Field;
      --  Read-only. Number of ECT channels available
      NUMCH          : DEVID_NUMCH_Field;
      --  unspecified
      Reserved_20_31 : RP2350.UInt12;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEVID_Register use record
      EXTMUXNUM      at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      NUMTRIG        at 0 range 8 .. 15;
      NUMCH          at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   subtype DEVTYPE_MAJOR_Field is RP2350.UInt4;
   subtype DEVTYPE_SUB_Field is RP2350.UInt4;

   --  Device Type Identifier register
   type DEVTYPE_Register is record
      --  Read-only. Major classification of the type of the debug component as
      --  specified in the ARM Architecture Specification for this debug and
      --  trace component.
      MAJOR         : DEVTYPE_MAJOR_Field;
      --  Read-only. Sub-classification of the type of the debug component as
      --  specified in the ARM Architecture Specification within the major
      --  classification as specified in the MAJOR field.
      SUB           : DEVTYPE_SUB_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for DEVTYPE_Register use record
      MAJOR         at 0 range 0 .. 3;
      SUB           at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PIDR4_DES_2_Field is RP2350.UInt4;
   subtype PIDR4_SIZE_Field is RP2350.UInt4;

   --  CoreSight Peripheral ID4
   type PIDR4_Register is record
      --  Read-only. Together, PIDR1.DES_0, PIDR2.DES_1, and PIDR4.DES_2
      --  identify the designer of the component.
      DES_2         : PIDR4_DES_2_Field;
      --  Read-only. Always 0b0000. Indicates that the device only occupies 4KB
      --  of memory
      SIZE          : PIDR4_SIZE_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIDR4_Register use record
      DES_2         at 0 range 0 .. 3;
      SIZE          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PIDR0_PART_0_Field is RP2350.Byte;

   --  CoreSight Peripheral ID0
   type PIDR0_Register is record
      --  Read-only. Bits[7:0] of the 12-bit part number of the component. The
      --  designer of the component assigns this part number.
      PART_0        : PIDR0_PART_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIDR0_Register use record
      PART_0        at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PIDR1_PART_1_Field is RP2350.UInt4;
   subtype PIDR1_DES_0_Field is RP2350.UInt4;

   --  CoreSight Peripheral ID1
   type PIDR1_Register is record
      --  Read-only. Bits[11:8] of the 12-bit part number of the component. The
      --  designer of the component assigns this part number.
      PART_1        : PIDR1_PART_1_Field;
      --  Read-only. Together, PIDR1.DES_0, PIDR2.DES_1, and PIDR4.DES_2
      --  identify the designer of the component.
      DES_0         : PIDR1_DES_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIDR1_Register use record
      PART_1        at 0 range 0 .. 3;
      DES_0         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PIDR2_DES_1_Field is RP2350.UInt3;
   subtype PIDR2_JEDEC_Field is RP2350.Bit;
   subtype PIDR2_REVISION_Field is RP2350.UInt4;

   --  CoreSight Peripheral ID2
   type PIDR2_Register is record
      --  Read-only. Together, PIDR1.DES_0, PIDR2.DES_1, and PIDR4.DES_2
      --  identify the designer of the component.
      DES_1         : PIDR2_DES_1_Field;
      --  Read-only. Always 1. Indicates that the JEDEC-assigned designer ID is
      --  used.
      JEDEC         : PIDR2_JEDEC_Field;
      --  Read-only. This device is at r1p0
      REVISION      : PIDR2_REVISION_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIDR2_Register use record
      DES_1         at 0 range 0 .. 2;
      JEDEC         at 0 range 3 .. 3;
      REVISION      at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype PIDR3_CMOD_Field is RP2350.UInt4;
   subtype PIDR3_REVAND_Field is RP2350.UInt4;

   --  CoreSight Peripheral ID3
   type PIDR3_Register is record
      --  Read-only. Customer Modified. Indicates whether the customer has
      --  modified the behavior of the component. In most cases, this field is
      --  0b0000. Customers change this value when they make authorized
      --  modifications to this component.
      CMOD          : PIDR3_CMOD_Field;
      --  Read-only. Indicates minor errata fixes specific to the revision of
      --  the component being used, for example metal fixes after
      --  implementation. In most cases, this field is 0b0000. ARM recommends
      --  that the component designers ensure that a metal fix can change this
      --  field if required, for example, by driving it from registers that
      --  reset to 0b0000.
      REVAND        : PIDR3_REVAND_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for PIDR3_Register use record
      CMOD          at 0 range 0 .. 3;
      REVAND        at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CIDR0_PRMBL_0_Field is RP2350.Byte;

   --  CoreSight Component ID0
   type CIDR0_Register is record
      --  Read-only. Preamble[0]. Contains bits[7:0] of the component
      --  identification code
      PRMBL_0       : CIDR0_PRMBL_0_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIDR0_Register use record
      PRMBL_0       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CIDR1_PRMBL_1_Field is RP2350.UInt4;
   subtype CIDR1_CLASS_Field is RP2350.UInt4;

   --  CoreSight Component ID1
   type CIDR1_Register is record
      --  Read-only. Preamble[1]. Contains bits[11:8] of the component
      --  identification code.
      PRMBL_1       : CIDR1_PRMBL_1_Field;
      --  Read-only. Class of the component, for example, whether the component
      --  is a ROM table or a generic CoreSight component. Contains bits[15:12]
      --  of the component identification code.
      CLASS         : CIDR1_CLASS_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIDR1_Register use record
      PRMBL_1       at 0 range 0 .. 3;
      CLASS         at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CIDR2_PRMBL_2_Field is RP2350.Byte;

   --  CoreSight Component ID2
   type CIDR2_Register is record
      --  Read-only. Preamble[2]. Contains bits[23:16] of the component
      --  identification code.
      PRMBL_2       : CIDR2_PRMBL_2_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIDR2_Register use record
      PRMBL_2       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CIDR3_PRMBL_3_Field is RP2350.Byte;

   --  CoreSight Component ID3
   type CIDR3_Register is record
      --  Read-only. Preamble[3]. Contains bits[31:24] of the component
      --  identification code.
      PRMBL_3       : CIDR3_PRMBL_3_Field;
      --  unspecified
      Reserved_8_31 : RP2350.UInt24;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CIDR3_Register use record
      PRMBL_3       at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  TEAL registers accessible through the debug interface
   type PPB_NS_Peripheral is record
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM0        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM1        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM2        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM3        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM4        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM5        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM6        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM7        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM8        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM9        : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM10       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM11       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM12       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM13       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM14       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM15       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM16       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM17       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM18       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM19       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM20       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM21       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM22       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM23       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM24       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM25       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM26       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM27       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM28       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM29       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM30       : aliased RP2350.UInt32;
      --  Provides the interface for generating Instrumentation packets
      ITM_STIM31       : aliased RP2350.UInt32;
      --  Provide an individual enable bit for each ITM_STIM register
      ITM_TER0         : aliased RP2350.UInt32;
      --  Controls which stimulus ports can be accessed by unprivileged code
      ITM_TPR          : aliased ITM_TPR_Register;
      --  Configures and controls transfers through the ITM interface
      ITM_TCR          : aliased ITM_TCR_Register;
      --  Integration Mode: Read ATB Ready
      INT_ATREADY      : aliased INT_ATREADY_Register;
      --  Integration Mode: Write ATB Valid
      INT_ATVALID      : aliased INT_ATVALID_Register;
      --  Integration Mode Control Register
      ITM_ITCTRL       : aliased ITM_ITCTRL_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_DEVARCH      : aliased ITM_DEVARCH_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_DEVTYPE      : aliased ITM_DEVTYPE_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR4        : aliased ITM_PIDR4_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR5        : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR6        : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR7        : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR0        : aliased ITM_PIDR0_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR1        : aliased ITM_PIDR1_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR2        : aliased ITM_PIDR2_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_PIDR3        : aliased ITM_PIDR3_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_CIDR0        : aliased ITM_CIDR0_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_CIDR1        : aliased ITM_CIDR1_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_CIDR2        : aliased ITM_CIDR2_Register;
      --  Provides CoreSight discovery information for the ITM
      ITM_CIDR3        : aliased ITM_CIDR3_Register;
      --  Provides configuration and status information for the DWT unit, and
      --  used to control features of the unit
      DWT_CTRL         : aliased DWT_CTRL_Register;
      --  Shows or sets the value of the processor cycle counter, CYCCNT
      DWT_CYCCNT       : aliased RP2350.UInt32;
      --  Counts the total cycles spent in exception processing
      DWT_EXCCNT       : aliased DWT_EXCCNT_Register;
      --  Increments on the additional cycles required to execute all load or
      --  store instructions
      DWT_LSUCNT       : aliased DWT_LSUCNT_Register;
      --  Increments on the additional cycles required to execute all load or
      --  store instructions
      DWT_FOLDCNT      : aliased DWT_FOLDCNT_Register;
      --  Provides a reference value for use by watchpoint comparator 0
      DWT_COMP0        : aliased RP2350.UInt32;
      --  Controls the operation of watchpoint comparator 0
      DWT_FUNCTION0    : aliased DWT_FUNCTION_Register;
      --  Provides a reference value for use by watchpoint comparator 1
      DWT_COMP1        : aliased RP2350.UInt32;
      --  Controls the operation of watchpoint comparator 1
      DWT_FUNCTION1    : aliased DWT_FUNCTION_Register;
      --  Provides a reference value for use by watchpoint comparator 2
      DWT_COMP2        : aliased RP2350.UInt32;
      --  Controls the operation of watchpoint comparator 2
      DWT_FUNCTION2    : aliased DWT_FUNCTION_Register;
      --  Provides a reference value for use by watchpoint comparator 3
      DWT_COMP3        : aliased RP2350.UInt32;
      --  Controls the operation of watchpoint comparator 3
      DWT_FUNCTION3    : aliased DWT_FUNCTION_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_DEVARCH      : aliased DWT_DEVARCH_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_DEVTYPE      : aliased DWT_DEVTYPE_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR4        : aliased DWT_PIDR4_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR5        : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR6        : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR7        : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR0        : aliased DWT_PIDR0_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR1        : aliased DWT_PIDR1_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR2        : aliased DWT_PIDR2_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_PIDR3        : aliased DWT_PIDR3_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_CIDR0        : aliased DWT_CIDR0_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_CIDR1        : aliased DWT_CIDR1_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_CIDR2        : aliased DWT_CIDR2_Register;
      --  Provides CoreSight discovery information for the DWT
      DWT_CIDR3        : aliased DWT_CIDR3_Register;
      --  Provides FPB implementation information, and the global enable for
      --  the FPB unit
      FP_CTRL          : aliased FP_CTRL_Register;
      --  Indicates whether the implementation supports Flash Patch remap and,
      --  if it does, holds the target address for remap
      FP_REMAP         : aliased FP_REMAP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP0         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP1         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP2         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP3         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP4         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP5         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP6         : aliased FP_COMP_Register;
      --  Holds an address for comparison. The effect of the match depends on
      --  the configuration of the FPB and whether the comparator is an
      --  instruction address comparator or a literal address comparator
      FP_COMP7         : aliased FP_COMP_Register;
      --  Provides CoreSight discovery information for the FPB
      FP_DEVARCH       : aliased FP_DEVARCH_Register;
      --  Provides CoreSight discovery information for the FPB
      FP_DEVTYPE       : aliased FP_DEVTYPE_Register;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR4         : aliased FP_PIDR4_Register;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR5         : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR6         : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR7         : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR0         : aliased FP_PIDR0_Register;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR1         : aliased FP_PIDR1_Register;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR2         : aliased FP_PIDR2_Register;
      --  Provides CoreSight discovery information for the FP
      FP_PIDR3         : aliased FP_PIDR3_Register;
      --  Provides CoreSight discovery information for the FP
      FP_CIDR0         : aliased FP_CIDR0_Register;
      --  Provides CoreSight discovery information for the FP
      FP_CIDR1         : aliased FP_CIDR1_Register;
      --  Provides CoreSight discovery information for the FP
      FP_CIDR2         : aliased FP_CIDR2_Register;
      --  Provides CoreSight discovery information for the FP
      FP_CIDR3         : aliased FP_CIDR3_Register;
      --  Provides information about the interrupt controller
      ICTR             : aliased ICTR_Register;
      --  Provides IMPLEMENTATION DEFINED configuration and control options
      ACTLR            : aliased ACTLR_Register;
      --  Use the SysTick Control and Status Register to enable the SysTick
      --  features.
      SYST_CSR         : aliased SYST_CSR_Register;
      --  Use the SysTick Reload Value Register to specify the start value to
      --  load into the current value register when the counter reaches 0. It
      --  can be any value between 0 and 0x00FFFFFF. A start value of 0 is
      --  possible, but has no effect because the SysTick interrupt and
      --  COUNTFLAG are activated when counting from 1 to 0. The reset value of
      --  this register is UNKNOWN. To generate a multi-shot timer with a
      --  period of N processor clock cycles, use a RELOAD value of N-1. For
      --  example, if the SysTick interrupt is required every 100 clock pulses,
      --  set RELOAD to 99.
      SYST_RVR         : aliased SYST_RVR_Register;
      --  Use the SysTick Current Value Register to find the current value in
      --  the register. The reset value of this register is UNKNOWN.
      SYST_CVR         : aliased SYST_CVR_Register;
      --  Use the SysTick Calibration Value Register to enable software to
      --  scale to any required speed using divide and multiply.
      SYST_CALIB       : aliased SYST_CALIB_Register;
      --  Enables or reads the enabled state of each group of 32 interrupts
      NVIC_ISER0       : aliased RP2350.UInt32;
      --  Enables or reads the enabled state of each group of 32 interrupts
      NVIC_ISER1       : aliased RP2350.UInt32;
      --  Clears or reads the enabled state of each group of 32 interrupts
      NVIC_ICER0       : aliased RP2350.UInt32;
      --  Clears or reads the enabled state of each group of 32 interrupts
      NVIC_ICER1       : aliased RP2350.UInt32;
      --  Enables or reads the pending state of each group of 32 interrupts
      NVIC_ISPR0       : aliased RP2350.UInt32;
      --  Enables or reads the pending state of each group of 32 interrupts
      NVIC_ISPR1       : aliased RP2350.UInt32;
      --  Clears or reads the pending state of each group of 32 interrupts
      NVIC_ICPR0       : aliased RP2350.UInt32;
      --  Clears or reads the pending state of each group of 32 interrupts
      NVIC_ICPR1       : aliased RP2350.UInt32;
      --  For each group of 32 interrupts, shows the active state of each
      --  interrupt
      NVIC_IABR0       : aliased RP2350.UInt32;
      --  For each group of 32 interrupts, shows the active state of each
      --  interrupt
      NVIC_IABR1       : aliased RP2350.UInt32;
      --  For each group of 32 interrupts, determines whether each interrupt
      --  targets Non-secure or Secure state
      NVIC_ITNS0       : aliased RP2350.UInt32;
      --  For each group of 32 interrupts, determines whether each interrupt
      --  targets Non-secure or Secure state
      NVIC_ITNS1       : aliased RP2350.UInt32;
      --  Sets or reads interrupt priorities
      NVIC_IPR0        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR1        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR2        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR3        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR4        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR5        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR6        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR7        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR8        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR9        : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR10       : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR11       : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR12       : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR13       : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR14       : aliased NVIC_IPR_Register;
      --  Sets or reads interrupt priorities
      NVIC_IPR15       : aliased NVIC_IPR_Register;
      --  Provides identification information for the PE, including an
      --  implementer code for the device and a device ID number
      CPUID            : aliased CPUID_Register;
      --  Controls and provides status information for NMI, PendSV, SysTick and
      --  interrupts
      ICSR             : aliased ICSR_Register;
      --  The VTOR indicates the offset of the vector table base address from
      --  memory address 0x00000000.
      VTOR             : aliased VTOR_Register;
      --  Use the Application Interrupt and Reset Control Register to:
      --  determine data endianness, clear all active state information from
      --  debug halt mode, request a system reset.
      AIRCR            : aliased AIRCR_Register;
      --  System Control Register. Use the System Control Register for
      --  power-management functions: signal to the system when the processor
      --  can enter a low power state, control how the processor enters and
      --  exits low power states.
      SCR              : aliased SCR_Register;
      --  Sets or returns configuration and control data
      CCR              : aliased CCR_Register;
      --  Sets or returns priority for system handlers 4 - 7
      SHPR1            : aliased SHPR1_Register;
      --  Sets or returns priority for system handlers 8 - 11
      SHPR2            : aliased SHPR2_Register;
      --  Sets or returns priority for system handlers 12 - 15
      SHPR3            : aliased SHPR3_Register;
      --  Provides access to the active and pending status of system exceptions
      SHCSR            : aliased SHCSR_Register;
      --  Contains the three Configurable Fault Status Registers. 31:16 UFSR:
      --  Provides information on UsageFault exceptions 15:8 BFSR: Provides
      --  information on BusFault exceptions 7:0 MMFSR: Provides information on
      --  MemManage exceptions
      CFSR             : aliased CFSR_Register;
      --  Shows the cause of any HardFaults
      HFSR             : aliased HFSR_Register;
      --  Shows which debug event occurred
      DFSR             : aliased DFSR_Register;
      --  Shows the address of the memory location that caused an MPU fault
      MMFAR            : aliased RP2350.UInt32;
      --  Shows the address associated with a precise data access BusFault
      BFAR             : aliased RP2350.UInt32;
      --  Gives top-level information about the instruction set supported by
      --  the PE
      ID_PFR0          : aliased ID_PFR0_Register;
      --  Gives information about the programmers' model and Extensions support
      ID_PFR1          : aliased ID_PFR1_Register;
      --  Provides top level information about the debug system
      ID_DFR0          : aliased ID_DFR0_Register;
      --  Provides information about the IMPLEMENTATION DEFINED features of the
      --  PE
      ID_AFR0          : aliased ID_AFR0_Register;
      --  Provides information about the implemented memory model and memory
      --  management support
      ID_MMFR0         : aliased ID_MMFR0_Register;
      --  Provides information about the implemented memory model and memory
      --  management support
      ID_MMFR1         : aliased RP2350.UInt32;
      --  Provides information about the implemented memory model and memory
      --  management support
      ID_MMFR2         : aliased ID_MMFR2_Register;
      --  Provides information about the implemented memory model and memory
      --  management support
      ID_MMFR3         : aliased ID_MMFR3_Register;
      --  Provides information about the instruction set implemented by the PE
      ID_ISAR0         : aliased ID_ISAR0_Register;
      --  Provides information about the instruction set implemented by the PE
      ID_ISAR1         : aliased ID_ISAR1_Register;
      --  Provides information about the instruction set implemented by the PE
      ID_ISAR2         : aliased ID_ISAR2_Register;
      --  Provides information about the instruction set implemented by the PE
      ID_ISAR3         : aliased ID_ISAR3_Register;
      --  Provides information about the instruction set implemented by the PE
      ID_ISAR4         : aliased ID_ISAR4_Register;
      --  Provides information about the instruction set implemented by the PE
      ID_ISAR5         : aliased RP2350.UInt32;
      --  Provides information about the architecture of the caches. CTR is
      --  RES0 if CLIDR is zero.
      CTR              : aliased CTR_Register;
      --  Specifies the access privileges for coprocessors and the FP Extension
      CPACR            : aliased CPACR_Register;
      --  Defines the Non-secure access permissions for both the FP Extension
      --  and coprocessors CP0 to CP7
      NSACR            : aliased NSACR_Register;
      --  The MPU Type Register indicates how many regions the MPU `FTSSS
      --  supports
      MPU_TYPE         : aliased MPU_TYPE_Register;
      --  Enables the MPU and, when the MPU is enabled, controls whether the
      --  default memory map is enabled as a background region for privileged
      --  accesses, and whether the MPU is enabled for HardFaults, NMIs, and
      --  exception handlers when FAULTMASK is set to 1
      MPU_CTRL         : aliased MPU_CTRL_Register;
      --  Selects the region currently accessed by MPU_RBAR and MPU_RLAR
      MPU_RNR          : aliased MPU_RNR_Register;
      --  Provides indirect read and write access to the base address of the
      --  currently selected MPU region `FTSSS
      MPU_RBAR         : aliased MPU_RBAR_Register;
      --  Provides indirect read and write access to the limit address of the
      --  currently selected MPU region `FTSSS
      MPU_RLAR         : aliased MPU_RLAR_Register;
      --  Provides indirect read and write access to the base address of the
      --  MPU region selected by MPU_RNR[7:2]:(1[1:0]) `FTSSS
      MPU_RBAR_A1      : aliased MPU_RBAR_A_Register;
      --  Provides indirect read and write access to the limit address of the
      --  currently selected MPU region selected by MPU_RNR[7:2]:(1[1:0])
      --  `FTSSS
      MPU_RLAR_A1      : aliased MPU_RLAR_A_Register;
      --  Provides indirect read and write access to the base address of the
      --  MPU region selected by MPU_RNR[7:2]:(2[1:0]) `FTSSS
      MPU_RBAR_A2      : aliased MPU_RBAR_A_Register;
      --  Provides indirect read and write access to the limit address of the
      --  currently selected MPU region selected by MPU_RNR[7:2]:(2[1:0])
      --  `FTSSS
      MPU_RLAR_A2      : aliased MPU_RLAR_A_Register;
      --  Provides indirect read and write access to the base address of the
      --  MPU region selected by MPU_RNR[7:2]:(3[1:0]) `FTSSS
      MPU_RBAR_A3      : aliased MPU_RBAR_A_Register;
      --  Provides indirect read and write access to the limit address of the
      --  currently selected MPU region selected by MPU_RNR[7:2]:(3[1:0])
      --  `FTSSS
      MPU_RLAR_A3      : aliased MPU_RLAR_A_Register;
      --  Along with MPU_MAIR1, provides the memory attribute encodings
      --  corresponding to the AttrIndex values
      MPU_MAIR0        : aliased MPU_MAIR0_Register;
      --  Along with MPU_MAIR0, provides the memory attribute encodings
      --  corresponding to the AttrIndex values
      MPU_MAIR1        : aliased MPU_MAIR1_Register;
      --  Allows enabling of the Security Attribution Unit
      SAU_CTRL         : aliased SAU_CTRL_Register;
      --  Indicates the number of regions implemented by the Security
      --  Attribution Unit
      SAU_TYPE         : aliased SAU_TYPE_Register;
      --  Selects the region currently accessed by SAU_RBAR and SAU_RLAR
      SAU_RNR          : aliased SAU_RNR_Register;
      --  Provides indirect read and write access to the base address of the
      --  currently selected SAU region
      SAU_RBAR         : aliased SAU_RBAR_Register;
      --  Provides indirect read and write access to the limit address of the
      --  currently selected SAU region
      SAU_RLAR         : aliased SAU_RLAR_Register;
      --  Provides information about any security related faults
      SFSR             : aliased SFSR_Register;
      --  Shows the address of the memory location that caused a Security
      --  violation
      SFAR             : aliased RP2350.UInt32;
      --  Controls halting debug
      DHCSR            : aliased DHCSR_Register;
      --  With the DCRDR, provides debug access to the general-purpose
      --  registers, special-purpose registers, and the FP extension registers.
      --  A write to the DCRSR specifies the register to transfer, whether the
      --  transfer is a read or write, and starts the transfer
      DCRSR            : aliased DCRSR_Register;
      --  With the DCRSR, provides debug access to the general-purpose
      --  registers, special-purpose registers, and the FP Extension registers.
      --  If the Main Extension is implemented, it can also be used for message
      --  passing between an external debugger and a debug agent running on the
      --  PE
      DCRDR            : aliased RP2350.UInt32;
      --  Manages vector catch behavior and DebugMonitor handling when
      --  debugging
      DEMCR            : aliased DEMCR_Register;
      --  Provides control and status information for Secure debug
      DSCSR            : aliased DSCSR_Register;
      --  Provides a mechanism for software to generate an interrupt
      STIR             : aliased STIR_Register;
      --  Holds control data for the Floating-point extension
      FPCCR            : aliased FPCCR_Register;
      --  Holds the location of the unpopulated floating-point register space
      --  allocated on an exception stack frame
      FPCAR            : aliased FPCAR_Register;
      --  Holds the default values for the floating-point status control data
      --  that the PE assigns to the FPSCR when it creates a new floating-point
      --  context
      FPDSCR           : aliased FPDSCR_Register;
      --  Describes the features provided by the Floating-point Extension
      MVFR0            : aliased MVFR0_Register;
      --  Describes the features provided by the Floating-point Extension
      MVFR1            : aliased MVFR1_Register;
      --  Describes the features provided by the Floating-point Extension
      MVFR2            : aliased MVFR2_Register;
      --  Provides CoreSight discovery information for the SCS
      DDEVARCH         : aliased DDEVARCH_Register;
      --  Provides CoreSight discovery information for the SCS
      DDEVTYPE         : aliased DDEVTYPE_Register;
      --  Provides CoreSight discovery information for the SCS
      DPIDR4           : aliased DPIDR4_Register;
      --  Provides CoreSight discovery information for the SCS
      DPIDR5           : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the SCS
      DPIDR6           : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the SCS
      DPIDR7           : aliased RP2350.UInt32;
      --  Provides CoreSight discovery information for the SCS
      DPIDR0           : aliased DPIDR0_Register;
      --  Provides CoreSight discovery information for the SCS
      DPIDR1           : aliased DPIDR1_Register;
      --  Provides CoreSight discovery information for the SCS
      DPIDR2           : aliased DPIDR2_Register;
      --  Provides CoreSight discovery information for the SCS
      DPIDR3           : aliased DPIDR3_Register;
      --  Provides CoreSight discovery information for the SCS
      DCIDR0           : aliased DCIDR0_Register;
      --  Provides CoreSight discovery information for the SCS
      DCIDR1           : aliased DCIDR1_Register;
      --  Provides CoreSight discovery information for the SCS
      DCIDR2           : aliased DCIDR2_Register;
      --  Provides CoreSight discovery information for the SCS
      DCIDR3           : aliased DCIDR3_Register;
      --  Programming Control Register
      TRCPRGCTLR       : aliased TRCPRGCTLR_Register;
      --  The TRCSTATR indicates the ETM-Teal status
      TRCSTATR         : aliased TRCSTATR_Register;
      --  The TRCCONFIGR sets the basic tracing options for the trace unit
      TRCCONFIGR       : aliased TRCCONFIGR_Register;
      --  The TRCEVENTCTL0R controls the tracing of events in the trace stream.
      --  The events also drive the ETM-Teal external outputs.
      TRCEVENTCTL0R    : aliased TRCEVENTCTL0R_Register;
      --  The TRCEVENTCTL1R controls how the events selected by TRCEVENTCTL0R
      --  behave
      TRCEVENTCTL1R    : aliased TRCEVENTCTL1R_Register;
      --  The TRCSTALLCTLR enables ETM-Teal to stall the processor if the
      --  ETM-Teal FIFO goes over the programmed level to minimize risk of
      --  overflow
      TRCSTALLCTLR     : aliased TRCSTALLCTLR_Register;
      --  The TRCTSCTLR controls the insertion of global timestamps into the
      --  trace stream. A timestamp is always inserted into the instruction
      --  trace stream
      TRCTSCTLR        : aliased TRCTSCTLR_Register;
      --  The TRCSYNCPR specifies the period of trace synchronization of the
      --  trace streams. TRCSYNCPR defines a number of bytes of trace between
      --  requests for trace synchronization. This value is always a power of
      --  two
      TRCSYNCPR        : aliased TRCSYNCPR_Register;
      --  The TRCCCCTLR sets the threshold value for instruction trace cycle
      --  counting. The threshold represents the minimum interval between cycle
      --  count trace packets
      TRCCCCTLR        : aliased TRCCCCTLR_Register;
      --  The TRCVICTLR controls instruction trace filtering
      TRCVICTLR        : aliased TRCVICTLR_Register;
      --  The TRCCNTRLDVR defines the reload value for the reduced function
      --  counter
      TRCCNTRLDVR0     : aliased TRCCNTRLDVR0_Register;
      --  TRCIDR8
      TRCIDR8          : aliased RP2350.UInt32;
      --  TRCIDR9
      TRCIDR9          : aliased RP2350.UInt32;
      --  TRCIDR10
      TRCIDR10         : aliased RP2350.UInt32;
      --  TRCIDR11
      TRCIDR11         : aliased RP2350.UInt32;
      --  TRCIDR12
      TRCIDR12         : aliased RP2350.UInt32;
      --  TRCIDR13
      TRCIDR13         : aliased RP2350.UInt32;
      --  The TRCIMSPEC shows the presence of any IMPLEMENTATION SPECIFIC
      --  features, and enables any features that are provided
      TRCIMSPEC        : aliased TRCIMSPEC_Register;
      --  TRCIDR0
      TRCIDR0          : aliased TRCIDR0_Register;
      --  TRCIDR1
      TRCIDR1          : aliased TRCIDR1_Register;
      --  TRCIDR2
      TRCIDR2          : aliased TRCIDR2_Register;
      --  TRCIDR3
      TRCIDR3          : aliased TRCIDR3_Register;
      --  TRCIDR4
      TRCIDR4          : aliased TRCIDR4_Register;
      --  TRCIDR5
      TRCIDR5          : aliased TRCIDR5_Register;
      --  TRCIDR6
      TRCIDR6          : aliased RP2350.UInt32;
      --  TRCIDR7
      TRCIDR7          : aliased RP2350.UInt32;
      --  The TRCRSCTLR controls the trace resources
      TRCRSCTLR2       : aliased TRCRSCTLR_Register;
      --  The TRCRSCTLR controls the trace resources
      TRCRSCTLR3       : aliased TRCRSCTLR_Register;
      --  Controls the corresponding single-shot comparator resource
      TRCSSCSR         : aliased TRCSSCSR_Register;
      --  Selects the PE comparator inputs for Single-shot control
      TRCSSPCICR       : aliased TRCSSPCICR_Register;
      --  Requests the system to provide power to the trace unit
      TRCPDCR          : aliased TRCPDCR_Register;
      --  Returns the following information about the trace unit: - OS Lock
      --  status. - Core power domain status. - Power interruption status
      TRCPDSR          : aliased TRCPDSR_Register;
      --  Trace Integration ATB Identification Register
      TRCITATBIDR      : aliased TRCITATBIDR_Register;
      --  Trace Integration Instruction ATB In Register
      TRCITIATBINR     : aliased TRCITIATBINR_Register;
      --  Trace Integration Instruction ATB Out Register
      TRCITIATBOUTR    : aliased TRCITIATBOUTR_Register;
      --  Claim Tag Set Register
      TRCCLAIMSET      : aliased TRCCLAIMSET_Register;
      --  Claim Tag Clear Register
      TRCCLAIMCLR      : aliased TRCCLAIMCLR_Register;
      --  Returns the level of tracing that the trace unit can support
      TRCAUTHSTATUS    : aliased TRCAUTHSTATUS_Register;
      --  TRCDEVARCH
      TRCDEVARCH       : aliased TRCDEVARCH_Register;
      --  TRCDEVID
      TRCDEVID         : aliased RP2350.UInt32;
      --  TRCDEVTYPE
      TRCDEVTYPE       : aliased TRCDEVTYPE_Register;
      --  TRCPIDR4
      TRCPIDR4         : aliased TRCPIDR4_Register;
      --  TRCPIDR5
      TRCPIDR5         : aliased RP2350.UInt32;
      --  TRCPIDR6
      TRCPIDR6         : aliased RP2350.UInt32;
      --  TRCPIDR7
      TRCPIDR7         : aliased RP2350.UInt32;
      --  TRCPIDR0
      TRCPIDR0         : aliased TRCPIDR0_Register;
      --  TRCPIDR1
      TRCPIDR1         : aliased TRCPIDR1_Register;
      --  TRCPIDR2
      TRCPIDR2         : aliased TRCPIDR2_Register;
      --  TRCPIDR3
      TRCPIDR3         : aliased TRCPIDR3_Register;
      --  TRCCIDR0
      TRCCIDR0         : aliased TRCCIDR0_Register;
      --  TRCCIDR1
      TRCCIDR1         : aliased TRCCIDR1_Register;
      --  TRCCIDR2
      TRCCIDR2         : aliased TRCCIDR2_Register;
      --  TRCCIDR3
      TRCCIDR3         : aliased TRCCIDR3_Register;
      --  CTI Control Register
      CTICONTROL       : aliased CTICONTROL_Register;
      --  CTI Interrupt Acknowledge Register
      CTIINTACK        : aliased CTIINTACK_Register;
      --  CTI Application Trigger Set Register
      CTIAPPSET        : aliased CTIAPPSET_Register;
      --  CTI Application Trigger Clear Register
      CTIAPPCLEAR      : aliased CTIAPPCLEAR_Register;
      --  CTI Application Pulse Register
      CTIAPPPULSE      : aliased CTIAPPPULSE_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN0         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN1         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN2         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN3         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN4         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN5         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN6         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIINEN7         : aliased CTIINEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN0        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN1        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN2        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN3        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN4        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN5        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN6        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTIOUTEN7        : aliased CTIOUTEN_Register;
      --  CTI Trigger to Channel Enable Registers
      CTITRIGINSTATUS  : aliased CTITRIGINSTATUS_Register;
      --  CTI Trigger In Status Register
      CTITRIGOUTSTATUS : aliased CTITRIGOUTSTATUS_Register;
      --  CTI Channel In Status Register
      CTICHINSTATUS    : aliased CTICHINSTATUS_Register;
      --  Enable CTI Channel Gate register
      CTIGATE          : aliased CTIGATE_Register;
      --  External Multiplexer Control register
      ASICCTL          : aliased RP2350.UInt32;
      --  Integration Test Channel Output register
      ITCHOUT          : aliased ITCHOUT_Register;
      --  Integration Test Trigger Output register
      ITTRIGOUT        : aliased ITTRIGOUT_Register;
      --  Integration Test Channel Input register
      ITCHIN           : aliased ITCHIN_Register;
      --  Integration Mode Control register
      ITCTRL           : aliased ITCTRL_Register;
      --  Device Architecture register
      DEVARCH          : aliased DEVARCH_Register;
      --  Device Configuration register
      DEVID            : aliased DEVID_Register;
      --  Device Type Identifier register
      DEVTYPE          : aliased DEVTYPE_Register;
      --  CoreSight Peripheral ID4
      PIDR4            : aliased PIDR4_Register;
      --  CoreSight Peripheral ID5
      PIDR5            : aliased RP2350.UInt32;
      --  CoreSight Peripheral ID6
      PIDR6            : aliased RP2350.UInt32;
      --  CoreSight Peripheral ID7
      PIDR7            : aliased RP2350.UInt32;
      --  CoreSight Peripheral ID0
      PIDR0            : aliased PIDR0_Register;
      --  CoreSight Peripheral ID1
      PIDR1            : aliased PIDR1_Register;
      --  CoreSight Peripheral ID2
      PIDR2            : aliased PIDR2_Register;
      --  CoreSight Peripheral ID3
      PIDR3            : aliased PIDR3_Register;
      --  CoreSight Component ID0
      CIDR0            : aliased CIDR0_Register;
      --  CoreSight Component ID1
      CIDR1            : aliased CIDR1_Register;
      --  CoreSight Component ID2
      CIDR2            : aliased CIDR2_Register;
      --  CoreSight Component ID3
      CIDR3            : aliased CIDR3_Register;
   end record
     with Volatile;

   for PPB_NS_Peripheral use record
      ITM_STIM0        at 16#0# range 0 .. 31;
      ITM_STIM1        at 16#4# range 0 .. 31;
      ITM_STIM2        at 16#8# range 0 .. 31;
      ITM_STIM3        at 16#C# range 0 .. 31;
      ITM_STIM4        at 16#10# range 0 .. 31;
      ITM_STIM5        at 16#14# range 0 .. 31;
      ITM_STIM6        at 16#18# range 0 .. 31;
      ITM_STIM7        at 16#1C# range 0 .. 31;
      ITM_STIM8        at 16#20# range 0 .. 31;
      ITM_STIM9        at 16#24# range 0 .. 31;
      ITM_STIM10       at 16#28# range 0 .. 31;
      ITM_STIM11       at 16#2C# range 0 .. 31;
      ITM_STIM12       at 16#30# range 0 .. 31;
      ITM_STIM13       at 16#34# range 0 .. 31;
      ITM_STIM14       at 16#38# range 0 .. 31;
      ITM_STIM15       at 16#3C# range 0 .. 31;
      ITM_STIM16       at 16#40# range 0 .. 31;
      ITM_STIM17       at 16#44# range 0 .. 31;
      ITM_STIM18       at 16#48# range 0 .. 31;
      ITM_STIM19       at 16#4C# range 0 .. 31;
      ITM_STIM20       at 16#50# range 0 .. 31;
      ITM_STIM21       at 16#54# range 0 .. 31;
      ITM_STIM22       at 16#58# range 0 .. 31;
      ITM_STIM23       at 16#5C# range 0 .. 31;
      ITM_STIM24       at 16#60# range 0 .. 31;
      ITM_STIM25       at 16#64# range 0 .. 31;
      ITM_STIM26       at 16#68# range 0 .. 31;
      ITM_STIM27       at 16#6C# range 0 .. 31;
      ITM_STIM28       at 16#70# range 0 .. 31;
      ITM_STIM29       at 16#74# range 0 .. 31;
      ITM_STIM30       at 16#78# range 0 .. 31;
      ITM_STIM31       at 16#7C# range 0 .. 31;
      ITM_TER0         at 16#E00# range 0 .. 31;
      ITM_TPR          at 16#E40# range 0 .. 31;
      ITM_TCR          at 16#E80# range 0 .. 31;
      INT_ATREADY      at 16#EF0# range 0 .. 31;
      INT_ATVALID      at 16#EF8# range 0 .. 31;
      ITM_ITCTRL       at 16#F00# range 0 .. 31;
      ITM_DEVARCH      at 16#FBC# range 0 .. 31;
      ITM_DEVTYPE      at 16#FCC# range 0 .. 31;
      ITM_PIDR4        at 16#FD0# range 0 .. 31;
      ITM_PIDR5        at 16#FD4# range 0 .. 31;
      ITM_PIDR6        at 16#FD8# range 0 .. 31;
      ITM_PIDR7        at 16#FDC# range 0 .. 31;
      ITM_PIDR0        at 16#FE0# range 0 .. 31;
      ITM_PIDR1        at 16#FE4# range 0 .. 31;
      ITM_PIDR2        at 16#FE8# range 0 .. 31;
      ITM_PIDR3        at 16#FEC# range 0 .. 31;
      ITM_CIDR0        at 16#FF0# range 0 .. 31;
      ITM_CIDR1        at 16#FF4# range 0 .. 31;
      ITM_CIDR2        at 16#FF8# range 0 .. 31;
      ITM_CIDR3        at 16#FFC# range 0 .. 31;
      DWT_CTRL         at 16#1000# range 0 .. 31;
      DWT_CYCCNT       at 16#1004# range 0 .. 31;
      DWT_EXCCNT       at 16#100C# range 0 .. 31;
      DWT_LSUCNT       at 16#1014# range 0 .. 31;
      DWT_FOLDCNT      at 16#1018# range 0 .. 31;
      DWT_COMP0        at 16#1020# range 0 .. 31;
      DWT_FUNCTION0    at 16#1028# range 0 .. 31;
      DWT_COMP1        at 16#1030# range 0 .. 31;
      DWT_FUNCTION1    at 16#1038# range 0 .. 31;
      DWT_COMP2        at 16#1040# range 0 .. 31;
      DWT_FUNCTION2    at 16#1048# range 0 .. 31;
      DWT_COMP3        at 16#1050# range 0 .. 31;
      DWT_FUNCTION3    at 16#1058# range 0 .. 31;
      DWT_DEVARCH      at 16#1FBC# range 0 .. 31;
      DWT_DEVTYPE      at 16#1FCC# range 0 .. 31;
      DWT_PIDR4        at 16#1FD0# range 0 .. 31;
      DWT_PIDR5        at 16#1FD4# range 0 .. 31;
      DWT_PIDR6        at 16#1FD8# range 0 .. 31;
      DWT_PIDR7        at 16#1FDC# range 0 .. 31;
      DWT_PIDR0        at 16#1FE0# range 0 .. 31;
      DWT_PIDR1        at 16#1FE4# range 0 .. 31;
      DWT_PIDR2        at 16#1FE8# range 0 .. 31;
      DWT_PIDR3        at 16#1FEC# range 0 .. 31;
      DWT_CIDR0        at 16#1FF0# range 0 .. 31;
      DWT_CIDR1        at 16#1FF4# range 0 .. 31;
      DWT_CIDR2        at 16#1FF8# range 0 .. 31;
      DWT_CIDR3        at 16#1FFC# range 0 .. 31;
      FP_CTRL          at 16#2000# range 0 .. 31;
      FP_REMAP         at 16#2004# range 0 .. 31;
      FP_COMP0         at 16#2008# range 0 .. 31;
      FP_COMP1         at 16#200C# range 0 .. 31;
      FP_COMP2         at 16#2010# range 0 .. 31;
      FP_COMP3         at 16#2014# range 0 .. 31;
      FP_COMP4         at 16#2018# range 0 .. 31;
      FP_COMP5         at 16#201C# range 0 .. 31;
      FP_COMP6         at 16#2020# range 0 .. 31;
      FP_COMP7         at 16#2024# range 0 .. 31;
      FP_DEVARCH       at 16#2FBC# range 0 .. 31;
      FP_DEVTYPE       at 16#2FCC# range 0 .. 31;
      FP_PIDR4         at 16#2FD0# range 0 .. 31;
      FP_PIDR5         at 16#2FD4# range 0 .. 31;
      FP_PIDR6         at 16#2FD8# range 0 .. 31;
      FP_PIDR7         at 16#2FDC# range 0 .. 31;
      FP_PIDR0         at 16#2FE0# range 0 .. 31;
      FP_PIDR1         at 16#2FE4# range 0 .. 31;
      FP_PIDR2         at 16#2FE8# range 0 .. 31;
      FP_PIDR3         at 16#2FEC# range 0 .. 31;
      FP_CIDR0         at 16#2FF0# range 0 .. 31;
      FP_CIDR1         at 16#2FF4# range 0 .. 31;
      FP_CIDR2         at 16#2FF8# range 0 .. 31;
      FP_CIDR3         at 16#2FFC# range 0 .. 31;
      ICTR             at 16#E004# range 0 .. 31;
      ACTLR            at 16#E008# range 0 .. 31;
      SYST_CSR         at 16#E010# range 0 .. 31;
      SYST_RVR         at 16#E014# range 0 .. 31;
      SYST_CVR         at 16#E018# range 0 .. 31;
      SYST_CALIB       at 16#E01C# range 0 .. 31;
      NVIC_ISER0       at 16#E100# range 0 .. 31;
      NVIC_ISER1       at 16#E104# range 0 .. 31;
      NVIC_ICER0       at 16#E180# range 0 .. 31;
      NVIC_ICER1       at 16#E184# range 0 .. 31;
      NVIC_ISPR0       at 16#E200# range 0 .. 31;
      NVIC_ISPR1       at 16#E204# range 0 .. 31;
      NVIC_ICPR0       at 16#E280# range 0 .. 31;
      NVIC_ICPR1       at 16#E284# range 0 .. 31;
      NVIC_IABR0       at 16#E300# range 0 .. 31;
      NVIC_IABR1       at 16#E304# range 0 .. 31;
      NVIC_ITNS0       at 16#E380# range 0 .. 31;
      NVIC_ITNS1       at 16#E384# range 0 .. 31;
      NVIC_IPR0        at 16#E400# range 0 .. 31;
      NVIC_IPR1        at 16#E404# range 0 .. 31;
      NVIC_IPR2        at 16#E408# range 0 .. 31;
      NVIC_IPR3        at 16#E40C# range 0 .. 31;
      NVIC_IPR4        at 16#E410# range 0 .. 31;
      NVIC_IPR5        at 16#E414# range 0 .. 31;
      NVIC_IPR6        at 16#E418# range 0 .. 31;
      NVIC_IPR7        at 16#E41C# range 0 .. 31;
      NVIC_IPR8        at 16#E420# range 0 .. 31;
      NVIC_IPR9        at 16#E424# range 0 .. 31;
      NVIC_IPR10       at 16#E428# range 0 .. 31;
      NVIC_IPR11       at 16#E42C# range 0 .. 31;
      NVIC_IPR12       at 16#E430# range 0 .. 31;
      NVIC_IPR13       at 16#E434# range 0 .. 31;
      NVIC_IPR14       at 16#E438# range 0 .. 31;
      NVIC_IPR15       at 16#E43C# range 0 .. 31;
      CPUID            at 16#ED00# range 0 .. 31;
      ICSR             at 16#ED04# range 0 .. 31;
      VTOR             at 16#ED08# range 0 .. 31;
      AIRCR            at 16#ED0C# range 0 .. 31;
      SCR              at 16#ED10# range 0 .. 31;
      CCR              at 16#ED14# range 0 .. 31;
      SHPR1            at 16#ED18# range 0 .. 31;
      SHPR2            at 16#ED1C# range 0 .. 31;
      SHPR3            at 16#ED20# range 0 .. 31;
      SHCSR            at 16#ED24# range 0 .. 31;
      CFSR             at 16#ED28# range 0 .. 31;
      HFSR             at 16#ED2C# range 0 .. 31;
      DFSR             at 16#ED30# range 0 .. 31;
      MMFAR            at 16#ED34# range 0 .. 31;
      BFAR             at 16#ED38# range 0 .. 31;
      ID_PFR0          at 16#ED40# range 0 .. 31;
      ID_PFR1          at 16#ED44# range 0 .. 31;
      ID_DFR0          at 16#ED48# range 0 .. 31;
      ID_AFR0          at 16#ED4C# range 0 .. 31;
      ID_MMFR0         at 16#ED50# range 0 .. 31;
      ID_MMFR1         at 16#ED54# range 0 .. 31;
      ID_MMFR2         at 16#ED58# range 0 .. 31;
      ID_MMFR3         at 16#ED5C# range 0 .. 31;
      ID_ISAR0         at 16#ED60# range 0 .. 31;
      ID_ISAR1         at 16#ED64# range 0 .. 31;
      ID_ISAR2         at 16#ED68# range 0 .. 31;
      ID_ISAR3         at 16#ED6C# range 0 .. 31;
      ID_ISAR4         at 16#ED70# range 0 .. 31;
      ID_ISAR5         at 16#ED74# range 0 .. 31;
      CTR              at 16#ED7C# range 0 .. 31;
      CPACR            at 16#ED88# range 0 .. 31;
      NSACR            at 16#ED8C# range 0 .. 31;
      MPU_TYPE         at 16#ED90# range 0 .. 31;
      MPU_CTRL         at 16#ED94# range 0 .. 31;
      MPU_RNR          at 16#ED98# range 0 .. 31;
      MPU_RBAR         at 16#ED9C# range 0 .. 31;
      MPU_RLAR         at 16#EDA0# range 0 .. 31;
      MPU_RBAR_A1      at 16#EDA4# range 0 .. 31;
      MPU_RLAR_A1      at 16#EDA8# range 0 .. 31;
      MPU_RBAR_A2      at 16#EDAC# range 0 .. 31;
      MPU_RLAR_A2      at 16#EDB0# range 0 .. 31;
      MPU_RBAR_A3      at 16#EDB4# range 0 .. 31;
      MPU_RLAR_A3      at 16#EDB8# range 0 .. 31;
      MPU_MAIR0        at 16#EDC0# range 0 .. 31;
      MPU_MAIR1        at 16#EDC4# range 0 .. 31;
      SAU_CTRL         at 16#EDD0# range 0 .. 31;
      SAU_TYPE         at 16#EDD4# range 0 .. 31;
      SAU_RNR          at 16#EDD8# range 0 .. 31;
      SAU_RBAR         at 16#EDDC# range 0 .. 31;
      SAU_RLAR         at 16#EDE0# range 0 .. 31;
      SFSR             at 16#EDE4# range 0 .. 31;
      SFAR             at 16#EDE8# range 0 .. 31;
      DHCSR            at 16#EDF0# range 0 .. 31;
      DCRSR            at 16#EDF4# range 0 .. 31;
      DCRDR            at 16#EDF8# range 0 .. 31;
      DEMCR            at 16#EDFC# range 0 .. 31;
      DSCSR            at 16#EE08# range 0 .. 31;
      STIR             at 16#EF00# range 0 .. 31;
      FPCCR            at 16#EF34# range 0 .. 31;
      FPCAR            at 16#EF38# range 0 .. 31;
      FPDSCR           at 16#EF3C# range 0 .. 31;
      MVFR0            at 16#EF40# range 0 .. 31;
      MVFR1            at 16#EF44# range 0 .. 31;
      MVFR2            at 16#EF48# range 0 .. 31;
      DDEVARCH         at 16#EFBC# range 0 .. 31;
      DDEVTYPE         at 16#EFCC# range 0 .. 31;
      DPIDR4           at 16#EFD0# range 0 .. 31;
      DPIDR5           at 16#EFD4# range 0 .. 31;
      DPIDR6           at 16#EFD8# range 0 .. 31;
      DPIDR7           at 16#EFDC# range 0 .. 31;
      DPIDR0           at 16#EFE0# range 0 .. 31;
      DPIDR1           at 16#EFE4# range 0 .. 31;
      DPIDR2           at 16#EFE8# range 0 .. 31;
      DPIDR3           at 16#EFEC# range 0 .. 31;
      DCIDR0           at 16#EFF0# range 0 .. 31;
      DCIDR1           at 16#EFF4# range 0 .. 31;
      DCIDR2           at 16#EFF8# range 0 .. 31;
      DCIDR3           at 16#EFFC# range 0 .. 31;
      TRCPRGCTLR       at 16#41004# range 0 .. 31;
      TRCSTATR         at 16#4100C# range 0 .. 31;
      TRCCONFIGR       at 16#41010# range 0 .. 31;
      TRCEVENTCTL0R    at 16#41020# range 0 .. 31;
      TRCEVENTCTL1R    at 16#41024# range 0 .. 31;
      TRCSTALLCTLR     at 16#4102C# range 0 .. 31;
      TRCTSCTLR        at 16#41030# range 0 .. 31;
      TRCSYNCPR        at 16#41034# range 0 .. 31;
      TRCCCCTLR        at 16#41038# range 0 .. 31;
      TRCVICTLR        at 16#41080# range 0 .. 31;
      TRCCNTRLDVR0     at 16#41140# range 0 .. 31;
      TRCIDR8          at 16#41180# range 0 .. 31;
      TRCIDR9          at 16#41184# range 0 .. 31;
      TRCIDR10         at 16#41188# range 0 .. 31;
      TRCIDR11         at 16#4118C# range 0 .. 31;
      TRCIDR12         at 16#41190# range 0 .. 31;
      TRCIDR13         at 16#41194# range 0 .. 31;
      TRCIMSPEC        at 16#411C0# range 0 .. 31;
      TRCIDR0          at 16#411E0# range 0 .. 31;
      TRCIDR1          at 16#411E4# range 0 .. 31;
      TRCIDR2          at 16#411E8# range 0 .. 31;
      TRCIDR3          at 16#411EC# range 0 .. 31;
      TRCIDR4          at 16#411F0# range 0 .. 31;
      TRCIDR5          at 16#411F4# range 0 .. 31;
      TRCIDR6          at 16#411F8# range 0 .. 31;
      TRCIDR7          at 16#411FC# range 0 .. 31;
      TRCRSCTLR2       at 16#41208# range 0 .. 31;
      TRCRSCTLR3       at 16#4120C# range 0 .. 31;
      TRCSSCSR         at 16#412A0# range 0 .. 31;
      TRCSSPCICR       at 16#412C0# range 0 .. 31;
      TRCPDCR          at 16#41310# range 0 .. 31;
      TRCPDSR          at 16#41314# range 0 .. 31;
      TRCITATBIDR      at 16#41EE4# range 0 .. 31;
      TRCITIATBINR     at 16#41EF4# range 0 .. 31;
      TRCITIATBOUTR    at 16#41EFC# range 0 .. 31;
      TRCCLAIMSET      at 16#41FA0# range 0 .. 31;
      TRCCLAIMCLR      at 16#41FA4# range 0 .. 31;
      TRCAUTHSTATUS    at 16#41FB8# range 0 .. 31;
      TRCDEVARCH       at 16#41FBC# range 0 .. 31;
      TRCDEVID         at 16#41FC8# range 0 .. 31;
      TRCDEVTYPE       at 16#41FCC# range 0 .. 31;
      TRCPIDR4         at 16#41FD0# range 0 .. 31;
      TRCPIDR5         at 16#41FD4# range 0 .. 31;
      TRCPIDR6         at 16#41FD8# range 0 .. 31;
      TRCPIDR7         at 16#41FDC# range 0 .. 31;
      TRCPIDR0         at 16#41FE0# range 0 .. 31;
      TRCPIDR1         at 16#41FE4# range 0 .. 31;
      TRCPIDR2         at 16#41FE8# range 0 .. 31;
      TRCPIDR3         at 16#41FEC# range 0 .. 31;
      TRCCIDR0         at 16#41FF0# range 0 .. 31;
      TRCCIDR1         at 16#41FF4# range 0 .. 31;
      TRCCIDR2         at 16#41FF8# range 0 .. 31;
      TRCCIDR3         at 16#41FFC# range 0 .. 31;
      CTICONTROL       at 16#42000# range 0 .. 31;
      CTIINTACK        at 16#42010# range 0 .. 31;
      CTIAPPSET        at 16#42014# range 0 .. 31;
      CTIAPPCLEAR      at 16#42018# range 0 .. 31;
      CTIAPPPULSE      at 16#4201C# range 0 .. 31;
      CTIINEN0         at 16#42020# range 0 .. 31;
      CTIINEN1         at 16#42024# range 0 .. 31;
      CTIINEN2         at 16#42028# range 0 .. 31;
      CTIINEN3         at 16#4202C# range 0 .. 31;
      CTIINEN4         at 16#42030# range 0 .. 31;
      CTIINEN5         at 16#42034# range 0 .. 31;
      CTIINEN6         at 16#42038# range 0 .. 31;
      CTIINEN7         at 16#4203C# range 0 .. 31;
      CTIOUTEN0        at 16#420A0# range 0 .. 31;
      CTIOUTEN1        at 16#420A4# range 0 .. 31;
      CTIOUTEN2        at 16#420A8# range 0 .. 31;
      CTIOUTEN3        at 16#420AC# range 0 .. 31;
      CTIOUTEN4        at 16#420B0# range 0 .. 31;
      CTIOUTEN5        at 16#420B4# range 0 .. 31;
      CTIOUTEN6        at 16#420B8# range 0 .. 31;
      CTIOUTEN7        at 16#420BC# range 0 .. 31;
      CTITRIGINSTATUS  at 16#42130# range 0 .. 31;
      CTITRIGOUTSTATUS at 16#42134# range 0 .. 31;
      CTICHINSTATUS    at 16#42138# range 0 .. 31;
      CTIGATE          at 16#42140# range 0 .. 31;
      ASICCTL          at 16#42144# range 0 .. 31;
      ITCHOUT          at 16#42EE4# range 0 .. 31;
      ITTRIGOUT        at 16#42EE8# range 0 .. 31;
      ITCHIN           at 16#42EF4# range 0 .. 31;
      ITCTRL           at 16#42F00# range 0 .. 31;
      DEVARCH          at 16#42FBC# range 0 .. 31;
      DEVID            at 16#42FC8# range 0 .. 31;
      DEVTYPE          at 16#42FCC# range 0 .. 31;
      PIDR4            at 16#42FD0# range 0 .. 31;
      PIDR5            at 16#42FD4# range 0 .. 31;
      PIDR6            at 16#42FD8# range 0 .. 31;
      PIDR7            at 16#42FDC# range 0 .. 31;
      PIDR0            at 16#42FE0# range 0 .. 31;
      PIDR1            at 16#42FE4# range 0 .. 31;
      PIDR2            at 16#42FE8# range 0 .. 31;
      PIDR3            at 16#42FEC# range 0 .. 31;
      CIDR0            at 16#42FF0# range 0 .. 31;
      CIDR1            at 16#42FF4# range 0 .. 31;
      CIDR2            at 16#42FF8# range 0 .. 31;
      CIDR3            at 16#42FFC# range 0 .. 31;
   end record;

   --  TEAL registers accessible through the debug interface
   PPB_NS_Periph : aliased PPB_NS_Peripheral
     with Import, Address => PPB_NS_Base;

end RP2350.PPB_NS;
