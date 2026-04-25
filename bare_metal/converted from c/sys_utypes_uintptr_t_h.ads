pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with arm_utypes_h;

package sys_utypes_uintptr_t_h is
   pragma Preelaborate;

   subtype intptr_t is arm_utypes_h.uu_darwin_intptr_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_intptr_t.h:32

end sys_utypes_uintptr_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
