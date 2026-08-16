
package body CYW43_Bus_PIO_SPI is

   function CYW43_Get_Pin_WL (Pin_ID : CYW43_Pin_Index) return UInt32 is
      Pin : UInt32;
   begin
      case Pin_ID is
         when PIN_INDEX_WL_REG_ON    => Pin := 16#0080_0000#;  --  pin 23
         when PIN_INDEX_WL_DATA_OUT  => Pin := 16#0100_0000#;  --  pin 24
         when PIN_INDEX_WL_DATA_IN   => Pin := 16#0100_0000#;  --  pin 24
         when PIN_INDEX_WL_HOST_WAKE => Pin := 16#0100_0000#;  --  pin 24
         when PIN_INDEX_WL_CLOCK     => Pin := 16#2000_0000#;  --  pin 29
         when PIN_INDEX_WL_CS        => Pin := 16#0200_0000#;  --  pin 25
         when Pin_Index_Wl_Count     => Pin := 6;
      end case;

      return Pin;

   end CYW43_Get_Pin_WL;
   
end CYW43_Bus_PIO_SPI;