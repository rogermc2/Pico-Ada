---
title       : "Side Quest: Debugger"
description : "Setting up a reliable debug environment for the Raspberry Pi Pico and Pico 2 with Ada."
summary     : "From UART logging and OpenOCD to GDB scripts and Visual Studio Code — everything I needed (and the battles I fought) to make debugging work on macOS."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-23T19:28:11+0200
date        : 2026-04-23T19:28:11+0200
draft       : false
type        : "page"
layout      : "single"
categories  : ["hardware", "side-quest", "pico-2w", "pico", "float"]
tags        : ["alire"]
---

## Hardware

I'm using the official **Raspberry Pi Debug Probe**, which comes with all the necessary cables — a real time-saver.

[![Raspberry Pi Pico Probe](20260421_185012.jpeg?fit=640x640 "Raspberry Pi Debug Probe")](20260421_185012.jpeg)

Neither of my Picos had the debug connector fitted, so I soldered three-pin headers to both boards. The Debug Probe
includes an extra cable for this setup. A little insulation tape keeps the connectors secure and makes plugging and
unplugging easy.

[![Raspberry Pi Pico with Probe attached](20260421_175147.jpeg?fit=640x640 "Raspberry Pi Pico with Probe attached")](20260421_175147.jpeg)
[![Raspberry Pi Pico 2 with Probe attached](20260421_185021.jpeg?fit=640x640 "Raspberry Pi Pico 2 with Probe attached")](20260421_185021.jpeg)

Afterwards I updated the probe firmware to the newest version using my handy script:

[Debug_Update.command](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/Debug_Update.command)

Next I verified that the Debug Probe appears under macOS. The tricky part was that only the **UART** device showed up
initially; the actual debug bridge only becomes visible once **OpenOCD** is running. I created [a small helper
script](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/Debug_Search_Devices.command) to
confirm the probe is present:

```zsh
#!/usr/bin/env zsh

system_profiler SPUSBDataType 2>/dev/null | ggrep --after-context=11 "Debug Probe (CMSIS-DAP)"
```

Expected output looks like this (serial number will differ):

```console
> Utilities/Debug_Search_Devices.command
              Speed: Up to 12 Mb/s
              Manufacturer: Raspberry Pi
              Location ID: 0x14420000 / 51
              Current Available (mA): 500
              Current Required (mA): 100
              Extra Operating Current (mA): 0
```

## UART Logging

I have always preferred log files, especially in multitasking or interrupt-driven code. Logs show the exact order of
execution — something a classic debugger often struggles with. Logging is also far easier to set up than a full debug
bridge; all you need is a serial terminal.

The annoying bit is that the device name changes depending on which USB port you use. I wrote two small **zsh**
functions to make detection reliable on macOS.

### `debug-get-uart-port`

This function extracts the correct port name for **CoolTerm**:

```zsh
function debug-get-uart-port ()
{
    local Location_ID
    local Probe_Info
    local TTY_Suffix
    local UART_Port
    local UART_Device

    # Step 1: Find the Debug Probe in system_profiler
    #
    Probe_Info=$(system_profiler SPUSBDataType 2>/dev/null |			    \
	awk '/Debug Probe/{flag=1; next} flag && /Location ID:/{print; flag=0}' |   \
	head -n 1)

    if [[ -z "${Probe_Info}" ]]; then
	print -u2 "❌ No Raspberry Pi Debug Probe found. Is it plugged in?"
	print -u2 "   (Run: system_profiler SPUSBDataType | grep -A 20 'Debug Probe')"
	exit 1
    fi

    # Step 2: Extract Location ID (e.g. 0x14420000)
    #
    Location_ID=$(echo "${Probe_Info}" | ggrep -oE '0x[0-9A-Fa-f]+' | head -n 1)

    if [[ -z "${Location_ID}" ]]; then
	print -u2 "❌ Could not parse Location ID"
	exit 1
    fi

    # Step 3: Convert to tty name (remove 0x and trailing zeros)
    #
    TTY_Suffix=$(echo "${Location_ID#0x}" | tr '[:upper:]' '[:lower:]' | sed 's/0*$//')
    UART_Port="usbmodem${TTY_Suffix}02"

    print "${UART_Port}"
}
```

### `debug-get-uart-device`

