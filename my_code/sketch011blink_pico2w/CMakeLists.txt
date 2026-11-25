cmake_minimum_required(VERSION 3.13)

# =Define target board parameters BEFORE importing the SDK
set(PICO_BOARD pico2_w CACHE STRING "Board type")

include($ENV{PICO_SDK_PATH}/external/pico_sdk_import.cmake)
project(pico_deps C)
pico_sdk_init()

add_compile_options(
    -mcpu=cortex-m33
    -mthumb
    -mfloat-abi=hard
    -mfpu=fpv5-sp-d16
    -Wno-error=incompatible-pointer-types
)

file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/lwip_stubs.c "
#include <stdint.h>
uint16_t pbuf_copy_partial(void *p, void *datap, uint16_t len, uint16_t offset) {
    return 0;
}
")

add_library(pico_cyw43_arch_none_static STATIC
    ${CMAKE_CURRENT_BINARY_DIR}/lwip_stubs.c)

target_link_libraries(pico_cyw43_arch_none_static PRIVATE
    pico_cyw43_arch_none)