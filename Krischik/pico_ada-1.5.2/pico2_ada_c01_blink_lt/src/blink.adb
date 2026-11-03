---
---  Copyright 2021 (C) Jeremy Grosser
---
---  SPDX-License-Identifier: BSD-3-Clause
---
--: with RP.GPIO;
--: with Pico;
with Pico.UART_IO;

---
--  The Hello_Pico sample from the https://pico-doc.synack.me/ to test basic functionality of the Ada and Pico setup.
--
procedure Blink with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Blink"));
begin
   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));

   --  Pico.LED.Configure (RP.GPIO.Output);
   loop
      --  Pico.LED.Toggle;
      delay 0.1;
   end loop;
end Blink;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
