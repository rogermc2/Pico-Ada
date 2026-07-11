

with RP2350; use RP2350;

with Pico2w_Support; use Pico2w_Support;
with Pico_W_Registers; use Pico_W_Registers;
with SVD_Support; use SVD_Support;

package body Wireless_Driver is

   protected body CYW43439_Bus is

      procedure Initialize is
      begin
         if not Initialized then
            Power_On_Infineon_Chip;
            
            -- Set up IO_BANK0 pin multiplexing functions here
            -- Map GPIO 24, 25, and 29 to the internal SPI block 
            Initialize_Wireless_Bus;
            Initialized := True;
         end if;
      end Initialize;

      --  Set_LED constructs the manual bitstream to
      --  address Function 1 (Backplane)
      --  Address: 16#1800501C# (CYW43439 GPIO Output Register)
      --  Set Write Mode (Bit 31) and Auto-Increment (Bit 30)
      procedure Set_LED (Enabled : Boolean) is
         -- 32-bit transaction tokens matching the Infineon gSPI spec
         Command_Word : constant UInt32 := 16#C400_A004#; 
         Data_Payload : UInt32 := 0;  -- Bit 0 LOW sets WL_GPIO0 Low
      begin
         if Enabled then
            Data_Payload := 1; -- Bit 0 HIGH sets WL_GPIO0 High
         end if;

         -- Push Command_Word into the SPI Transmit FIFO register
         Bit_Bang_Send_Word (Command_Word);
         -- Push Data_Payload into the SPI Transmit FIFO register
         Bit_Bang_Send_Word (Data_Payload);
         
      end Set_LED;

   end CYW43439_Bus;

end Wireless_Driver;
