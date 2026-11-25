
with System;

with Interfaces; use Interfaces;
with Interfaces.C; use Interfaces.C;

package RP2350_Timer is

   Timer_Base_Address : constant := 16#400B0000#;

   type Timer_Peripheral is record
      -- We only need the RAW Low and RAW High 32-bit registers 
      -- for a non-blocking poll.
      TIME_RAWL : Unsigned_32;
      TIME_RAWH : Unsigned_32;
   end record with Volatile, Size => 64, Alignment => 4;

   --  Ensure that the compiler handles these strictly as 32-bit words
   pragma Pack (Timer_Peripheral);

   --  Bind the peripheral record to the absolute memory location
   Timer_Periph : Timer_Peripheral
     with Address => System'To_Address (Timer_Base_Address), Volatile;

   function C_Printf (Format : System.Address) return Interfaces.C.int
     with Export, Convention => C, External_Name => "printf";
   function C_Puts (Str : System.Address) return Interfaces.C.int
     with Export, Convention => C, External_Name => "puts";
   function C_Strlen (S : System.Address) return Interfaces.C.size_t
     with Export, Convention => C, External_Name => "strlen";
   function C_Strncmp (S1, S2 : System.Address; N : Interfaces.C.size_t) return Interfaces.C.int
     with Export, Convention => C, External_Name => "strncmp";
   function C_Memcpy (Dest, Src : System.Address; N : Interfaces.C.size_t) return System.Address
     with Export, Convention => C, External_Name => "memcpy";
   function C_Memset (Dest : System.Address; C : Interfaces.C.int; N : Interfaces.C.size_t) return System.Address
     with Export, Convention => C, External_Name => "memset";
   function C_Vprintf (Format : System.Address; Args : System.Address) return Interfaces.C.int
     with Export, Convention => C, External_Name => "vprintf";
   -- Stub handler to satisfy the Pico SDK's system clock speed lookup
   function Clock_Get_Hz (Clock_Index : Interfaces.Unsigned_32) return Interfaces.Unsigned_32
     with Export, Convention => C, External_Name => "clock_get_hz";
   function Cyw43_Tcpip_Link_Status (Self : System.Address; Itf : Interfaces.C.int) return Interfaces.C.int
     with Export, Convention => C, External_Name => "cyw43_tcpip_link_status";
   procedure Delay_Microseconds (US : Unsigned_32);
   function Get_Time_US return Unsigned_64;
    procedure Hard_Assertion_Failure 
     with Export, Convention => C, External_Name => "hard_assertion_failure";
   procedure Unhandled_User_IRQ 
     with Export, Convention => C,  External_Name => "__unhandled_user_irq";

   -- The mandatory 256-byte RP2350 second-stage boot configuration signature block
   type Boot2_Block_Array is array (1 .. 64) of Interfaces.Unsigned_32;

   Boot2_Header : constant Boot2_Block_Array := (
      -- Pre-calculated 150MHz QSPI Flash boot block signature matrix for the RP2350
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#, 16#ffff_ffff#,
      -- The final 4 words represent the target entry marker strings and chip CRC32
      16#544f4f42#, 16#00000101#, 16#10000101#, 16#7a213c4b#  -- Pre-calculated CRC
   ) with Export, Convention => C, Linker_Section => ".boot2";

end RP2350_Timer;
