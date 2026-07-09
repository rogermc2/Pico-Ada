
with Pico2w_Support; use Pico2w_Support;
with Pico_W_Registers; use Pico_W_Registers;

package body Wireless_Driver is

   protected body CYW43439_Bus is

      procedure Initialize is
      begin
         if not Initialized then
            Power_On_Infineon_Chip;
            
            -- Set up IO_BANK0 pin multiplexing functions here
            -- Map GPIO 24, 25, and 29 to the internal SPI block      
            Initialized := True;
         end if;
      end Initialize;

      procedure Set_LED (Enabled : Boolean) is
         -- 32-bit transaction tokens matching the Infineon gSPI spec
         Command_Word : Word := 16#0000_0000#; 
         Data_Payload : Word := 16#0000_0000#;
      begin
         -- Constructing the manual bitstream to address Function 1 (Backplane)
         -- Address: 16#1800501C# (CYW43439 GPIO Output Register)
         -- Set Write Mode (Bit 31) and Auto-Increment (Bit 30)
         Command_Word := 16#C400_A004#; 

         if Enabled then
            Data_Payload := 16#0000_0001#; -- Bit 0 HIGH sets WL_GPIO0 High
         else
            Data_Payload := 16#0000_0000#; -- Bit 0 LOW sets WL_GPIO0 Low
         end if;

         -- 1. Assert Chip Select: SIO_GPIO_OUT_CLR := 2**25;
         -- 2. Push Command_Word into the SPI Transmit FIFO register
         -- 3. Push Data_Payload into the SPI Transmit FIFO register
         -- 4. Spin-wait on the hardware SPI Busy flag status register
         -- 5. Deassert Chip Select: SIO_GPIO_OUT_SET := 2**25;
      end Set_LED;

   end CYW43439_Bus;

end Wireless_Driver;
