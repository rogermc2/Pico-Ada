pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with sys_utypes_uint8_t_h;
with sys_utypes_uint16_t_h;
with sys_utypes_uint32_t_h;
with sys_utypes_uint64_t_h;
with utypes_uuint8_t_h;
with utypes_uuint16_t_h;
with utypes_uuint32_t_h;
with utypes_uuint64_t_h;

package stdint_h is
   pragma Preelaborate;

   --  arg-macro: function INT8_C (v)
   --    return v;
   --  arg-macro: function INT16_C (v)
   --    return v;
   --  arg-macro: function INT32_C (v)
   --    return v;
   --  unsupported macro: INT64_C(v) (v ## LL)
   --  arg-macro: function UINT8_C (v)
   --    return v;
   --  arg-macro: function UINT16_C (v)
   --    return v;
   --  unsupported macro: UINT32_C(v) (v ## U)
   --  unsupported macro: UINT64_C(v) (v ## ULL)
   --  unsupported macro: INTMAX_C(v) (v ## L)
   --  unsupported macro: UINTMAX_C(v) (v ## UL)
   INT8_MAX : constant := 127;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:91
   INT16_MAX : constant := 32767;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:92
   INT32_MAX : constant := 2147483647;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:93
   INT64_MAX : constant := 9223372036854775807;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:94

   INT8_MIN : constant := -128;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:96
   INT16_MIN : constant := -32768;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:97
   --  unsupported macro: INT32_MIN (-INT32_MAX-1)
   --  unsupported macro: INT64_MIN (-INT64_MAX-1)

   UINT8_MAX : constant := 255;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:107
   UINT16_MAX : constant := 65535;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:108
   UINT32_MAX : constant := 4294967295;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:109
   UINT64_MAX : constant := 18446744073709551615;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:110
   --  unsupported macro: INT_LEAST8_MIN INT8_MIN
   --  unsupported macro: INT_LEAST16_MIN INT16_MIN
   --  unsupported macro: INT_LEAST32_MIN INT32_MIN
   --  unsupported macro: INT_LEAST64_MIN INT64_MIN
   --  unsupported macro: INT_LEAST8_MAX INT8_MAX
   --  unsupported macro: INT_LEAST16_MAX INT16_MAX
   --  unsupported macro: INT_LEAST32_MAX INT32_MAX
   --  unsupported macro: INT_LEAST64_MAX INT64_MAX
   --  unsupported macro: UINT_LEAST8_MAX UINT8_MAX
   --  unsupported macro: UINT_LEAST16_MAX UINT16_MAX
   --  unsupported macro: UINT_LEAST32_MAX UINT32_MAX
   --  unsupported macro: UINT_LEAST64_MAX UINT64_MAX
   --  unsupported macro: INT_FAST8_MIN INT8_MIN
   --  unsupported macro: INT_FAST16_MIN INT16_MIN
   --  unsupported macro: INT_FAST32_MIN INT32_MIN
   --  unsupported macro: INT_FAST64_MIN INT64_MIN
   --  unsupported macro: INT_FAST8_MAX INT8_MAX
   --  unsupported macro: INT_FAST16_MAX INT16_MAX
   --  unsupported macro: INT_FAST32_MAX INT32_MAX
   --  unsupported macro: INT_FAST64_MAX INT64_MAX
   --  unsupported macro: UINT_FAST8_MAX UINT8_MAX
   --  unsupported macro: UINT_FAST16_MAX UINT16_MAX
   --  unsupported macro: UINT_FAST32_MAX UINT32_MAX
   --  unsupported macro: UINT_FAST64_MAX UINT64_MAX

   INTPTR_MAX : constant := 9223372036854775807;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:147
   --  unsupported macro: INTPTR_MIN (-INTPTR_MAX-1)

   UINTPTR_MAX : constant := 18446744073709551615;  --  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:154
   --  unsupported macro: INTMAX_MAX INTMAX_C(9223372036854775807)
   --  unsupported macro: UINTMAX_MAX UINTMAX_C(18446744073709551615)
   --  unsupported macro: INTMAX_MIN (-INTMAX_MAX-1)
   --  unsupported macro: PTRDIFF_MIN INTMAX_MIN
   --  unsupported macro: PTRDIFF_MAX INTMAX_MAX
   --  unsupported macro: SIZE_MAX UINTPTR_MAX
   --  unsupported macro: RSIZE_MAX (SIZE_MAX >> 1)
   --  unsupported macro: WCHAR_MAX __WCHAR_MAX__
   --  unsupported macro: WCHAR_MIN (-WCHAR_MAX-1)
   --  unsupported macro: WINT_MIN INT32_MIN
   --  unsupported macro: WINT_MAX INT32_MAX
   --  unsupported macro: SIG_ATOMIC_MIN INT32_MIN
   --  unsupported macro: SIG_ATOMIC_MAX INT32_MAX

   subtype int_least8_t is sys_utypes_uint8_t_h.int8_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:29

   subtype int_least16_t is sys_utypes_uint16_t_h.int16_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:30

   subtype int_least32_t is sys_utypes_uint32_t_h.int32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:31

   subtype int_least64_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:32

   subtype uint_least8_t is utypes_uuint8_t_h.uint8_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:33

   subtype uint_least16_t is utypes_uuint16_t_h.uint16_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:34

   subtype uint_least32_t is utypes_uuint32_t_h.uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:35

   subtype uint_least64_t is utypes_uuint64_t_h.uint64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:36

   subtype int_fast8_t is sys_utypes_uint8_t_h.int8_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:40

   subtype int_fast16_t is sys_utypes_uint16_t_h.int16_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:41

   subtype int_fast32_t is sys_utypes_uint32_t_h.int32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:42

   subtype int_fast64_t is sys_utypes_uint64_t_h.int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:43

   subtype uint_fast8_t is utypes_uuint8_t_h.uint8_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:44

   subtype uint_fast16_t is utypes_uuint16_t_h.uint16_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:45

   subtype uint_fast32_t is utypes_uuint32_t_h.uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:46

   subtype uint_fast64_t is utypes_uuint64_t_h.uint64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdint.h:47

end stdint_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
