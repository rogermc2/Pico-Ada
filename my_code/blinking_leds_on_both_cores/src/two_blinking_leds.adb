
with Ada.Real_Time; use Ada.Real_Time;

package body Two_Blinking_LEDs is

   --  Dummy : Unsigned_32 := 0
   --    with Volatile;

   --  procedure Delay_Loop (Max_I : positive) is
   --  begin
   --     for I in 1 .. Max_I loop
   --        Dummy := Dummy + 1;
   --     end loop;
   --  end Delay_Loop;
   
   procedure Blink_LED (LED : Pin_Number; On_Time, Off_Time : in Duration) is
      On_Period  : constant Time_Span := To_Time_Span (On_Time);
      Off_Period : constant Time_Span := To_Time_Span (Off_Time);
      Next       : Time := Clock;
      Max_I : positive := 10000000;
   begin
      Init_Output (LED);
      loop
         Set_High (LED);
         Next := Next + On_Period;
         delay until Next;

         Set_Low (LED);
         Next := Next + Off_Period;
         delay until Next;
      end loop;

   end Blink_LED;

   --  task body Core_2 is
   --     Led_1 : Pin_Number := Internal_LED;
   --  begin
   --     Blink_LED (Led_1, 1.009, 0.503);
   --  end Core_2;
   
end Two_Blinking_LEDs;