Builds the full `/dev/tty.…` path and verifies it exists (for `screen` etc.).

```zsh
function debug-get-uart-device ()
{
    local UART_Port=$(debug-get-uart-port)
    local UART_Device="/dev/tty.${UART_Port}"

    # Step 4: Verify it exists
    #
    if [[ ! -c "${UART_Device}" ]]; then
	print -u2 "❌ Device ${UART_Device} does not exist (yet?)."
	print -u2 "   Available USB serial devices:"
	ls -1 /dev/tty.usb* >&2 || print -u2 "   (none found)"
	exit 1
    fi

    print "${UART_Device}"
}
```

### Minimalist option: `screen`

If you like to keep things minimal, macOS’s built-in `screen` works. Here’s my launcher script:
[Debug_Start_Screen.command](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/Debug_Start_Screen.command).
Note that I struggled a lot with the CR/LF handling and never work as desired. If you have a tip drop me a message.

```zsh
#!/usr/bin/env zsh

typeset -f -u debug-get-uart-device
typeset -f -u debug-get-uart-port

typeset Baud_Rate=115200
typeset UART_Device=$(debug-get-uart-device)

print "=== screen Launcher for Raspberry Pi Debug Probe (UART) ==="
print 
print "✅ UART device ready: ${UART_Device} @ ${Baud_Rate} baud"
print 
print "Stop with Ctrl-A K Y"

screen  ${UART_Device} ${Baud_Rate},cs8,-istrip,inlcr,onlcr 
```

### Recommended: CoolTerm

For a proper GUI experience I strongly recommend **CoolTerm** (`brew install coolterm`). It handles line endings
correctly and can automatically capture output.

My launcher script sets up a settings file on the fly and saves captures to `${PROJECT_HOME}/Temp`:

[Debug_Start_Cool_Term.command](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/Debug_Start_Cool_Term.command)

**Tip**: The script uses `ex` (vi/ex) to edit the `.CoolTermSettings` file safely. After running it, just click “Connect” in CoolTerm.

{Insert picture of CoolTerm in action here}

### Using `pragma Debug` in Ada

I use GNAT’s `pragma Debug` so the log statements disappear in release builds. I log entry and exit of every subprogram
— a habit I picked up from IBM’s Open Class Library years ago.

Example:

```ada
function Delay_Time (LED : in LED_Number) return Ada.Real_Time.Time_Span
with Inline, Pure_Function
is
   pragma Debug (Pico.UART_IO.Put_Line ("+ Delay_Time (LED => " & LED'Image & ")"));

   Position : constant Float := Float (LED - LED_Number'First) /
                                Float (LED_Number'Last - LED_Number'First);
   Phase    : constant Float := Position * Num.Pi;                -- 0 → π
   Factor   : constant Float := (1.0 - Math.Sin (Phase)) / 2.0;   -- 0 … 1.0
   Retval   : constant RT.Time_Span := RT.To_Time_Span (Duration (Base_Delay + Amplitude * Factor));
begin
   pragma Debug (Pico.UART_IO.Put_Line ("- Delay_Time (Retval => " & Retval'Image & ")"));
   return Retval;
end Delay_Time;
```

This keeps the release binary small while giving excellent trace information during development.

## OpenOCD

Every tutorial seemed to say “just install OpenOCD, GDB, picotool, libusb, udev rules, and sacrifice a small goat”. It
rarely “just worked”. So I focused first on making sure the probe was actually detected.

I wrote
[Debug_Start_OCD.command](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/Debug_Start_OCD.command)
which asks whether you want Pico 1 or Pico 2 and starts OpenOCD with sensible defaults (5000 kHz SWD speed works
reliably for me).

**Important**: Homebrew and MacPorts versions lacked full Pico 2 (RP2350) support at the time of writing. I ended up
compiling the official Raspberry Pi fork from source — and of course created
[Debug_Build_OCD.command](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/Debug_Build_OCD.command)
to automate it (including a neat root-escalation trick).

**Note**: You must stop and restart OpenOCD when switching between Pico 1 and Pico 2 (and usually unplug/replug the
cable anyway).

## arm-none-eabi-gdb

GDB remains my arch-nemesis. After fighting various toolchains I settled on the MacPorts version built with
`macports-clang-22` (see
[MacPorts_Install.command](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/Utilities/MacPorts_Install.command)).

