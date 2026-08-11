
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

package RP2350_CYW43439 is

  function CYW43_Arch_Init return Boolean;
  procedure Wait (Duration : Time_Span);
  
end RP2350_CYW43439;
