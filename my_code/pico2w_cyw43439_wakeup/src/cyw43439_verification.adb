
with Ada.Real_Time;
with Interfaces; use Interfaces;

with RP2350; use RP2350;
with RP2350.SIO; use RP2350.SIO;
with RP2350.SPI0; use RP2350.SPI0;

with cyw43439_driver; use cyw43439_driver;
with RP2350_CYW43439; use RP2350_CYW43439;

package body CYW43439_Verification is

procedure Boot_And_Verify_WLAN is
   Is_Alive : Boolean := False;
   Attempts : Natural := 0;
begin
   -- Trigger power line and send the wake bit (0x1000E => 0x01)
   Perform_WLAN_Wakeup;

   -- Poll the test register until it responds with the correct signature
   while not Is_Alive and Attempts < 100 loop
      Is_Alive := Verify_Chip_Communication;
      if not Is_Alive then
         Wait (Ada.Real_Time.Milliseconds (2));
         Attempts := Attempts + 1;
      end if;
   end loop;

   --  if Is_Alive then
   --     -- SPI Bus is synced and big/little endian translations are working perfectly!
   --     Print_Line ("CYW43439 Wakeup Verification: SUCCESS.");
   --  else
   --     Print_Line ("CYW43439 Wakeup Verification: FAILED. Check wiring or SPI clock phase.");
   --  end if;

end Boot_And_Verify_WLAN;

   --  Low-level SPI transceiver helper that sends a byte and reads the response
   function SPI0_Transfer_Byte (Value : Unsigned_8) return Unsigned_8 is
   begin
      -- Wait for room in TX FIFO
      while SPI0_Periph.SSPSR.TNF = 0 loop
         null;
      end loop;
    
      -- Send byte
      SPI0_Periph.SSPDR.DATA := SSPDR_DATA_Field (Value);
   
      -- Wait for response in RX FIFO
      while SPI0_Periph.SSPSR.RNE = 0 loop
       null;
      end loop;
      
      -- Return captured byte
      return Unsigned_8 (SPI0_Periph.SSPDR.DATA);

   end SPI0_Transfer_Byte;


   function Verify_Chip_Communication return Boolean is
      Header             : GSPI_Header;
      Cmd_Buffer         : U8_Array (1 .. 4);
      Response_32        : Unsigned_32 := 0;  --  4 bytes    
      --  Target: Function 0 (Bus), Address 16#14# (Often houses the Test/Signature register)
      TEST_REGISTER_ADDR : constant Unsigned_32 := 16#14#;  
      --  The expected value the chip returns when fully initialized
      EXPECTED_SIGNATURE : constant Unsigned_32 := 16#FEEDBEAD#;    
      Dummy_In           : Unsigned_8;
   begin
      -- 1. Configure a READ header targeting Function 0
      Header := (Write_Access => False, -- FALSE means Read
                 Auto_Inc     => True,
                 Func         => Function_0_Bus,
                 Address      => TEST_REGISTER_ADDR,
                 Length       => 4); -- Reading a 32-bit word (4 bytes)

      -- 2. Build the 4-byte header using our endian-safe serializer
      -- (Passing 0 as payload since we are reading)
      declare
         Full_Buffer : U8_Array (1 .. 5);
      begin
         Build_SPI_Frame (Header, Payload => 0, Buffer => Full_Buffer);
         Cmd_Buffer := Full_Buffer (1 .. 4); -- Extract just the 4 header bytes
      end;

      -- 3. CHIP SELECT LOW: Start SPI Transaction
      SIO_Periph.GPIO_OUT_CLR := Mask_CS;
      --  Set_CS_Pin (Low => True);

      -- 4. Transmit the 4-byte read command header (and discard immediate RX garbage)
      for I in Cmd_Buffer'Range loop
         Dummy_In := SPI0_Transfer_Byte (Cmd_Buffer (I));
      end loop;

      -- 5. MANDATORY TURNAROUND: Send 1 Dummy Byte to give the CYW43439 time to fetch data
      -- (Some configurations require up to 4 dummy bytes if reading the backplane)
      Dummy_In := SPI0_Transfer_Byte (16#00#);

      -- 6. READ RESPONSE: Send 4 padding bytes to clock out the 32-bit register data
      -- The chip returns data MSB-first across the bytes.
      Response_32 := Response_32 or Shift_Left (Unsigned_32 (SPI0_Transfer_Byte (16#00#)), 24);
      Response_32 := Response_32 or Shift_Left (Unsigned_32 (SPI0_Transfer_Byte (16#00#)), 16);
      Response_32 := Response_32 or Shift_Left (Unsigned_32 (SPI0_Transfer_Byte (16#00#)), 8);
      Response_32 := Response_32 or Unsigned_32 (SPI0_Transfer_Byte (16#00#));

      -- 7. CHIP SELECT HIGH: End SPI Transaction
      while SPI0_Periph.SSPSR.BSY = 1 loop
          null; 
      end loop; -- Wait for idle
      SIO_Periph.GPIO_OUT_SET := Mask_CS;
      --  Set_CS_Pin (Low => False);

      -- 8. Evaluate against the hardware target
      return Response_32 = EXPECTED_SIGNATURE;

   end Verify_Chip_Communication;

end CYW43439_Verification;
