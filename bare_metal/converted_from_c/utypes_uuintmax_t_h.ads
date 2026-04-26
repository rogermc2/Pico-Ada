pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package utypes_uuintmax_t_h is
   pragma Preelaborate;

   subtype uintmax_t is unsigned_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types/_uintmax_t.h:32

end utypes_uuintmax_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
