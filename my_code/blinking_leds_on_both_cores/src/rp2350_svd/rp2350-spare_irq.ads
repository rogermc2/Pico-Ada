pragma Style_Checks (Off);

--  Copyright (c) 2024 Raspberry Pi Ltd.        SPDX-License-Identifier: BSD-3-Clause

--  This spec has been automatically generated from rp2350.svd

pragma Restrictions (No_Elaboration_Code);

with System;

package RP2350.SPARE_IRQ is
   pragma Preelaborate;

   -----------------
   -- Peripherals --
   -----------------

   type SPARE_IRQ_Peripheral is record
   end record
     with Volatile;

   for SPARE_IRQ_Peripheral use record
   end record;

   SPARE_IRQ_Periph : aliased SPARE_IRQ_Peripheral
     with Import, Address => SPARE_IRQ_Base;

end RP2350.SPARE_IRQ;
