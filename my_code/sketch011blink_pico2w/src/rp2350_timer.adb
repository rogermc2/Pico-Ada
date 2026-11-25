
with System.Storage_Elements;

package body RP2350_Timer is

   function C_Printf (Format : System.Address) return Interfaces.C.int is
   begin
      -- Return 0 to indicate zero characters printed, bypassing debug prints safely
      return 0;
   end C_Printf;
   
   function C_Puts (Str : System.Address) return Interfaces.C.int is
   begin
      -- A minimal stub; we do nothing with the string buffer address
      return 0;
   end C_Puts;
   
   function C_Strlen (S : System.Address) return Interfaces.C.size_t is
      use type System.Address;
      use System.Storage_Elements;
      Ptr   : System.Address := S;
      Count : Interfaces.C.size_t := 0;
      Val   : Interfaces.Unsigned_8 with Address => Ptr;
   begin
      while Val /= 0 loop
         Count := Count + 1;
         Ptr := Ptr + 1;
      end loop;
      return Count;

   end C_Strlen;

   function C_Strncmp (S1, S2 : System.Address; N : Interfaces.C.size_t) return Interfaces.C.int is
      use type System.Address;
      use type Interfaces.C.size_t;
      use System.Storage_Elements;
      Ptr1 : System.Address := S1;
      Ptr2 : System.Address := S2;
      V1   : Interfaces.Unsigned_8 with Address => Ptr1;
      V2   : Interfaces.Unsigned_8 with Address => Ptr2;
   begin
      for I in 1 .. N loop
         if V1 /= V2 then
            return (if V1 < V2 then -1 else 1);
         end if;
         exit when V1 = 0;
         Ptr1 := Ptr1 + 1;
         Ptr2 := Ptr2 + 1;
      end loop;
      return 0;
   end C_Strncmp;

   function C_Memcpy (Dest, Src : System.Address; N : Interfaces.C.size_t) return System.Address is
      use type System.Address;
      use type Interfaces.C.size_t;
      use System.Storage_Elements;
      D_Ptr : System.Address := Dest;
      S_Ptr : System.Address := Src;
      D_Val : Interfaces.Unsigned_8 with Address => D_Ptr;
      S_Val : Interfaces.Unsigned_8 with Address => S_Ptr;
   begin
      for I in 1 .. N loop
         D_Val := S_Val;
         D_Ptr := D_Ptr + 1;
         S_Ptr := S_Ptr + 1;
      end loop;
      return Dest;
   end C_Memcpy;

   function C_Memset (Dest : System.Address; C : Interfaces.C.int; N : Interfaces.C.size_t) return System.Address is
      use type System.Address;
      use type Interfaces.C.size_t;
      use System.Storage_Elements;
      D_Ptr : System.Address := Dest;
      D_Val : Interfaces.Unsigned_8 with Address => D_Ptr;
      Fill  : constant Interfaces.Unsigned_8 := Interfaces.Unsigned_8(C);
   begin
      for I in 1 .. N loop
         D_Val := Fill;
         D_Ptr := D_Ptr + 1;
      end loop;
      return Dest;
   end C_Memset;

   function C_Vprintf (Format : System.Address; Args : System.Address) return Interfaces.C.int is
   begin
      -- Return 0 to indicate no characters were printed, bypassing safely
      return 0;
   end C_Vprintf;
   
   function Clock_Get_Hz (Clock_Index : Interfaces.Unsigned_32) return Interfaces.Unsigned_32 is
   begin
      -- Return 150 MHz (Default RP2350 clk_sys runtime frequency)
      return 150_000_000;
   end Clock_Get_Hz;
   
   function Cyw43_Tcpip_Link_Status (Self : System.Address; Itf : Interfaces.C.int) return Interfaces.C.int is
   begin
      -- Return 0 (CYW43_LINK_DOWN) since the network stack isn't running
      return 0;
   end Cyw43_Tcpip_Link_Status;

   function Get_Time_US return Unsigned_64 is
      High_1, High_2 : Unsigned_32;
      Low            : Unsigned_32;
   begin
      loop
         High_1 := Timer_Periph.TIME_RAWH;
         Low    := Timer_Periph.TIME_RAWL;
         High_2 := Timer_Periph.TIME_RAWH;
         
         --  Exit loop if a 32-bit overflow didn't occur mid-read
         exit when High_1 = High_2;
      end loop;

      --  Shift the High 32 bits and combine with Low 32 bits
      return (Shift_Left (Unsigned_64(High_1), 32)) 
             or Unsigned_64(Low);
   end Get_Time_US;

   procedure Delay_Microseconds (US : Unsigned_32) is
      Start_Time : constant Unsigned_64 := Get_Time_US;
      Target     : constant Unsigned_64 := Start_Time + Unsigned_64(US);
   begin
      --  Busy-wait loop until the hardware counter matches target time
      while Get_Time_US < Target loop
         null;
      end loop;

   end Delay_Microseconds;
   
   procedure Hard_Assertion_Failure is
   begin
      -- Infinite fallback trap if a peripheral crashes
      loop
         null;
      end loop;
   end Hard_Assertion_Failure;

   procedure Unhandled_User_IRQ is
   begin
      -- Standard unhandled interrupt fallback loop trap
      loop
         null;
      end loop;
   end Unhandled_User_IRQ;

end RP2350_Timer;
