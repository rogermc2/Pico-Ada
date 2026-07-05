
with Ada.Real_Time; use Ada.Real_Time;

package body Two_Blinking_LEDs is

   procedure Blink_LED
      (LED : out Pin_Number; On_Time, Off_Time : in Duration) is
      On_Period  : constant Time_Span := To_Time_Span (On_Time);
      Off_Period : constant Time_Span := To_Time_Span (Off_Time);
      Next       : Time := Clock;
   begin
      --  LED.Configure (RP.GPIO.Output);
      Init_Output (LED);
      loop
         Set_High (LED);
         Next := Next + On_Period;
         --  LED.Set;
         delay until Next;

         Set_Low (LED);
         Next := Next + Off_Period;
         --  LED.Clear;
         delay until Next;
      end loop;

   end Blink_LED;

   --  task body Core_2 is
   --     Led_1 : Pin_Number := Internal_LED;
   --  begin
   --     Blink_LED (Led_1, 1.009, 0.503);
   --  end Core_2;
   
end Two_Blinking_LEDs;
