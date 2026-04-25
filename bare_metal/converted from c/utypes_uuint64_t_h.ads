pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package utypes_uuint64_t_h is
   pragma Preelaborate;

   subtype uint64_t is Extensions.unsigned_long_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types/_uint64_t.h:31

end utypes_uuint64_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
