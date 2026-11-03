#!/usr/local/bin/python3

import math

print("   type Delay_Array_Type is array (1 .. 10) of RT.Time_Span;")

def print_ada_array(name, base=8.0, amp=14.0, leds=10, decimals=3, description=""):
    print(f"   --  {name} (Base = {base} ms, Amplitude = {amp} ms){description}")    
    print(f"   --")
    print(f"   Delay_Times_{name} : constant Delay_Array_Type := [")
    for i in range(leds):
        pos = i / (leds - 1)
        phase = pos * math.pi
        factor = (1.0 - math.sin(phase)) / 2.0
        ms = (base + amp * factor) / 100.0
        print(f"      {i+1} => RT.To_Time_Span ({ms:.{decimals}f}),")
    print("   ];")

print_ada_array("Base",      8.0, 14.0, )
print_ada_array("Fast",      6.0, 12.0, description=" – feels snappier but still has clear easing:")
print_ada_array("Dramatic", 10.0, 20.0, description=" – almost pauses at the ends:")
print_ada_array("Gentle",   10.0, 6.0,  description=" – subtle, almost constant but slightly organic:")
