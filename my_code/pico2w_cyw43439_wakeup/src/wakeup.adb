
with CYW43439_Verification; use CYW43439_Verification;

procedure Wakeup is
begin
   Boot_And_Verify_WLAN;

   loop
      null;
   end loop;
   
end Wakeup;
