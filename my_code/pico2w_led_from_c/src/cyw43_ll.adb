
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with CYW43_Ctrl; use CYW43_Ctrl;
with RP2350; use RP2350;
with CYW43_Internal; use CYW43_Internal;
--  with CYW43_Types; use CYW43_Types;

package body CYW43_LL is

   --  for cyw43_sdpcm_send_common
   CONTROL_HEADER    : constant := 0;
   ASYNCEVENT_HEADER : constant := 1;
   DATA_HEADER       : constant := 2;

   SDPCM_HEADER_LEN  : constant := 12; -- Example value, typically 12 for SDPCM
   SDPCM_SET         : constant := 2;
   WWD_STA_INTERFACE : constant := 0;
   WWD_AP_INTERFACE  : constant := 1;
   WWD_P2P_INTERFACE : constant := 2;
   WLC_GET_VAR       : constant := 262;
   WLC_SET_VAR       : constant := 263;

   CDCF_IOC_ID_SHIFT : constant Natural := 16;
   CDCF_IOC_ID_MASK  : constant UInt32 := 16#ffff0000#;
   CDCF_IOC_IF_SHIFT : constant Natural := 12;

   type IOctl_Header_Record is record
      Command : UInt32;
      Lengths : UInt32;
      Flags   : UInt32;
      Status  : UInt32;
   end record;

   CYW43_IOCTL_TIMEOUT_US : constant Time_Span := Milliseconds (500);

   function CYW43_Send_Ioctl
    (Self : in out CYW43_Internal_Record; Kind, Command, Len : UInt32;
     Buffer : U8_Array; Iface : UInt32) return Boolean;
   function CYW43_Sdpcm_Send_Common 
      (Self : in out CYW43_Internal_Record; CONTROL_HEADER, Len : UINT32;
       Buffer : U8_Array) return Boolean;

   procedure CYW43_LL_Bus_Sleep (Self_In : CYW43_Internal_Record; Can_Sleep : Boolean) is
   begin
      null;
   end CYW43_LL_Bus_Sleep;

   procedure Cyw43_Write_Iovar_U32_U32 (Self : in out CYW43_Internal_Record;
                            Var : String; Val0, Val1, Iface : UInt32);

   function CYW43_LL_GPIO_Get (Data : in out CYW43_Internal_Record; GPIO_N : Integer;
             GPIO_EN : Boolean) return Boolean is
   begin
      return False;
   end CYW43_LL_GPIO_Get;

   procedure CYW43_LL_Init
    (Self : in out CYW43_Internal_Record; Data : CYW43_Record) is
   begin
      --  CYW_Int_From_LL (Self, CYW43_LL);
      Self.CB_Data := Data;
      Self.Wwd_SDPCM_Last_Bus_Data_Credit := 1;

   end CYW43_LL_Init;

   function CYW43_LL_GPIO_Set  (Self_In : in out CYW43_Internal_Record;
                  GPIO_N : Integer; GPIO_EN : Boolean) return Boolean is
      Enable_Pin : constant UInt32 := (if GPIO_EN then Shift_Left (1, GPIO_N) else 0);
   begin
      --  CYW_Int_From_LL (Self, Self_In);
      CYW43_Write_IOvar_U32_U32 (Self_In, "gpioout", Shift_Left (1, GPIO_N), Enable_Pin,
                                  WWD_STA_INTERFACE);
      return True;

   end CYW43_LL_GPIO_Set;

   -- Helper to put Little Endian 32-bit values into a buffer
   procedure Cyw43_Put_Le32 (Buffer : in out U8_Array; Offset : Integer; Val : UInt32) is
   begin
      Buffer (Offset)     := Byte (Val and 16#FF#);
      Buffer (Offset + 1) := Byte (Shift_Right(Val, 8) and 16#FF#);
      Buffer (Offset + 2) := Byte (Shift_Right(Val, 16) and 16#FF#);
      Buffer (Offset + 3) := Byte (Shift_Right(Val, 24) and 16#FF#);

end CYW43_Put_Le32;

function CYW43_Do_Ioctl
    (Self : in out CYW43_Internal_Record; Kind, Command, Len : UInt32;
     Buffer  : U8_Array;  Iface : UInt32) return Boolean is
      Start_Time : constant Time := Clock;
      Result : Boolean := 
         CYW43_Send_Ioctl (Self, Kind, Command, Len, Buffer, Iface);
begin
   while Time_Span (Clock - Start_Time) < CYW43_IOCTL_TIMEOUT_US loop
      null;
   end loop;
   return Result;
      
end CYW43_Do_Ioctl;

function CYW43_Send_Ioctl
    (Self : in out CYW43_Internal_Record; Kind, Command, Len : UInt32;
     Buffer : U8_Array; Iface : UInt32) return Boolean is
     Ioctl_ID : constant UInt16 := Self.Wwd_SDPCM_Requested_Ioctl_ID + 1;
     Flags : constant UInt32 :=
      (Shift_Left (UInt32 (Ioctl_ID), CDCF_IOC_ID_SHIFT) and CDCF_IOC_ID_MASK) or
      Kind or Shift_Left (Iface,CDCF_IOC_IF_SHIFT );
      Header : IOctl_Header_Record := (Command, Len and 16#ffff#, Flags, 0);
   begin
      Self.Wwd_SDPCM_Requested_Ioctl_ID := Ioctl_ID;
      for index in Buffer'First .. Buffer'Last loop
         Self.SPID_Buffer (index + SDPCM_HEADER_LEN + 16) := Buffer (index);
      end loop;

      --  if Header.Command = WLC_SET_VAR or else
      --     Header.Command = WLC_GET_VAR then
      --     CYW43_VDEBUG command
      --  end if;

      return CYW43_Sdpcm_Send_Common (Self, CONTROL_HEADER, 16 + len, Self.SPID_Buffer);

   end CYW43_Send_Ioctl;

   function CYW43_Sdpcm_Send_Common 
      (Self : in out CYW43_Internal_Record; CONTROL_HEADER, Len : UINT32;
       Buffer : U8_Array) return Boolean is
   begin
      return False;
   end  CYW43_Sdpcm_Send_Common;

   --  called as CYW43_write_iovar_u32_u32 ("gpioout", 1 << gpio_n, gpio_en ? (1 << gpio_n) : 0, WWD_STA_INTERFACE);
   procedure CYW43_Write_Iovar_U32_U32
    (Self : in out CYW43_Internal_Record; Var : String; Val0, Val1, Iface : UInt32) is
      --  uint8_t *buf = &self->spid_buf[SDPCM_HEADER_LEN + 16];
      --  spid_buf[...] targets a specific index in the spid_buf byte array.
      --  SDPCM_HEADER_LEN + 16 is the target index.
      --  It skips the length of the SDPCM header plus an additional 16 bytes 
      --  to set the start of the payload data
      Var_Len      : constant Positive := Var'Length;
      Var_Len_P10  : constant Positive := Var_Len + 10;
      Start_Index  : constant Positive := SDPCM_HEADER_LEN + 16;
      Buff_Last    : constant Positive := Start_Index + Var_Len + 7;
      Buffer       : U8_Array (1 .. Buff_Last);
      Result       : Boolean := False;
   begin      
      for index in Start_Index .. Start_Index + Var_Len loop
         Buffer (index) := Character'Pos (Var (index));
      end loop;
      Buffer (Start_Index + Var_Len + 1) := 0;  -- add terminator

      --  Put Little Endian 32-bit values into a buffer
      CYW43_Put_Le32 (Self.SPID_Buffer, Var_Len + 2, Val0);
      CYW43_Put_Le32 (Self.SPID_Buffer, Var_Len + 6, Val1);

      --  CYW43.SPI_Buffer := Buffer;
      -- cyw43_do_ioctl(self, SDPCM_SET, WLC_SET_VAR, len + 8, buf, iface);
      -- Note: We pass the slice of the buffer starting at Start_Index
      Result := Cyw43_Do_Ioctl (Self, SDPCM_SET, WLC_SET_VAR,  
               UInt32 (Var_Len_P10), Buffer, Iface);

   end CYW43_Write_Iovar_U32_U32;

end CYW43_LL;