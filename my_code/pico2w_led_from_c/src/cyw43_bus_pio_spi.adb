
with CYW43_LL; use CYW43_LL;
with CYW43_SPI; use CYW43_SPI;

package body CYW43_Bus_PIO_SPI is

   function Do_WLAN_Function (Self : CYW43_Internal_Record) return boolean;
   function CYW43_SPI_Transfer
    (Self : CYW43_Internal_Record; Tx: Byte; Rx : U8_Array; Tx_Length : UInt32)
     return UInt32;

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

   function CYW43_Read_Register
       (Self : CYW43_Internal_Record; Func, Reg: UInt32; Size : Positive)
        return UInt32 is
      Index : Positive :=
       Positive (CYW43_BACKPLANE_READ_PAD_LEN_BYTES / 4) + 1 + 1;
      Buff_32 : U32_Array (1 .. Index);
      Buff_8  : U8_Array (1 .. 4 * Index);
      Padding : UInt32;
      Padding_P8 : UInt32;
      Result  : UInt32 := 0;
   begin
      if Func = BACKPLANE_FUNCTION then
         Padding := CYW43_BACKPLANE_READ_PAD_LEN_BYTES;
         --  Logic_Debug_Set (pin_BACKPLANE_READ, 1)
      else
         Padding := 0;
      end if;
      Padding_P8 := Padding + 8;

      Result := CYW43_SPI_Transfer (Self, 4, Buff_8, Padding_P8);

   return Result;

   end CYW43_Read_Register;

   function CYW43_Read_Reg_U32
       (Self : CYW43_Internal_Record; Func, Reg: UInt32) return UInt32 is
   begin
      return 0;
   end CYW43_Read_Reg_U32;

   function CYW43_SPI_Transfer
    (Self : CYW43_Internal_Record; Tx: Byte; Rx : U8_Array; Tx_Length : UInt32)
     return UInt32 is
   begin
      return 0;
   end CYW43_SPI_Transfer;

   function CYW43_Write_Bytes 
      (Self   : in out CYW43_Internal_Record; Func, Size : UInt32;
       Buffer : U8_Array) return Boolean is
       Result : Boolean := False;
   begin
      case Func is
         when BUS_FUNCTION =>  null;
         when BACKPLANE_FUNCTION =>  null;
         when WLAN_FUNCTION => Result := Do_WLAN_Function (Self);
         when others => null;
      end case;

      return Result;

   end  CYW43_Write_Bytes;

   function Do_WLAN_Function (Self : CYW43_Internal_Record) return boolean is
      Max_F2_Ready_Attempts : constant Positive := 1000;
      Ready_Attempts        : Natural := 0;
      Bus_Status            : UInt32;
      Done                  : Boolean := False;
   begin
      while Not Done and then Ready_Attempts < Max_F2_Ready_Attempts loop
         Ready_Attempts := Ready_Attempts + 1;
         Bus_Status := CYW43_Read_Reg_U32 (self, BUS_FUNCTION, SPI_STATUS_REGISTER);
      end loop;
      return False;
   end Do_WLAN_Function;

end CYW43_Bus_PIO_SPI;