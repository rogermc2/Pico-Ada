
with Ada.Real_Time; use Ada.Real_Time;
with Ada.Real_Time.Delays;

with RP2350.Clocks; use RP2350.Clocks;
with RP2350.XOSC; use RP2350.XOSC;
with RP2350.Ticks; use RP2350.Ticks;

package body Two_Blinking_LEDs is
   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   --  Dummy : Unsigned_32 := 0
   --    with Volatile;

   --  procedure Delay_Loop (Max_I : positive) is
   --  begin
   --     for I in 1 .. Max_I loop
   --        Dummy := Dummy + 1;
   --     end loop;
   --  end Delay_Loop;

procedure Initialize_Hardware_Clocks is
use RP2350.XOSC;
use rp2350;
begin
   --  Step 1: Initialize the External Crystal Oscillator (XOSC)
   --  Set startup delay to give the crystal time to physically stabilize
   --  A value of 47 handles the 12MHz crystal on standard Pico boards safely.
   XOSC_Periph.STARTUP.DELAY_k := 47;
   
   -- Enable the XOSC module
   --  XOSC_Periph.CTRL.ENABLE :=  16#FAB#; -- Magic hardware keyword for ENABLE
   XOSC_Periph.CTRL.ENABLE := ENABLE;
   
   -- Poll the status register until the hardware confirms the clock is stable
   while XOSC_Periph.STATUS.STABLE = 0 loop
      null;
   end loop;

   --  Step 2: Route Reference Clock (clk_ref) to XOSC
   --  Set the source mux of clk_ref to use XOSC (usually value 2 in SVD map)
   --  This provides a precise 12MHz base time signature for internal peripherals
   Clocks_Periph.CLK_REF_CTRL.SRC := XOSC_Clksrc;
   
   --  Wait for the reference clock hardware switch to complete safely
   while Clocks_Periph.CLK_REF_SELECTED.CLK_REF_SELECTED = 0 loop
      null;
   end loop;

   --  Step 3: Route System Clock (clk_sys) to XOSC
   --  Before moving the main clock, ensure the reference clocks are mapped.
   --  Set the system clock multiplexer to use clk_ref (value 0) or xosc directly.
   Clocks_Periph.CLK_SYS_CTRL.SRC := clk_ref; 
   
   --  Wait for the system clock mux switch to successfully lock in place
   while Clocks_Periph.CLK_SYS_SELECTED.CLK_SYS_SELECTED = 0 loop
      null;
   end loop;
   
--  Step 4: Tick the Watchdog (Feeds the Tick Counter)
--  The tick logic is now configured in the standalone Ticks_Periph block.
--  12 clock cycles of your 12MHz reference clock = 1 microsecond interval
Ticks_Periph.PROC0_CYCLES := (PROC0_CYCLES => 12, others => <>); 

-- Set ENABLE to 1 or True depending on type; ignore RUNNING and reserved bits
Ticks_Periph.PROC0_CTRL   := (ENABLE => 1, RUNNING => 0, others => <>);

end Initialize_Hardware_Clocks;

   procedure Blink_LED (LED : Pin_Number; On_Time, Off_Time : in Duration) is
      On_Period  : constant Time_Span := To_Time_Span (On_Time);
      Off_Period : constant Time_Span := To_Time_Span (Off_Time);
      Next       : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      Initialize_Hardware_Clocks; 
      Init_Output (LED);

      loop
         Set_High (LED);
         Next := Next + On_Period;
         delay until Next;

         Set_Low (LED);
         Next := Next + Off_Period;
         delay until Next;
      end loop;

   end Blink_LED;

   task body Core_2 is
   begin
     Blink_LED (Internal_LED, 1.009, 0.503);
   end Core_2;
   
end Two_Blinking_LEDs;
