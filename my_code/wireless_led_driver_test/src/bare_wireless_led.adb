
with rp2350; use rp2350; -- Gives access to SIO_Periph
with RP2350.IO_BANK0; use RP2350.IO_BANK0;
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
         for I in 1 .. 2000 loop
            -- 1. Setup the target Data pin state (GPIO 24)
            Set_Pin_Level (Pin => 24, High => ((UInt32 (Val) and Bit_Mask) /= 0));

            -- 2. Pull the Clock line High (GPIO 29)
            Set_Pin_Level (Pin => 29, High => True);
            
            -- Keep line stretched to meet setup/hold timing thresholds
            for J in 1 .. 20 loop
                null;
            end loop;

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
         --  SIO_Periph.CTRL (25).OUT_k := 0;
         Set_Pin_Level (Pin => 25, High => False); -- CS Low

         --  Stream the Command Header across the pins
         Bit_Bang_Write_32 (Command);
         
         --  Stream the actual 32-bit payload data
         Bit_Bang_Write_32 (Data);

         --  Raise Chip Select back high (GPIO 25) to end transaction safely
         --  SIO_Periph.CTRL (25).OUT_k := 1;
         Set_Pin_Level (Pin => 25, High => True);  -- CS High

      end Write_CYW43_Register;

        -- System Wake/Power Initialization
      procedure Initialize is
      begin
      --  Route Physical Pins to SIO (Single-Cycle IO Function 5)
      --  On the RP2350, Function value 5 routes standard pins to the SIO block.
      --  Check your SVD record names. If it uses a flat layout or custom type,
      --  use the correct aggregate representation mapping.
      IO_BANK0_Periph.GPIO23_CTRL := (FUNCSEL => siob_proc_23, others => <>); -- WL_REG_ON (Power)
      IO_BANK0_Periph.GPIO24_CTRL := (FUNCSEL => siob_proc_24, others => <>); -- WL_DIO (Data)
      IO_BANK0_Periph.GPIO25_CTRL := (FUNCSEL => siob_proc_25, others => <>); -- WL_CS (Chip Select)
      IO_BANK0_Periph.GPIO29_CTRL := (FUNCSEL => siob_proc_29, others => <>); -- WL_CLK (Clock)

      -- Set Pad Directionality Enforcements
      -- SIO output logic requires enabling the output override buffer mask.
      -- Pin bits: Bit 23, 24, 25, 29 must have their output drivers turned on.
      declare
         Dir_Mask : constant UInt32 := (2**23) or (2**24) or (2**25) or (2**29);
      begin
         SIO_Periph.GPIO_OE_SET := Dir_Mask;
      end;

      --  Physical Wireless Hardware Reset Sequence
      Set_Pin_Level (Pin => 23, High => False); -- Pull Power down (Reset)
      Set_Pin_Level (Pin => 25, High => True);  -- Keep CS High (Idle)
      Set_Pin_Level (Pin => 29, High => False); -- Keep Clock Low (Idle)
      
      for I in 1 .. 5000 loop
         null; 
      end loop;

      -- Power up the Infineon Chip
      Set_Pin_Level (Pin => 23, High => True);  
      
      -- Allow the external module to finish loading boot firmware parameters
      for I in 1 .. 250_000 loop
         null; 
      end loop;

      -- Send the gSPI orientation initialization packet
      Write_CYW43_Register (Function_Num => 0, Address => 16#00#, Data => 16#0000_0001#);
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
