pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package sys_utypes_uint32_t_h is
   pragma Preelaborate;

   subtype int32_t is int;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_int32_t.h:30

end sys_utypes_uint32_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
