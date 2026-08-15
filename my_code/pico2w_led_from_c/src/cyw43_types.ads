
with RP2350; use RP2350;

package CYW43_Types is

   type U8_Array is array (Positive range <>) of Byte;
   type U32_Array is array (Positive range <>) of UInt32;

   type CYW43_LL_Record (BL : Positive) is record
      Driver_Status  : UInt32 := 0;
      --  Buffer_Pointer : System.Address := System.Null_Address;
      B_data : U32_Array (1 ..BL);
      --  Cur_backplane_window = 0;
      --  Wwd_sdpcm_packet_transmit_sequence_number = 0;
      --  Wwd_sdpcm_last_bus_data_credit = 1; // we get an immediate stall if this isn't done?
      --  Wlan_flow_control = 0;
      --  Wwd_sdpcm_requested_ioctl_id = 0;
      Bus_is_up             : Boolean := false;
      Had_successful_packet : Boolean := false;
      Bus_data              : UInt32 := 0;
   end record;

   type CYW43_Record (BL : Positive) is record
      CYW43_LL    : CYW43_LL_Record (BL);
      Startup_T0  : UInt32;
      Last_Header : U32_Array (1 .. 2);
      Bus_Is_Up   : Boolean := False;
      SPI_Buffer  : U8_Array (1 .. BL);
   end record;

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

end CYW43_Types;