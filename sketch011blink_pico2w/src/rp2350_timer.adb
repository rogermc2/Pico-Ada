
package body RP2350_Timer is

   function Get_Time_US return Unsigned_64 is
      High_1, High_2 : Unsigned_32;
      Low            : Unsigned_32;
   begin
      loop
         High_1 := Timer_Periph.TIME_RAWH;
         Low    := Timer_Periph.TIME_RAWL;
         High_2 := Timer_Periph.TIME_RAWH;
         
         --  Exit loop if a 32-bit overflow didn't occur mid-read
         exit when High_1 = High_2;
      end loop;

      --  Shift the High 32 bits and combine with Low 32 bits
      return (Shift_Left (Unsigned_64(High_1), 32)) 
             or Unsigned_64(Low);
   end Get_Time_US;

   procedure Delay_Microseconds (US : Unsigned_32) is
      Start_Time : constant Unsigned_64 := Get_Time_US;
      Target     : constant Unsigned_64 := Start_Time + Unsigned_64(US);
   begin
      --  Busy-wait loop until the hardware counter matches target time
      while Get_Time_US < Target loop
         null;
      end loop;

   end Delay_Microseconds;

end RP2350_Timer;
