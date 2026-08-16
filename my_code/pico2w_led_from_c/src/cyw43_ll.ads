
with System;

with CYW43; use CYW43;
with CYW43_Internal; use CYW43_Internal;
with CYW43_Types; use CYW43_Types;
with RP2350; use RP2350;

package CYW43_LL is
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

type CYW43_LL_Record (BL : Positive) is record
      CB_Data                        : CYW43.CYW43_Record; 
      Dummy                          : UInt32 := 0;
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

   function CYW43_LL_GPIO_Get (Data : in out CYW43_Internal_Record; GPIO_N : Integer;
             GPIO_EN : Boolean) return Boolean;
   function CYW43_LL_Init (CYW43_LL : CYW43_LL_Record; Data : CYW43_Record)
                           return CYW43_Internal_Record;
   function CYW43_LL_GPIO_Set (Data : in out CYW43_Internal_Record; GPIO_N : Integer;
                               GPIO_EN : Boolean) return Boolean;

end CYW43_LL;