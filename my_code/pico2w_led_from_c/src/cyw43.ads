
with RP2350; use RP2350;
with CYW43_Types; use CYW43_Types;
--  with CYW43_LL; use CYW43_LL;

package CYW43 is

   type CYW43_Record is record
      --  LL                  : CYW43_LL_Record;
      ITF_State           : Byte := 0;
      Trace_Flags         : UInt32 := 0;
      -- State for async events
      Wifi_Scan_State     : UInt32 := 0;  --  Volatile
      Wifi_Join_State     : UInt32 := 0;
      --   void *wifi_scan_env;
      --   int (*wifi_scan_cb)(void *, const cyw43_ev_scan_result_t *);
      Initted             : Boolean := False;
      --  Pending things to do
      Pend_Disassoc   : Boolean := False;
      Pend_Rejoin     : Boolean := False;
      Pend_Rejoin_wpa : Boolean := False;

      --   AP settings
      AP_auth         : UInt32 := 0;
      AP_channel      : Byte := 0;
      AP_ssid_len     : Byte := 0;
      AP_key_len      : Byte := 0;
      AP_ssid         : U8_Array (1 .. 32);
      AP_key          : U8_Array (1 .. 64);
   end record;

   CYW43_State       : CYW43_Record;
   CYW43_State_Sleep : UInt32 := 0;

end CYW43;