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

---
--  @summary
--  Simple USB output (and input) helper for quick debugging on the Raspberry Pi Pico.
--
--  @description
--  This package configures USB serial at 115200 baud, 8N1
--:
package Pico.USB_IO is
   ---
   --  Raised on any USB initialisation or communication error.
   Initialisation_Error : exception;
   Timeout_Error        : exception;

   ---
   --  Initialises USB serial. Safe to call more than once.
   --: @exception Initialisation_Error count not initialise USB serial together with the USB stack.
   procedure Initialise;

   ---
   --  Sends a single character.
   --
   --: @exception Timeout_Error write timeout exceeded.
   procedure Put (Text : in Character);

   ---
   --  Sends a string (no newline added).
   --
   --: @param Text The string to send.
   --: @exception Timeout_Error write timeout exceeded.
   procedure Put (Text : in String);

   ---
   --  Sends a string followed by a newline.
   --
   --: @param Text The string to send.
   --: @exception Timeout_Error write timeout exceeded.
   procedure Put_Line (Text : in String);

   ---
   --  Sends a new line.
   --
   --: @param Text The string to send.
   --: @exception Timeout_Error write timeout exceeded.
   procedure New_Line;

   ---
   --  Reads one character. Raises Timeout_Error on timeout or hardware error.
   --
   --  USB serial has an internal read buffer. If a character is available in the buffer then it is returned
   --  immediately. If no character is available then Get will wait until a character is received or the timeout
   --  is exceeded. The timeout is set with Set_Read_Timeout and defaults to 10 seconds.
   --
   --: @return Character read
   --: @exception Timeout_Error read timmeout exceeded.
   procedure Get (Text : out Character);

   ---
   --  Reads characters into the string. String might be shorter on timeout. Last is the last received character.
   --
   --: @param Text The string received.
   --: @exception Timeout_Error read timmeout exceeded.
   procedure Get (Text : out String);

   ---
   --  Reads characters until a newline is received or timeout is reached. Last is the last received character.
   --
   --: @param Text The string received.
   --: @exception Timeout_Error read timmeout exceeded.
   procedure Get_Line (Text : out String; Last : out Natural);

   ---
   --  Reads a line with local echo and backspace support. Blocks until newline. The string is space-padded to
   --  Text'Length.
   --
   --  Note: Read_Line has no timeout. It will block until a newline is received. Use Get_Line for a timeout.
   --
   --: @param Text The string received.
   procedure Read_Line (Text : out String; Last : out Natural);

   ---
   --  Sets the timeout for Put and Put_Line. If the timeout is exceeded then Timeout_Error is raised. Default timeout
   --  is 1 seconds with a retry every 0.001 seconds.
   --
   --: @param Timeout The total timeout duration.
   --: @param Retries The number of attempts before giving up. Default is 1_000.
   procedure Set_Write_Timeout (Timeout : Duration := 1.0; Retries : Positive := 1_000);

   ---
   --  Sets the timeout for Get and Get_Line and Read_Line. in between. If the timeout is exceeded then Timeout_Error
   --  is raised. Default timeout is 10 seconds with a retry every 0.001 seconds.
   --
   --: @param Timeout The total timeout duration.
   --: @param Retries The number of attempts before giving up. Default is 10_000 for more responsiveness.
   procedure Set_Read_Timeout (Timeout : Duration := 10.0; Retries : Positive := 10_000);

end Pico.USB_IO;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
