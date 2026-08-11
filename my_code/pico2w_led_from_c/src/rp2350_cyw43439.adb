
with System;

with Interfaces;

with RP2350; use RP2350;
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0;
with RP2350.SIO;

with CYW43_Driver; use CYW43_Driver;

package body RP2350_CYW43439 is

   type SPI_Command is record
      Write_Mode   : Boolean;  -- True = Write, False = Read
      Auto_Inc     : Boolean;  -- True = Increment address automatically
      Function_Num : uint2;    -- 0: Bus/gSPI, 1: Backplane, 2: WLAN Data
      Address      : uint15;   -- Register address or buffer offset
      Data_Length  : uint13;   -- Number of bytes to transfer
   end record;
   pragma Pack (SPI_Command);

   type SPI_Response is record
      Data_Not_Ready : Boolean;  -- True if the chip needs more time (retry required)
      Cmd_Error      : Boolean;  -- True if the previous command was invalid
      WLAN_Interrupt : Boolean;  -- True if WLAN data is pending
      Reserved       : uint15;   -- Hardware reserved bits
      Bus_Status     : uint24;   -- Internal status flags (e.g., credit availability)
   end record;
   pragma Pack (SPI_Response);

   -- Bitmasks
   Mask_REG_ON     : constant uint32 := 16#0080_0000#;  --  pin 23
   Mask_DATA       : constant uint32 := 16#0100_0000#;  --  pin 24
   Mask_CS         : constant uint32 := 16#0200_0000#;  --  pin 25
   Mask_CLK        : constant uint32 := 16#2000_0000#;  --  pin 29
   All_Pins_Mask   : constant uint32 := 16#2380_0000#;
   
  function CYW43_Arch_Init return Boolean is
      Result : Boolean := false;
  begin
   --   async_context_t *context = cyws43_arch_async_context();
   --   if (!context) {
   --       context = cyw43_arch_init_default_async_context();
   --       if (!context) return PICO_ERROR_GENERIC;
   --       cyw43_arch_set_async_context(context);
   --   }
      Result := cyw43_driver_init;  --   (context);
      --  #if CYW43_LWIP
      --     ok &= lwip_nosys_init(context);
      --  #endif
      if not Result then
         null;
         --  cyw43_arch_deinit();
         --  return PICO_ERROR_GENERIC;
      end if;
      return Result;
   end CYW43_Arch_Init;

  function Pico_Led_Init return Boolean is
   begin
   return CYW43_Arch_Init;
      --  return CYW43439_Init;
   end Pico_Led_Init;

   procedure Wait (Duration : Time_Span) is
      Wait_Time : constant Time := Clock + Duration;
   begin
      delay until Wait_Time;

   end Wait;

end RP2350_CYW43439;
