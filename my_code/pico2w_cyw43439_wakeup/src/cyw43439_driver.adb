
with Ada.Real_Time; use Ada.Real_Time;

with RP2350.PADS_BANK0;
with RP2350.IO_BANK0;
with RP2350.SIO; use RP2350.SIO;
with RP2350.SPI0;
with Utilities;

package body CYW43439_Driver is

   procedure Build_SPI_Frame (Header : GSPI_Header;  Payload : Unsigned_8;
                              Buffer  : out U8_Array)  is
      Command_Word : Unsigned_32 := 0;
      
      Func_Val : constant Unsigned_32 := 
        (case Header.Func is 
           when Function_0_Bus       => 0, 
           when Function_1_Backplane => 1, 
           when Function_2_WLAN      => 2);
   begin
      -- 1. Position the bits exactly where the CYW43439 wants them
      if Header.Write_Access then
         Command_Word := Command_Word or Shift_Left (1, 31);
      end if;

      if Header.Auto_Inc then
         Command_Word := Command_Word or Shift_Left (1, 30);
      end if;

      Command_Word := Command_Word or Shift_Left (Func_Val and 16#03#, 28);
      Command_Word := Command_Word or Shift_Left (Header.Address and 16#7FFF#, 13);
      Command_Word := Command_Word or (Header.Length and 16#07FF#);

      -- 2. Extract into a Big-Endian array sequence.
      -- This ensures that the upper-most bits are transmitted on the wire first.
      Buffer (1) := Unsigned_8 (Shift_Right (Command_Word, 24) and 16#FF#); -- Sent 1st
      Buffer (2) := Unsigned_8 (Shift_Right (Command_Word, 16) and 16#FF#); -- Sent 2nd
      Buffer (3) := Unsigned_8 (Shift_Right (Command_Word, 8)  and 16#FF#); -- Sent 3rd
      Buffer (4) := Unsigned_8 (Command_Word and 16#FF#);                  -- Sent 4th
      
      -- 3. Append the data payload byte
      Buffer (5) := Payload;                                                -- Sent 5th
   end Build_SPI_Frame;

   procedure Initialize_SPI0_Master (Baudrate_Clock_Div : Interfaces.Unsigned_32) is
   use RP2350.SPI0;
   begin
      -- 1. Disable the SPI block to safely change configuration parameters
      SPI0_Periph.SSPCR1.SSE := 0;

      -- 2. Configure Control Register 0 (SSPCR0)
      -- DSS = 16#7# -> 8-bit data size
      -- FRF = 0     -> Motorola SPI Format
      -- SPO = 0     -> CPOL = 0 (Clock idles low)
      -- SPH = 0     -> CPHA = 0 (Data captured on first edge)
      -- SCR = 0     -> Serial clock rate multiplier
      SPI0_Periph.SSPCR0.DSS := 7;

      -- 3. Set the Clock Prescaler (SSPCPSR)
      -- Must be an even number between 2 and 254
      SPI0_Periph.SSPCPSR.CPSDVSR := SSPCPSR_CPSDVSR_Field (Baudrate_Clock_Div and 16#FE#);

      -- 4. Enable Master Mode and Power on the SPI Block
      -- MS  = 0 -> Master Mode  which is default.
      -- SSE = 1 -> Peripheral Enabled
      SPI0_Periph.SSPCR1.SSE := 1;
      
   end Initialize_SPI0_Master;

   procedure Initialize_WLAN_Power is
   use RP2350.PADS_BANK0;
   use RP2350.IO_BANK0;
   use RP2350.SPI0;
      -- Match the specific WL_REG_ON pin assigned on the Pico 2 W schematic
      WL_REG_ON_Pin : constant Natural := 24; 
   begin
      -- 1. Enable output drive capability on the Pad
      PADS_BANK0_Periph.GPIO24.IE := 1;
      PADS_BANK0_Periph.GPIO24.PDE := 0;
      --  RP.PADS.PADS_BANK_Peripheral.GPIO (WL_REG_ON_Pin) := 
      --   (OD  => 0,  -- Disable Open Drain
      --     IE  => 1,   -- Enable Input buffer
      --     DRV => RP.PADS.Drive_4mA,
      --     PUE => 0,  -- No Pull-up
      --     PDE => 0); -- No Pull-down

      -- 2. Select SIO (Software IO) function for this GPIO pin
      IO_BANK0_Periph.GPIO24_CTRL.FUNCSEL := siob_proc_24;
      --  RP.SIO.GPIO_CTRL_Peripheral (WL_REG_ON_Pin).FUNCSEL := RP.SIO.SIO_Func;

      -- 3. Enable output in SIO and drive the line High
      SIO_Periph.GPIO_OE_SET := Mask_REG_ON;
      SIO_Periph.GPIO_OUT_SET := Mask_REG_ON;
   
   end Initialize_WLAN_Power;

   procedure Perform_WLAN_Wakeup is
      --  SBSDIO_FUNC1_CHIPCLKCSR address = 0x1000E
      CHIPCLKCSR   : constant Unsigned_32 := 16#1000E#;
      Wake_Command : constant CYW43439_Driver.GSPI_Header := 
      (Write_Access => True,
         Auto_Inc     => True,
         Func         => CYW43439_Driver.Function_1_Backplane,
         Address      => CHIPCLKCSR,
         Length       => 1);
      TX_Frame     : U8_Array (1 .. 5);    
   begin
      -- 1. Energize the CYW43439 using your SIO pin initialization code
      Initialize_WLAN_Power; 
      
      -- 2. MANDATORY: Wait 50 milliseconds for the PMU internals to bootstrap
      Utilities.Wait (Milliseconds (50)); 

      -- 3. Configure physical SPI0 peripheral clocks
      Initialize_SPI0_Master (Baudrate_Clock_Div => 12); -- Choose divider for your core clock

      -- 4. Calculate your Endian-Safe Wire Frame Buffer
      CYW43439_Driver.Build_SPI_Frame (Wake_Command, Payload => 1, Buffer => TX_Frame);

      -- 5. Push data packets straight down the physical wire
      SPI0_Transmit_Buffer (TX_Frame);

   end Perform_WLAN_Wakeup;

   procedure SPI0_Transmit_Buffer (Buffer : U8_Array) is
      use RP2350;
      use RP2350.SPI0;
      Dummy_Read : Unsigned_32;
   begin
      for I in Buffer'Range loop       
         -- 1. Wait until Transmit FIFO has space (TNF = Transmit FIFO Not Full)
         while SPI0_Periph.SSPSR.TNF = 0 loop
            null; -- Polling busy wait loop
         end loop;

         -- 2. Push byte onto the SPI line
         SPI0_Periph.SSPDR.DATA := SSPDR_DATA_Field (Buffer (I));

         -- 3. Wait for the transaction to clear and fill the RX FIFO 
         -- (RNE = Receive FIFO Not Empty)
         while SPI0_Periph.SSPSR.RNE = 0 loop
            null; -- Polling busy wait loop
         end loop;

         -- 4. Flush the receiving byte register to prevent FIFO lock up
         Dummy_Read := Unsigned_32 (SPI0_Periph.SSPDR.DATA);
      end loop;

      -- 5. Final Hardware Interlock: Wait for the SPI bus to go idle
      -- (BSY = Busy signal from physical line)
      while SPI0_Periph.SSPSR.BSY = 1 loop
         null;
      end loop;
      
   end SPI0_Transmit_Buffer;

end CYW43439_Driver;
