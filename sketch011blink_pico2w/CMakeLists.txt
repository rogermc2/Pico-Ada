cmake_minimum_required(VERSION 3.13)

# =Define target board parameters BEFORE importing the SDK
set(PICO_BOARD pico2_w CACHE STRING "Board type")

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
project(pico_deps C)
pico_sdk_init()

add_compile_options(-Wno-error=incompatible-pointer-types)

add_library(pico_cyw43_arch_none_static STATIC)

target_link_libraries(pico_cyw43_arch_none_static PRIVATE pico_cyw43_arch_none)
