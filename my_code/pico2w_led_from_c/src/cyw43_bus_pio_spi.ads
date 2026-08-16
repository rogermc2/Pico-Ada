
with CYW43_Config_Port; use CYW43_Config_Port;
with RP2350; use RP2350;

package CYW43_Bus_PIO_SPI is

   function CYW43_Get_Pin_WL (Pin_ID : CYW43_Pin_Index) return UInt32;
   
end CYW43_Bus_PIO_SPI;