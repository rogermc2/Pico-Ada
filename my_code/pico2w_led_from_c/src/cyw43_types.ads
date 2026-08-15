
with System;

with Interfaces; use Interfaces;

with Ada.Unchecked_Conversion;

with RP2350; use RP2350;

package CYW43_Types is

   type U8_Array is array (Positive range <>) of Byte;
   type U32_Array is array (Positive range <>) of UInt32;

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

   --  cyw43_ll_t
   --  type CYW43_LL_Record (BL : Positive) is record
   --     Driver_Status         : UInt32 := 0;
   --     CB_Data               : U8_Array (1 ..BL);
   --     Cur_Backplane_Window  : Integer := 0;
      --  Wwd_sdpcm_packet_transmit_sequence_number = 0;
      --  Wwd_sdpcm_last_bus_data_credit = 1; // we get an immediate stall if this isn't done?
      --  Wlan_flow_control = 0;
      --  Wwd_sdpcm_requested_ioctl_id = 0;
   --     Bus_is_up             : Boolean := false;
   --     Had_successful_packet : Boolean := false;
   --     Bus_data              : UInt32 := 0;
   --     Protocol_State        : Natural;
   --  end record;

   type CYW43_LL_Record (BL : Positive) is record
      CB_Data                        : U8_Array (1 .. BL);
      Startup_T0                     : UInt32 := 0;
      Cur_Backplane_Window           : UInt32 := 0;
      Wwd_SDPCM_Packet_Transmit_Sequence_Number : Byte := 0;
      Wwd_SDPCM_Last_Bus_Data_Credit : Byte := 0;
      Wlan_Flow_Control              : Byte := 0;
      Wwd_SDPCM_Requested_Ioctl_id   : UInt16 := 0;
      Bus_Is_Up                      : Boolean := false;
      Had_Successful_Packet          : Boolean := false;
      Bus_Data                       : Unsigned_8 := 0;
   end record;

   -- cyw43_int_t
   type CYW43_Internal (BL : Positive) is record
      CB_Data                        : U8_Array (1 .. BL);
      Startup_T0                     : UInt32 := 0;
      Cur_Backplane_Window           : UInt32 := 0;
      Wwd_SDPCM_Packet_Transmit_Sequence_Number : Byte := 0;
      Wwd_SDPCM_Last_Bus_Data_Credit : Byte := 0;
      Wlan_Flow_Control              : Byte := 0;
      Wwd_SDPCM_Requested_Ioctl_id   : UInt16 := 0;
      Bus_Is_Up                      : Boolean := false;
      Had_Successful_Packet          : Boolean := false;
      Bus_Data                       : Unsigned_8 := 0;
      SPID_Buffer                    : U8_Array (1 .. BL);
      Last_SSID_Joined               : U8_Array (1 .. 36);
   end record;

end CYW43_Types;
