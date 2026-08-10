
with Interfaces; use Interfaces;

with CYW43_Bitbang; use CYW43_Bitbang;
with CYW43439_Driver; use CYW43439_Driver;

package CYW43439_Verification is
   -- Reads the 32-bit test signature register over the bit-bang lines.
   -- Returns True if it matches the expected 16#FEEDBEAD# pattern.
   function Verify_Chip_Communication return Boolean;

end CYW43439_Verification;
