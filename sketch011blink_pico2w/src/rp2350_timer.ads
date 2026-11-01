
with System;

with Interfaces; use Interfaces;

package RP2350_Timer is

   Timer_Base_Address : constant := 16#400B0000#;

   type Timer_Peripheral is record
      -- We only need the RAW Low and RAW High 32-bit registers 
      -- for a non-blocking poll.
      TIME_RAWL : Unsigned_32;
      TIME_RAWH : Unsigned_32;
   end record with Volatile, Size => 64, Alignment => 4;

   -- Ensure that the compiler handles these strictly as 32-bit words
   pragma Pack (Timer_Peripheral);

   -- Bind the peripheral record to the absolute memory location
   Timer_Periph : Timer_Peripheral
     with Address => System'To_Address (Timer_Base_Address), Volatile;

   procedure Delay_Microseconds (US : Unsigned_32);
   function Get_Time_US return Unsigned_64;

end RP2350_Timer;
