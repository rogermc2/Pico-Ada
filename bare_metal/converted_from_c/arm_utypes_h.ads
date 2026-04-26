pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");
pragma Preelaborate;

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;

package arm_utypes_h is

   subtype uu_int8_t is signed_char;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:28

   subtype uu_uint8_t is unsigned_char;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:32

   subtype uu_int16_t is short;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:33

   subtype uu_uint16_t is unsigned_short;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:34

   subtype uu_int32_t is int;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:35

   subtype uu_uint32_t is unsigned;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:36

   subtype uu_int64_t is Long_Long_Integer;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:37

   subtype uu_uint64_t is Extensions.unsigned_long_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:38

   subtype uu_darwin_intptr_t is long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:40

   subtype uu_darwin_natural_t is unsigned;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:41

   subtype uu_darwin_ct_rune_t is int;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:61

   subtype anon_array1696 is Interfaces.C.char_array (0 .. 127);
   type uu_mbstate_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_mbstate8 : aliased anon_array1696;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:68
         when others =>
            u_mbstateL : aliased Long_Long_Integer;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:69
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:70

   subtype uu_darwin_mbstate_t is uu_mbstate_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:72

   subtype uu_darwin_ptrdiff_t is long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:77

   subtype uu_darwin_size_t is unsigned_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:87

   subtype uu_darwin_va_list is System.Address;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:95

   subtype uu_darwin_wchar_t is int;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:103

   subtype uu_darwin_rune_t is uu_darwin_wchar_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:108

   subtype uu_darwin_wint_t is int;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:111

   subtype uu_darwin_clock_t is unsigned_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:116

   subtype uu_darwin_socklen_t is uu_uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:117

   subtype uu_darwin_ssize_t is long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:118

   subtype uu_darwin_time_t is long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/arm/_types.h:119

end arm_utypes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
