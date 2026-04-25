
with Interfaces; use Interfaces;

package Watchdog is

   procedure Configure_Watchdog (Reload_Us : unsigned_32);
   procedure Feed_The_Watchdog;

end Watchdog;
