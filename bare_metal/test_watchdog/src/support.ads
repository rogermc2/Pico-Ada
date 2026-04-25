
--  with System;

package Support is

   procedure Task_Blocking_Led_Flash  (Led_Pin : Natural);

   -- Redefinition of the standard C _write function for redirection to UART
   --  function Write (File : int; Ptr : System.Address; Len : int) return int;
   --  pragma Export (C, Write, "_write");

end Support;
