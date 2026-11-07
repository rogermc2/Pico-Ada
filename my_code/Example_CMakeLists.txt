
cmake_minimum_required(VERSION 3.13)

include(pico_sdk_import.cmake)

# Enable Ada language support
project(pico2_ada_c C ASM Ada)
pico_sdk_init()

add_executable(simple_Pico2_ada
    Simple_Pico2.adb
    c_interface.ads
    c_interface.adb
    c_funcs.c
)
target_link_libraries(simple_Pico2_ada pico_stdlib)
pico_add_extra_outputs(simple_Pico2_ada)
