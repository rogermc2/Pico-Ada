
package SVD_Support is

   --  Group definitions for specific pins
   REG_ON_MASK   : constant := 2**23;
   DATA_MASK     : constant := 2**24;
   CS_MASK       : constant := 2**25;
   CLK_MASK      : constant := 2**29;
   
   procedure Configure_SIO_With_SVD;

end SVD_Support;