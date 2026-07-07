
with rp2350; use rp2350; -- Gives access to SIO_Periph
with RP2350.SIO; use RP2350.SIO;

package body Bare_Wireless_LED is

   protected body Wireless_Bus is

      --  Atomic Bit Writing Helper
      procedure Set_Pin_Level (Pin : Positive; High : Boolean) is
         -- Create a single active bit at the specific pin index
         -- e.g., Pin 24 translates to 16#0100_0000# (Bit 24 high)
         Bit_Mask : constant UInt32 := Shift_Left (1, Pin);
      begin
         -- Check your SVD record component typing. 
         -- If it strictly requires aggregate format wrappers, use (Val => Bit_Mask).
         -- If it is a basic modular integer, assign the mask directly.
         
         if High then
            -- Set the pin output high
            SIO_Periph.GPIO_OUT_SET := Bit_Mask;
         else
            -- Force the pin output low
            SIO_Periph.GPIO_OUT_CLR := Bit_Mask;
         end if;
      end Set_Pin_Level;

      --  Low-Level Bit-Banging Routine
       procedure Bit_Bang_Write_32 (Val : Unsigned_32) is
         Bit_Mask : UInt32 := 16#8000_0000#;
      begin
         for I in 1 .. 32 loop
            -- 1. Setup the target Data pin state (GPIO 24)
            Set_Pin_Level (Pin => 24, High => ((UInt32 (Val) and Bit_Mask) /= 0));

            -- 2. Pull the Clock line High (GPIO 29)
            Set_Pin_Level (Pin => 29, High => True);
            
            -- Keep line stretched to meet setup/hold timing thresholds
            for J in 1 .. 20 loop null; end loop;

            -- 3. Pull the Clock line Low (GPIO 29)
            Set_Pin_Level (Pin => 29, High => False);
            
            Bit_Mask := Shift_Right (Bit_Mask, 1);
         end loop;
      end Bit_Bang_Write_32;

      --  gSPI Protocol Packet Builder
      procedure Write_CYW43_Register (Function_Num : Unsigned_8; Address : Unsigned_32; Data : Unsigned_32) is
         Command : Unsigned_32 := 0;
      begin
         --  Format the 32-bit Command Header required by the CYW43439 gSPI:
         --  Bit 31: Write Flag (1 = Write, 0 = Read)
         --  Bit 30: Increment Address Flag (1 = Auto Increment)
         --  Bits 29-28: Function Number (0 = SPI Bus, 1 = Backplane/Core, 2 = WLAN)
         --  Bits 27-11: Register Address Map
         --  Bits 10-0: Data Length in bytes (usually 4 bytes for a 32-bit write)
         
         Command := 16#8000_0000# or 16#4000_0000#; -- Write + Auto-Increment
         Command := Command or Shift_Left (Unsigned_32 (Function_Num and 3), 28);
         Command := Command or Shift_Left (Address and 16#1_FFFF#, 11);
         Command := Command or 4; -- 4 Bytes payload size

         --  Drop Chip Select low (GPIO 25) to start the SPI frame
         SIO_Periph.CTRL (25).OUT_k := 0;

         --  Stream the Command Header across the pins
         Bit_Bang_Write_32 (Command);
         
         --  Stream the actual 32-bit payload data
         Bit_Bang_Write_32 (Data);

         --  Raise Chip Select back high (GPIO 25) to end transaction safely
         SIO_Periph.CTRL (25).OUT_k := 1;
      end Write_CYW43_Register;

        -- System Wake/Power Initialization
      procedure Initialize is
      begin
         --  Configure lines as generic system outputs using your SVD records
         --  (Ensure GPIO 23, 24, 25, and 29 are set to Output configurations)
         
         --  Pull down power line (GPIO 23) to physically trigger hardware reset
         SIO_Periph.CTRL (23).OUT_k := 0;
         SIO_Periph.CTRL (25).OUT_k := 1; -- Keep CS High
         SIO_Periph.CTRL (29).OUT_k := 0; -- Keep Clock Low
         
         --  Wait for chip internal discharge
         for I in 1 .. 1000 loop
            null;
         end loop;

         --  Drive power line high (GPIO 23) to wake up the Infineon silicon
         SIO_Periph.CTRL (23).OUT_k := 1;
         
         --  Give the internal firmware state machine time to clear its boot vectors
         for I in 1 .. 50000 loop
            null;
         end loop;

         --  Command sequence: Initialize gSPI block and configure clock parameters
         --  Target Function 0 (SPI Internal Core), Register 16#00# (Bus Control)
         --  Setting bit 0 configures the chip interface for word-wide alignment
         Write_CYW43_Register
          (Function_Num => 0, Address => 16#00#, Data => 16#0000_0001#);

      end Initialize;

      -- Route Toggles Directly to the Target Pin
       procedure Set_LED (LED_State : Boolean) is
         --  The onboard LED is linked to WL_GPIO0 on the chip.
         --  To modify it, target Function 1 (Backplane Core), 
         --  specifically routing to the GPIO Control Register Map address 16#18003#
         Payload : Unsigned_32 := 0;
      begin
         if LED_State then
            Payload := 16#01#; -- High bit maps to WL_GPIO0
         else
            Payload := 16#00#; -- Low bit maps to WL_GPIO0
         end if;

         -- Execute the pure hardware write over the bit-bang interface
         Write_CYW43_Register
          (Function_Num => 1, Address => 16#18003#, Data => Payload);
          
      end Set_LED;

   end Wireless_Bus;

end Bare_Wireless_LED;
