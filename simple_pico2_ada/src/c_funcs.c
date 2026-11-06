
#include <stdio.h>
// #include "pico/stdlib.h"

// void c_print_led_status (int status)
//     {
//     if (status)
//         {
//         printf ("C Code: LED is ON\n");
//         } 
//     else 
//         {
//         printf ("C Code: LED is OFF\n");
//         }
//     }

// External declaration of the Ada function we want to call
extern int ada_get_next_status (int current_status);

int c_toggle_logic (int current_status)
    {
    return ada_get_next_status(current_status);
    }
