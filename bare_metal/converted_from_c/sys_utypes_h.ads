pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with arm_utypes_h;

package sys_utypes_h is
   pragma Preelaborate;

   subtype uu_darwin_blkcnt_t is arm_utypes_h.uu_int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:67

   subtype uu_darwin_blksize_t is arm_utypes_h.uu_int32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:68

   subtype uu_darwin_dev_t is arm_utypes_h.uu_int32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:69

   subtype uu_darwin_fsblkcnt_t is unsigned;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:70

   subtype uu_darwin_fsfilcnt_t is unsigned;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:71

   subtype uu_darwin_gid_t is arm_utypes_h.uu_uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:72

   subtype uu_darwin_id_t is arm_utypes_h.uu_uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:73

   subtype uu_darwin_ino64_t is arm_utypes_h.uu_uint64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:74

   subtype uu_darwin_ino_t is uu_darwin_ino64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:76

   subtype uu_darwin_mach_port_name_t is arm_utypes_h.uu_darwin_natural_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:80

   subtype uu_darwin_mach_port_t is uu_darwin_mach_port_name_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:81

   subtype uu_darwin_mode_t is arm_utypes_h.uu_uint16_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:82

   subtype uu_darwin_off_t is arm_utypes_h.uu_int64_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:83

   subtype uu_darwin_pid_t is arm_utypes_h.uu_int32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:84

   subtype uu_darwin_sigset_t is arm_utypes_h.uu_uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:85

   subtype uu_darwin_suseconds_t is arm_utypes_h.uu_int32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:86

   subtype uu_darwin_uid_t is arm_utypes_h.uu_uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:87

   subtype uu_darwin_useconds_t is arm_utypes_h.uu_uint32_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:88

   type uu_darwin_uuid_t is array (0 .. 15) of aliased unsigned_char;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:89

   subtype uu_darwin_uuid_string_t is Interfaces.C.char_array (0 .. 36);  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_types.h:90

end sys_utypes_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
