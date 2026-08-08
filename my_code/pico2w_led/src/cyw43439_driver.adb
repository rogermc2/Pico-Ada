package body CYW43439_Driver is

   procedure Build_SPI_Frame (Header : GSPI_Header;  Payload : Unsigned_8;
                              Buffer  : out U8_Array)  is
      -- We will construct a mathematical 32-bit register template
      Command_Word : Unsigned_32 := 0;
      
      Func_Val : constant Unsigned_32 := 
        (case Header.Func is 
           when Function_0_Bus       => 0, 
           when Function_1_Backplane => 1, 
           when Function_2_WLAN      => 2);
   begin
      -- 1. Mathematically position the bits exactly where the CYW43439 wants them
      if Header.Write_Access then
         Command_Word := Command_Word or Shift_Left (1, 31);
      end if;

      if Header.Auto_Inc then
         Command_Word := Command_Word or Shift_Left (1, 30);
      end if;

      Command_Word := Command_Word or Shift_Left (Func_Val and 16#03#, 28);
      Command_Word := Command_Word or Shift_Left (Header.Address and 16#7FFF#, 13);
      Command_Word := Command_Word or (Header.Length and 16#07FF#);

      -- 2. Extract into a Big-Endian array sequence.
      -- This ensures that the upper-most bits are transmitted on the wire first.
      Buffer (1) := Unsigned_8 (Shift_Right (Command_Word, 24) and 16#FF#); -- Sent 1st
      Buffer (2) := Unsigned_8 (Shift_Right (Command_Word, 16) and 16#FF#); -- Sent 2nd
      Buffer (3) := Unsigned_8 (Shift_Right (Command_Word, 8)  and 16#FF#); -- Sent 3rd
      Buffer (4) := Unsigned_8 (Command_Word and 16#FF#);                  -- Sent 4th
      
      -- 3. Append the data payload byte
      Buffer (5) := Payload;                                                -- Sent 5th
   end Build_SPI_Frame;

end CYW43439_Driver;
