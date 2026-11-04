
#include <stdio.h>
#include "pico/stdlib.h"

// This function will be called from Ada
void c_print_led_status(int status)
    {
    if (status)
        {
        printf("C Code: LED is ON\n");
        } 
    else 
        {
        printf("C Code: LED is OFF\n");
        }
    }

// External declaration of the Ada function we want to call
extern int ada_get_next_status(int current_status);

// A C function that interacts with the Ada logic
int c_toggle_logic(int current_status)
    {
    return ada_get_next_status(current_status);
    }
