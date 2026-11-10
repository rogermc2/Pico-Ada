--------------------------------------------------------------- {{{1 ----------
--: Copyright © 2026 … 2026 Martin Krischik «krischik@users.sourceforge.net»
------------------------------------------------------------------------------
--: This library is free software; you can redistribute it and/or modify it
--: under the terms of the GNU Library General Public License as published by
--: the Free Software Foundation; either version 2 of the License, or (at your
--: option) any later version.
--:
--: This library is distributed in the hope that it will be useful, but
--: WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--: or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public
--: License for more details.
--:
--: You should have received a copy of the GNU Library General Public License
--: along with this library; if not, write to the Free Software Foundation,
--: Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
--------------------------------------------------------------- }}}1 ----------

with Pico_Xbsp_Config;

------------------------------------------------------------------------------
--  @summary
--  Multi-destination debug output for the Raspberry Pi Pico
--
--  @description
--
--  This package redirects debug output depending on the `Event_Log_Output` setting in your Alire configuration
--  (`alire.toml`):
--
--: * **none**      – Output is disabled. `Get` returns `ASCII.NUL`.
--: * **debugger**  – Uses `Ada.Text_IO` with semihosting (output goes to GDB).
--:                   Remember to enable it with `arm semihosting enable`.
--: * **usb**       – Uses `Pico.USB_IO` (USB CDC). You need a serial terminal
--:                   on the host.
--: * **uart**      – Uses `Pico.UART_IO` (best option for reliability). Requires
--                    a debug probe or USB-to-RS232C adapter + serial terminal.
--
--  Note: Semihosting does not support timeouts.
------------------------------------------------------------------------------
package Pico.Debug_IO is

   use type Pico_Xbsp_Config.Event_Log_Output_Kind;

   -------------------------------------------------------------------------
   --  Initialises the selected output channel.
   --
   --: * No-op for `Ada.Text_IO` (debugger)
   --: * Initialises `Pico.UART_IO` or `Pico.USB_IO` for the other modes
   --
   --: @exception Pico.UART_IO.IO_Error Initialisation failed
   --: @exception Pico.USB_IO.IO_Error Initialisation failed
   -------------------------------------------------------------------------
   procedure Initialise;

   -------------------------------------------------------------------------
   --  Activates USB logging (only has effect when `Event_Log_Output` is set to `usb`).
   --
   --  For logging to take effect you must also:
   --
   --: * Set `usb_embedded.Log_Verbose` to `True`, and
   --: * Set `usb_embedded.Event_Log_Buffer_Size` to a value greater than 0.
   --: * Set 'adacl_embedded.Event_Log_Buffer_Size' to a value greater than 0.
   --
   --  These settings enable the underlying debug features provided by the `usb_embedded` library.
   --
   --  Important:
   --
   --  USB logging cannot be sent over the USB CDC connection itself (you cannot debug USB using USB). Use one of the
   --  alternative output channels instead:
   --
   --: * `UART`  (recommended – most reliable)
   --: * `Ada.Text_IO` (semihosting, when a debugger is attached)
   --
   --  The output channel is selected via `pico_xbsp.event_log_output` in your `alire.toml` file.
   -------------------------------------------------------------------------
   procedure Activate_USB_Logging with
      Pre => Pico_Xbsp_Config.Event_Log_Output /= Pico_Xbsp_Config.usb;

   -------------------------------------------------------------------------
   --  Prints the current content of the USB log ring-buffers.
   --
   --  This procedure must be called regularly and manually from your application (for example from the main loop).
   --
   --  Why manual polling is required:
   --
   --  The `usb_embedded` library uses a very sensitive interrupt handler for USB events. To avoid interfering with it,
   --  logging is not performed directly. Instead, log records are stored quickly in compact ring buffers. Formatting
   --  and actual output happen later, when you call `Print_USB_Log`.
   --
   --  This design keeps the interrupt handler fast and minimises the risk of timing issues on the RP2040's USB stack.
   -------------------------------------------------------------------------
   procedure Print_USB_Log;

   -------------------------------------------------------------------------
   --  Sends a single character.
   -------------------------------------------------------------------------
   procedure Put (Text : in Character);

   -------------------------------------------------------------------------
   --  Sends a string (no newline added).
   -------------------------------------------------------------------------
   procedure Put (Text : in String);

   -------------------------------------------------------------------------
   --  Sends a string followed by a newline.
   -------------------------------------------------------------------------
   procedure Put_Line (Text : in String);

   -------------------------------------------------------------------------
   --  Sends a newline.
   -------------------------------------------------------------------------
   procedure New_Line;

   -------------------------------------------------------------------------
   --  Reads one character.
   --
   --  @return Character read (or ASCII.NUL if disabled)
   -------------------------------------------------------------------------
   procedure Get (Text : out Character);

   -------------------------------------------------------------------------
   --  Reads characters into the string. (or all ASCII.NUL if disabled)
   -------------------------------------------------------------------------
   procedure Get (Text : out String);

   -------------------------------------------------------------------------
   --  Reads characters until a newline is received or timeout is reached. (or Last = 0 and all ASCII.NUL if disabled)
   -------------------------------------------------------------------------
   procedure Get_Line (Text : out String; Last : out Natural);

   -------------------------------------------------------------------------
   --  Reads a line with local echo and backspace support. Blocks until newline. (or Last = 0 and all ASCII.NUL if
   --  disabled)
   -------------------------------------------------------------------------
   procedure Read_Line (Text : out String; Last : out Natural);

   -------------------------------------------------------------------------
   --  Sets the timeout for `Put` and `Put_Line`. No-op for `Ada.Text_IO`.
   -------------------------------------------------------------------------
   procedure Set_Write_Timeout (Timeout : Duration := 1.0);

   -------------------------------------------------------------------------
   --  Sets the timeout for `Get`, `Get_Line` and `Read_Line`. No-op for `Ada.Text_IO`. If you expect user input, make
   --  sure to set a sufficiently long timeout.
   -------------------------------------------------------------------------
   procedure Set_Read_Timeout (Timeout : Duration := 10.0);

end Pico.Debug_IO;
--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
