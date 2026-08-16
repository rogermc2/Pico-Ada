
with System;

with Interfaces; use Interfaces;

with RP2350; use RP2350;
--  Maximum block size for transfers on the bus:
--  #if CYW43_USE_SPI
--  #define CYW43_BUS_MAX_BLOCK_SIZE 64
--  #define CYW43_BACKPLANE_READ_PAD_LEN_BYTES 16
--  #define CYW43_LL_STATE_SIZE_WORDS (526 + 1 + ((CYW43_BACKPLANE_READ_PAD_LEN_BYTES / 4) + 1) + CYW43_INCLUDE_LEGACY_F1_OVERFLOW_WORKAROUND_VARIABLES * 4)
--  #else // SDIO
--  #define CYW43_BUS_MAX_BLOCK_SIZE 16384
--  #define CYW43_BACKPLANE_READ_PAD_LEN_BYTES 0
--  #define CYW43_LL_STATE_SIZE_WORDS (526 + 1)
--  #endif

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

--  static_assert (sizeof(cyw43_int_t) == sizeof (cyw43_ll_t), "");

   

end CYW43_Types;
