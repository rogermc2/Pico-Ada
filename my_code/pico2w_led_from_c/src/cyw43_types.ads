
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
pragma Preelaborate;

   type U8_Array is array (Positive range <>) of Byte;
   type U32_Array is array (Positive range <>) of UInt32;

   CYW43_WL_GPIO_LED_PIN : constant Natural := 0;

   SPI_Buffer_Size : constant Positive := 512;

end CYW43_Types;
