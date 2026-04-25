pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package sys_utypes_uint16_t_h is
   pragma Preelaborate;

   subtype int16_t is short;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types/_int16_t.h:30

end sys_utypes_uint16_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