### Interactive use

Interactive GDB in **Terminal.app** (and iTerm2/xterm) tends to mess up terminal settings badly. After it exits, run
`stty sane` to restore sanity. Because of this I gave up on fully interactive sessions.

### Scripted use (the way that actually works)

I now drive everything from **GNUmakefile** using a small GDB script and an Expect script to reset the target via
OpenOCD’s telnet interface.

**GNUmakefile** excerpt:

```make
start_${1}: bin/development/${1}
	${port}/bin/arm-none-eabi-gdb -batch -nx --command="start.gdb" bin/development/${1}
	start.expect
```

**start.gdb**:

```gdb
echo === Initialize Debugger =====\n
target extended-remote localhost:3333
monitor reset halt
echo === Load the programme =======\n
load
echo === Detach from thread 1 ====\n
thread 1
detach
echo === Quit debugger ===========\n
quit
```

**start.expect** (resets the Pico cleanly):

```expect
#!/usr/bin/expect -f
set timeout 5
spawn telnet localhost 4444
expect "Open On-Chip Debugger"
send "reset run\r"
expect ">"
send "exit\r"
expect eof
```

This combination lets me do `gmake start_sketch_01_1_blink` without manually resetting the board or fighting USB
detachment messages.

## Visual Studio Code

With GNAT Studio no longer maintained on macOS, I turned to **VS Code**. It works surprisingly well once the
configuration files are in place.

### Required Extensions

- **vscodevim.vim** — Vim emulation (essential for me)
- **adacore.ada** — Ada & SPARK support
- **raspberry-pi.raspberry-pi-pico** — Official Pico extension
- **marus25.cortex-debug** — Cortex-M debugging

### Workspace file (recommended)

Open the whole project with one click:

```zsh
"${VSCODE_ROOT}/Contents/MacOS/Code" ${Project_Name}.code-workspace
```

Key settings in the workspace:

```json
"cortex-debug.armToolchainPath.osx": "${env:port}/bin",
"cortex-debug.gdbPath.osx": "${env:port}/bin/arm-none-eabi-gdb",
"cortex-debug.openocdPath.osx": "${env:OPENOCD_ROOT}/bin/openocd",
```

Check the
[pico_ada_c01_blink.code-workspace](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/pico_ada_c01_blink/pico_ada_c01_blink.code-workspace)
for an complete example.

### `.vscode/settings.json`

Since everything is configures in the workspace all that is left is setting the config file.

```json
{
  "ada.projectFile": "pico_ada_c01_blink.gpr"
}
```

### `.vscode/launch.json`

One configuration per main procedure (Pico 1 and Pico 2 need separate crates anyway because of different runtimes).

```json
{
  "version": "0.2.0",
  "configurations": [
…
    {
      "name": "Ada Pico — Debug sketch_01_1_blink",
      "cwd": "${workspaceFolder}",
      "executable": "${workspaceFolder}/bin/development/sketch_01_1_blink",
      "request": "launch",
      "type": "cortex-debug",
      "servertype": "openocd",
      "device": "RP2040",          // or "RP2350" for Pico 2
      "configFiles": [
          "interface/cmsis-dap.cfg",
          "target/rp2040.cfg"      // or rp2350.cfg
      ],
      "preLaunchTask": "Ada Build sketch_01_1_blink",
      "runToEntryPoint": "main"
    },
…
  ]
}
```

### `.vscode/tasks.json`

The matching build task using Alire:

```json
{
  "version": "2.0.0",
  "tasks": [
…
    {
      "label": "Ada Build sketch_01_1_blink",
      "type": "ada",
      "command": "alr",
      "args": ["build", "--development", "src/sketch_01_1_blink.adb"],
      "group": { "kind": "build" }
    },
  ]
…
}
```

Make sure the `label` exactly matches the `preLaunchTask`.

## Final Thoughts

With all these pieces in place, GDB finally behaves itself and I have already caught an off-by-one error I would have
missed otherwise. Who knows — after all these years GDB and I might yet become friends.

{{< instagram DXe3-VbjexI >}}
{{< instagram DXe4almE_br >}}

I still prefer UART logging for high-level flow, but the full debugger is now there when I need to step through tricky
timing or register issues.

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : --
