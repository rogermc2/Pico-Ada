pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package utypes_uintmax_t_h is
   pragma Preelaborate;

   subtype intmax_t is long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types/_intmax_t.h:32

end utypes_uintmax_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
