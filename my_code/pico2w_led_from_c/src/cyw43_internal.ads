
with RP2350; use RP2350;

package CYW43_Internal is

-- cyw43_int_t
   type CYW43_Internal_Record (BL : Positive) is record
      CB_Data                        : U8_Array (1 .. BL);
      Startup_T0                     : UInt32 := 0;
      Cur_Backplane_Window           : UInt32 := 0;
      Wwd_SDPCM_Packet_Transmit_Sequence_Number : Byte := 0;
      Wwd_SDPCM_Last_Bus_Data_Credit : Byte := 0;
      Wlan_Flow_Control              : Byte := 0;
      Wwd_SDPCM_Requested_Ioctl_ID   : UInt16 := 0;
      Bus_Is_Up                      : Boolean := false;
      Had_Successful_Packet          : Boolean := false;
      --  #if CYW43_BACKPLANE_READ_PAD_LEN_BYTES > 0
      --  uint32_t spi_header[(CYW43_BACKPLANE_READ_PAD_LEN_BYTES / 4) + 1] __attribute__((aligned(4))); // Must be before spid_buf
      --  #endif
      SPID_Buffer                    : U8_Array (1 .. BL);
      Last_SSID_Joined               : U8_Array (1 .. 36);
      Bus_Data                       : Byte := 0;
   end record;

end CYW43_Internal;