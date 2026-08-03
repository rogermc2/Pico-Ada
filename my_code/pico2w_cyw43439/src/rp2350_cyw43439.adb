
with System;

with Interfaces;

with RP2350; use RP2350;
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0;
with RP2350.SIO;

with CYW43439_IO; use CYW43439_IO;
with Utilities; use Utilities;

package body RP2350_CYW43439 is

   --  The CYW43439 WL_REG_ON signal is used by the PMU to power-up the WLAN section.
   --  It is OR-gated with the BT_REG_ON input to control the internal CYW43439 regulators.
   --  When WL_REG_ON is high the regulators are enabled and the WLAN section is out of reset.
   --  When WL_REG_ON is low the WLAN section is in reset.
   --  WL_REG_ON has an internal 200 k pull-down resistor that is enabled by default.
   --  It can be disabled through programming.
   -- Bitmasks
   Mask_REG_ON   : constant uint32 := 16#0080_0000#;
   Mask_DATA     : constant uint32 := 16#0100_0000#;
   Mask_CS       : constant uint32 := 16#0200_0000#;  
   Mask_CLK      : constant uint32 := 16#2000_0000#;
   All_Pins_Mask : constant uint32 := 16#23800000#;

   function Check_Chip_Communication return Unsigned_32 is  
      use RP2350.SIO;
      --  gSPI Test-Read only register: Bits 16#0014# .. 16#0017# (4 bits)
      --  Shift_Left(16#0014#, 11) = 16#A000#
      Read_FEEDBEAD : constant Unsigned_32 := Shift_Left(16#0014#, 11) or 4;
      Result        : Unsigned_32 := 0;
   begin
      -- Send Read Request
      Write_gSPI_Word32 (Read_FEEDBEAD);
      -- Enforce turnaround delay for hardware line direction swap
      Wait (Milliseconds (5));
      Result := Read_gSPI_Word32;

      return Result;

   end Check_Chip_Communication;

   procedure Configure_Pins is
      use RP2350;
      use RP2350.IO_BANK0;
      use RP2350.SIO;
   begin
      -- Route pins to SIO function (Function 5 on RP2350)
      IO_BANK0_Periph.GPIO23_CTRL.FUNCSEL := IO_BANK0.siob_proc_23;
      IO_BANK0_Periph.GPIO24_CTRL.FUNCSEL := IO_BANK0.siob_proc_24;
      IO_BANK0_Periph.GPIO25_CTRL.FUNCSEL := IO_BANK0.siob_proc_25;
      IO_BANK0_Periph.GPIO29_CTRL.FUNCSEL := IO_BANK0.siob_proc_29;

      --  Configure GPIO24 for Input Enable (IE) using SVD PADS types
      --  Bit 6 = IE, Bit 3 = PUE (Pull-Up), Bits 4-5 = Drive Strength (12mA)
   
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.IE := 1;    --  Input enable
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.PUE := 1;   --  Pull up enable
      PADS_BANK0.PADS_BANK0_Periph.GPIO24.DRIVE := PADS_BANK0.Val_12mA;

      PADS_BANK0.PADS_BANK0_Periph.GPIO25.DRIVE := PADS_BANK0.Val_12mA;
      PADS_BANK0.PADS_BANK0_Periph.GPIO29.DRIVE := PADS_BANK0.Val_12mA;

   end Configure_Pins;

   procedure Reset_CYW is
         use RP2350.SIO;
   begin
      --  To initiate communication through the  CYW43439 gSPI after power-up, 
      --  the host must bring up the WLAN chip by writing to the
      --  wake-up WLAN register bit. 
      --  Writing a 1 to this bit will start up the necessary crystals and PLLs
      --  so that the CYW43439 is ready for data transfer.
      --  Configure SIO_Periph default output directions and isolate bus with CS high
      SIO_Periph.GPIO_OE_SET :=  All_Pins_Mask;    --  0x23800000

      --  Assert Hard Reset: Drive WL_REG_ON Low via SIO Core Registers
      SIO_Periph.GPIO_OUT_CLR := All_Pins_Mask;
      Wait (Milliseconds (20));
      --  Release Reset: Drive WL_REG_ON High
      SIO_Periph.GPIO_OUT_SET := Mask_REG_ON;  --  16#0080_0000#;
      Wait (Milliseconds (50));  --  Give the internal PLL time to lock
      SIO_Periph.GPIO_OUT_SET := Mask_CS;

   end Reset_CYW;

   procedure Initialize_gSPI is
      use RP2350;
      use RP2350.SIO;
      --  Configure_Pins;
      --  Power up by setting REG_ON
      --  Wait 50 Milliseconds
      --  Reset_CYW:
      --  Wake with a read command to F0 address 0x14. 
      --  Read F0: 10000000
      --  Address 0x14: 00012000
      --  Address 0x14 contains a predefined bit pattern: 0xFEEDBEAD
      --  Shift 0x14 Left 11 bits over the Packet length field
      --  into the address field
      --  Shift_Left (16#00A2#, 11) = 16#0005_1000#
      --  16#00A2# = 10100010 = 162
      --  shift 11: 101 0001 0000 0000 0000 = 51000
      --  Shift_Left (16#0014#, 11) = 16#A000#
      --  Wake_Command packet length : 1 byte ?
      Wake_Command : constant Unsigned_32 :=
       16#8000_0000# or Shift_Left (16#00A2#, 11) or 1;
      Response     : Unsigned_32;
   begin
      Configure_Pins;
      Write_gSPI_Word32 (Wake_Command);
      Write_gSPI_Byte (1); -- 0x01 requests wake up
      Wait (Milliseconds (50));
      Response := Read_gSPI_Word32;
      Reset_CYW;

   end Initialize_gSPI;

   --  subtype Buffer_4x8 is Buffer_8 (1 .. 4);

   --  procedure Pack_Command_To_Buffer (Command : SPI_Command;
   --     Buffer : out Buffer_4x8) is
   --     Raw_32 : Unsigned_32 := 0; 
   --     Func_Val : constant Unsigned_32 := Unsigned_32 (Command.Function_Num);
   --     --    (case Command.Function_Num is
   --     --       when Function_0_Bus => 0, 
   --     --       when Function_1_Backplane => 1, 
   --     --       when Function_2_WLAN => 2);
   --  begin
   --     -- Explicitly build up the 32-bit big-endian expected frame layout
   --     if Command.Write_Mode then
   --        Raw_32 := Raw_32 or Shift_Left (1, 31);
   --     end if;

   --     if Command.Auto_Inc then
   --        Raw_32 := Raw_32 or Shift_Left (1, 30);
   --     end if;

   --     Raw_32 := Raw_32 or Shift_Left (Func_Val and 16#03#, 28);
   --     Raw_32 := Raw_32 or Shift_Left (Unsigned_32 (Command.Address) and 16#7FFF#, 13);
   --     Raw_32 := Raw_32 or (Unsigned_32 (Command.Data_Length) and 16#07FF#);

   --     -- Slice out into individual sequential bytes (Big-Endian Wire Layout)
   --     Buffer (1) := Unsigned_8 (Shift_Right (Raw_32, 24) and 16#FF#); -- Transmitted 1st
   --     Buffer (2) := Unsigned_8 (Shift_Right (Raw_32, 16) and 16#FF#); -- Transmitted 2nd
   --     Buffer (3) := Unsigned_8 (Shift_Right (Raw_32, 8)  and 16#FF#); -- Transmitted 3rd
   --     Buffer (4) := Unsigned_8 (Raw_32 and 16#FF#);                  -- Transmitted 4th
   --  end Pack_Command_To_Buffer;

--  The CHIPCLKCSR register resides at Backplane Address 0x1000E.
--  To request an active system clock and wake the system,
--  bit 0 (SBSDIO_FORCE_WL_CLK / SBSDIO_ALP_AVAIL_REQ) must be written as 1
--  procedure Wakeup_WLAN is
--     Command      : SPI_Command;
--     Wake_Payload : Unsigned_8 := 1; -- Force Clock Active (Bit 0)
--     Raw_Buffer : Buffer_8 (1 .. 5); 
--     --  SBSDIO_FUNC1_CHIPCLKCSR address = 0x1000E
--     CHIPCLKCSR   : constant UInt15 := 16#1000E#;
--  begin
--     -- Construct the gSPI raw packet configuration
--     Command := (Write_Mode => True, Auto_Inc => True, function_Num => 1,
--                Address => CHIPCLKCSR, Data_Length  => 1);  -- 1 Byte payload

--     -- Pack the strongly typed record into a serializable byte stream 
--     -- (Assuming Big-Endian serialization required by the device architecture)
--     Pack_Command_To_Buffer (Command, Raw_Buffer (1 .. 4));
--     Raw_Buffer (5) := Wake_Payload;

--     -- Transmit over the baremetal configuration SPI block
--     --  RP.SPI.Transmit(Peripheral => RP.SPI.SPI_0, Data => Raw_Buffer);
   
--  end Wakeup_WLAN;

end RP2350_CYW43439;
