
with System;

with Interfaces; use Interfaces;

with Ada.Unchecked_Conversion;

with RP2350; use RP2350;

package CYW43_Types is

   type U8_Array is array (Positive range <>) of Byte;
   type U32_Array is array (Positive range <>) of UInt32;

   CYW43_PIN_WL_REG_ON  : constant UInt32 := 16#0080_0000#;  --  pin 23;

   -- Representing cyw43_ll_t
   type CYW43_LL_Record (BL : Positive) is record
      Driver_Status  : UInt32 := 0;
      --  Buffer_Pointer : System.Address := System.Null_Address;
      CB_Data               : U8_Array (1 ..BL);
      Cur_Backplane_Window  : Integer := 0;
      --  Wwd_sdpcm_packet_transmit_sequence_number = 0;
      --  Wwd_sdpcm_last_bus_data_credit = 1; // we get an immediate stall if this isn't done?
      --  Wlan_flow_control = 0;
      --  Wwd_sdpcm_requested_ioctl_id = 0;
      Bus_is_up             : Boolean := false;
      Had_successful_packet : Boolean := false;
      Bus_data              : UInt32 := 0;
      Protocol_State        : Natural;
   end record;
   --    with Convention => C;

   -- Representing cyw43_int_t
   type CYW43_Internal (BL : Positive) is record
      CYW43_LL    : CYW43_LL_Record (BL);
      ITF_State   : Byte := 0;
      Startup_T0  : UInt32;
      Last_Header : U32_Array (1 .. 2);
      Bus_Is_Up   : Boolean := False;
      SPI_Buffer  : U8_Array (1 .. BL);
      AP_Channel  : Integer := 0;
      Initted     : Boolean := False;
      -- Ensure component sizes match C types precisely
      Driver_Locked : Boolean;
   end record;
   --    with Convention => C;

   -- Define explicit safe access types (pointers)
   type CYW43_Internal_Ptr is access all CYW43_Internal;
   --    with Convention => C;
   type CYW43_LL_Ptr is access all CYW43_LL_Record;
   --    with Convention => C;

   -- Modern Ada expression function mimicking the C #define macro
   function CYW43_Int_From_LL (LL : CYW43_LL_Ptr) return CYW43_Internal_Ptr;

private

   -- Instantiate the underlying type cast operation safely
   function Cast_Address is new Ada.Unchecked_Conversion 
     (Source => System.Address, Target => CYW43_Internal_Ptr);

end CYW43_Types;
