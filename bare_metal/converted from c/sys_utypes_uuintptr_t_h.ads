pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package sys_utypes_uuintptr_t_h is
   pragma Preelaborate;

   subtype uintptr_t is unsigned_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_uintptr_t.h:34

end sys_utypes_uuintptr_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
