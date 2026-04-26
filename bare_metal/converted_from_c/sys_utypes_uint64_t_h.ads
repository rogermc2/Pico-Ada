pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package sys_utypes_uint64_t_h is
   pragma Preelaborate;

   subtype int64_t is Long_Long_Integer;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_int64_t.h:30

end sys_utypes_uint64_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
