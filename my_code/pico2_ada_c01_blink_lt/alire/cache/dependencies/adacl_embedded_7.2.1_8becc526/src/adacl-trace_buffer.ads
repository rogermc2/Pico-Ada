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
pragma Profile (Jorvik);
pragma Partition_Elaboration_Policy (Sequential);

with Adacl_Embedded_Config;
with Interfaces;

---
--  @summary
--  AdaCL Embedded Trace
--
--  @description
--
--  AdaCL.Trace provides a lightweight, interrupt-safe tracing facility for embedded applications on the Raspberry Pi.
--
--  Writing directly to I/O devices from within an interrupt handler can cause serious problems. Common issues include
--  race conditions with the runtime system, blocking operations that violate real-time constraints, re-entrancy
--  problems, and in the worst case, system deadlock or corruption of peripheral state.
--
--  To avoid these issues, AdaCL.Trace stores trace messages in a fixed-size ring buffer. Each entry is prefixed with a
--  Log_Event_ID (Unsigned_16) for compatibility with other logging systems such as usb_embedded.
--
--  Messages are later retrieved and output from a non-interrupt context to your chosen output device such as a UART,
--  USB serial console, or Ada.Text_IO.
--
--  AdaCL_Embedded is a sister library to AdaCL. While AdaCL is general-purpose, AdaCL_Embedded focuses on embedded and
--  real-time programming with minimal overhead.
--
--  Configuration is done via `alire.toml`:
--
--  Configuration is done via `alire.toml`:
--
--: * `Event_Log_Buffer_Length` — maximum character length of each trace line (default: 200)
--: * `Event_Log_Buffer_Size`   — number of entries in the ring buffer (default: 0).
--:                             If 0, the trace buffer is deactivated. All operations
--:                             become no-ops and accessors return empty data.
--: * `Variant`                 — `tasking` (uses protected objects) or
--:                               `no_tasking` (for lightweight or restricted runtimes)
--
package AdaCL.Trace_Buffer with
   Spark_Mode     => On,
   Abstract_State => (Ring_Buffer with External => (Async_Writers, Async_Readers))
is
   type ID_Type is new Interfaces.Unsigned_16;

   --  A single trace line using the configured maximum length.
   subtype Text_Type is String (1 .. Adacl_Embedded_Config.Event_Log_Buffer_Length);

   --  Append a new trace line to the ring buffer.
   --
   --  Safe to call from interrupt handlers when using the no_tasking variant.
   procedure Put_Line (Str : in String) with
      Global => (In_Out => Ring_Buffer),
      Pre => Str'Length <= Adacl_Embedded_Config.Event_Log_Buffer_Length;

   --  Retrieve the next trace line from the ring buffer.
   --
   --  @return an empty string when the buffer is empty. The returned string is always bounded by the configured length
   --  plus space for the ID and separators.
   procedure Get_Line (Text : out Text_Type; ID : out ID_Type) with
      Global => (In_Out => Ring_Buffer);

   --  Returns True if at least one trace line is available.
   function Has_Line return Boolean with Global => (Input => Ring_Buffer), Inline, Volatile_Function;

   --  Returns the current number of pending trace lines.
   function Pending_Lines return Natural with Global => (Input => Ring_Buffer), Inline, Volatile_Function;

private

   --  Each stored entry carries a unique ID (for debugging) and the text.
   type Log_Event is record
      ID   : ID_Type   := ID_Type'First;
      Text : Text_Type := [others => ' '];
   end record;

   --  Bring the buffer into it's initial state. Used in unit tests.
   procedure Reset with
      Global => (In_Out => Ring_Buffer);

end AdaCL.Trace_Buffer;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
