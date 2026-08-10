
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350_CYW43439; use RP2350_CYW43439;

procedure Setup is
   Wake_Command   : constant GSPI_Header :=
    (Write_Access => True, Auto_Inc  => True, Func  => Function_1_Backplane,
      Address      => Chip_Click_CSR, Length => 1);
   TX_Buffer    : U8_Array (1 .. 5);
   Test_Val     : Unsigned_32;
begin
   Initialize_gSPI;
   Build_SPI_Frame (Wake_Command, Payload => 1, Buffer => TX_Buffer);
   SPI0_Transmit_Buffer (TX_Buffer);

   --  Test_Val := Check_Chip_Communication; 

   loop
      null;
   end loop;
   
end Setup;
