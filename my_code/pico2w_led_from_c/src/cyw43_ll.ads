
with System;

with CYW43_Internal; use CYW43_Internal;
with CYW43_Types; use CYW43_Types;
with RP2350; use RP2350;

package CYW43_LL is

   subtype  CYW43_LL_Record is CYW43_Internal_Record;

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

   function CYW43_LL_GPIO_Get (Data : in out CYW43_Internal_Record; GPIO_N : Integer;
             GPIO_EN : Boolean) return Boolean;
   procedure CYW43_LL_Init
      (CYW43_LL : in out CYW43_LL_Record; Data : CYW43_Internal_Record);
   function CYW43_LL_GPIO_Set (Data : in out CYW43_Internal_Record; GPIO_N : Integer;
                               GPIO_EN : Boolean) return Boolean;

end CYW43_LL;