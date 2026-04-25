pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package utypes_uuint16_t_h is
   pragma Preelaborate;

   subtype uint16_t is unsigned_short;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types/_uint16_t.h:31

end utypes_uuint16_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
