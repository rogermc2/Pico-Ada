
with CYW43_Config_Port; use CYW43_Config_Port;
with CYW43_Internal; use CYW43_Internal;
with CYW43_Types; use CYW43_Types;
with RP2350; use RP2350;

package CYW43_Bus_PIO_SPI is

   function CYW43_Get_Pin_WL (Pin_ID : CYW43_Pin_Index) return UInt32;function CYW43_Write_Bytes 
      (Self   : in out CYW43_Internal_Record; CONTROL_HEADER, Size : UInt32;
       Buffer : U8_Array) return Boolean;
   
end CYW43_Bus_PIO_SPI;