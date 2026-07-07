
package body Utilities is

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

   protected body Wireless_Bus is

   procedure Initialize is

   begin
      --  1. Take GPIO 23 high to turn on power to the Infineon chip
      --  Map SVD GPIO registers for pins 23, 24, 25, 29 here
      null; 

      --  2. Pull CS (GPIO 25) high, CLK (GPIO 29) low to establish initial idle states
      null;

   end Initialize;

   procedure Send_SPI_Word (Data : Unsigned_32) is
      begin
      --  Bit-bang or utilize a hardware SPI controller to stream 32 bits
      --  Drop CS low, cycle CLK for each bit of the payload,
      --   raise CS back up
      null;

   end Send_SPI_Word;

      procedure Set_LED_State (Enabled : Boolean) is
         --  Custom Infineon command payload architecture
         --  Command structure format: Write Window -> Function 1 -> Register Address
         Cmd_Header : Unsigned_32 := 16#A0000000#; -- Example write frame flag
         Data_Frame : Unsigned_32 := 0;
      begin
         if Enabled then
            Data_Frame := 16#01#; -- Set bit 0 high for WL_GPIO0
         else
            Data_Frame := 16#00#; -- Set bit 0 low
         end if;

         --  Send the protocol packet across the bus
         Send_SPI_Word (Cmd_Header);
         Send_SPI_Word (Data_Frame);

      end Set_LED_State;

   end Wireless_Bus;

end Utilities;
