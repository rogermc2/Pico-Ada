
--  with RP2350_CYW43439; use RP2350_CYW43439;

with CYW43_Bitbang; use CYW43_Bitbang;
with CYW43439_Driver; use CYW43439_Driver;
with CYW43439_Verification; use CYW43439_Verification;

procedure Wakeup is
   OK : Boolean;
begin
   --  Initialize_gSPI;
   Execute_W_Wakeup;
   OK := Verify_Chip_Communication;

   loop
      null;
   end loop;
   
end Wakeup;
