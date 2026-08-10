
with CYW43439_Driver; use CYW43439_Driver;

package CYW43439_Verification is

procedure Boot_And_Verify_WLAN;   
   -- Returns True if the response matches 16#FEEDBEAD#.
   function Verify_Chip_Communication return Boolean;

end CYW43439_Verification;
