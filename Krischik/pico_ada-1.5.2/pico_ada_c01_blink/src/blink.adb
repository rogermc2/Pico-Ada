---
---  Copyright 2021 (C) Jeremy Grosser
---
---  SPDX-License-Identifier: BSD-3-Clause
---
with RP.Device;
with RP.Clock;
with RP.GPIO;
with Pico;

---
--  The Hello_Pico sample from the https://pico-doc.synack.me/ to test basic functionality of the Ada and Pico setup.
--
procedure Blink with
   No_Return
is
begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   Pico.LED.Configure (RP.GPIO.Output);
   RP.Device.Timer.Enable;
   loop
      Pico.LED.Toggle;
      RP.Device.Timer.Delay_Milliseconds (100);
   end loop;
end Blink;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
