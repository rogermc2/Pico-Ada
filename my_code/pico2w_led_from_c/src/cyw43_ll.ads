
with System;

with CYW43_Types; use CYW43_Types;
with RP2350; use RP2350;

package CYW43_LL is

   --  type LL_State_Type is private;

   --  For SPI
   CYW43_BUS_MAX_BLOCK_SIZE           : constant Positive := 64;
   CYW43_BACKPLANE_READ_PAD_LEN_BYTES : constant Positive := 16;
   CYW43_LL_STATE_SIZE_WORDS          : constant Positive :=
     526 + 1 + (CYW43_BACKPLANE_READ_PAD_LEN_BYTES / 4 + 1);
      --  + CYW43_INCLUDE_LEGACY_F1_OVERFLOW_WORKAROUND_VARIABLES * 4)
--  #else SDIO
--  #define CYW43_BUS_MAX_BLOCK_SIZE 16384
--  #define CYW43_BACKPLANE_READ_PAD_LEN_BYTES 0
--  #define CYW43_LL_STATE_SIZE_WORDS (526 + 1)
--  #endif

   function CYW43_LL_GPIO_Get (Data : in out CYW43_Record; GPIO_N : Integer; GPIO_EN : Boolean) return Boolean;
   procedure CYW43_LL_Init  (CYW43_LL : CYW43_LL_Record; Data : in out CYW43_Record);
   function CYW43_LL_GPIO_Set (Data : in out CYW43_Record; GPIO_N : Integer; GPIO_EN : Boolean) return Boolean;
private
   --  type Internal_State_Record is record
   --     Driver_Status  : UInt32 := 0;
   --     --  Buffer_Pointer : System.Address := System.Null_Address;
   --     B_data : Cyw43_Record;
   --     --  Cur_backplane_window = 0;
   --     --  Wwd_sdpcm_packet_transmit_sequence_number = 0;
   --     --  Wwd_sdpcm_last_bus_data_credit = 1; // we get an immediate stall if this isn't done?
   --     --  Wlan_flow_control = 0;
   --     --  Wwd_sdpcm_requested_ioctl_id = 0;
   --     Bus_is_up             : Boolean := false;
   --     Had_successful_packet : Boolean := false;
   --     Bus_data              : UInt32 := 0;
   --  end record;

   --  Force Ada to map the private type to the precise hardware structure
   --  type LL_State_Type is new Internal_State_Record;

end CYW43_LL;