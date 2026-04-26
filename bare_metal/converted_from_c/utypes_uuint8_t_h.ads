pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package utypes_uuint8_t_h is
   pragma Preelaborate;

   subtype uint8_t is unsigned_char;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/_types/_uint8_t.h:31

end utypes_uuint8_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
