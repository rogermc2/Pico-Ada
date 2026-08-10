
with RP2350_CYW43439; use RP2350_CYW43439;
with CYW43_Bitbang; use CYW43_Bitbang;
with CYW43439_Verification; use CYW43439_Verification;

procedure Wakeup is
begin
   Initialize_gSPI;
   Boot_And_Verify_WLAN;

   loop
      null;
   end loop;
   
end Wakeup;
