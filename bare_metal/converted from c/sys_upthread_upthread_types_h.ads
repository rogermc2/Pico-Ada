pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;

package sys_upthread_upthread_types_h is
   pragma Preelaborate;

   type uu_darwin_pthread_handler_rec;
   type uu_darwin_pthread_handler_rec is record
      uu_routine : access procedure (arg1 : System.Address);  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:58
      uu_arg : System.Address;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:59
      uu_next : access uu_darwin_pthread_handler_rec;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:60
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:57

   subtype anon_array1737 is Interfaces.C.char_array (0 .. 55);
   type u_opaque_pthread_attr_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:64
      uu_opaque : aliased anon_array1737;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:65
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:63

   subtype anon_array1740 is Interfaces.C.char_array (0 .. 39);
   type u_opaque_pthread_cond_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:69
      uu_opaque : aliased anon_array1740;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:70
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:68

   subtype anon_array1743 is Interfaces.C.char_array (0 .. 7);
   type u_opaque_pthread_condattr_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:74
      uu_opaque : aliased anon_array1743;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:75
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:73

   type u_opaque_pthread_mutex_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:79
      uu_opaque : aliased anon_array1737;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:80
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:78

   type u_opaque_pthread_mutexattr_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:84
      uu_opaque : aliased anon_array1743;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:85
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:83

   type u_opaque_pthread_once_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:89
      uu_opaque : aliased anon_array1743;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:90
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:88

   subtype anon_array1749 is Interfaces.C.char_array (0 .. 191);
   type u_opaque_pthread_rwlock_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:94
      uu_opaque : aliased anon_array1749;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:95
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:93

   subtype anon_array1751 is Interfaces.C.char_array (0 .. 15);
   type u_opaque_pthread_rwlockattr_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:99
      uu_opaque : aliased anon_array1751;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:100
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:98

   subtype anon_array1754 is Interfaces.C.char_array (0 .. 8175);
   type u_opaque_pthread_t is record
      uu_sig : aliased long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:104
      uu_cleanup_stack : access uu_darwin_pthread_handler_rec;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:105
      uu_opaque : aliased anon_array1754;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:106
   end record
   with Convention => C_Pass_By_Copy;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:103

   subtype uu_darwin_pthread_attr_t is u_opaque_pthread_attr_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:109

   subtype uu_darwin_pthread_cond_t is u_opaque_pthread_cond_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:110

   subtype uu_darwin_pthread_condattr_t is u_opaque_pthread_condattr_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:111

   subtype uu_darwin_pthread_key_t is unsigned_long;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:112

   subtype uu_darwin_pthread_mutex_t is u_opaque_pthread_mutex_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:113

   subtype uu_darwin_pthread_mutexattr_t is u_opaque_pthread_mutexattr_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:114

   subtype uu_darwin_pthread_once_t is u_opaque_pthread_once_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:115

   subtype uu_darwin_pthread_rwlock_t is u_opaque_pthread_rwlock_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:116

   subtype uu_darwin_pthread_rwlockattr_t is u_opaque_pthread_rwlockattr_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:117

   type uu_darwin_pthread_t is access all u_opaque_pthread_t;  -- /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/sys/_pthread/_pthread_types.h:118

end sys_upthread_upthread_types_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
