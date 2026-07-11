
with RP2350; use RP2350;

with Pico2W_Support; use Pico2W_Support;

package SVD_Support is

   --  Group definitions for specific pins
   REG_ON_MASK   : constant := 2**23;
   DATA_MASK     : constant := 2**24;
   CS_MASK       : constant := 2**25;
   CLK_MASK      : constant := 2**29;
   
   procedure Bit_Bang_Send_Word (Word : UInt32);
   procedure Configure_SIO_With_SVD;
   procedure Send_SVD_Command (Cmd : GSPI_Command);

end SVD_Support;