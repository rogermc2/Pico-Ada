
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

package RP2350_CYW43439 is

   function Check_Chip_Communication return Unsigned_32;
   procedure Initialize_gSPI;
   procedure Wait (Duration : Time_Span);
   procedure Write_gSPI_Word32 (Value : Unsigned_32);

end RP2350_CYW43439;
