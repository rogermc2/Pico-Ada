echo === Initialize Debugger =====\n
target extended-remote localhost:3333
monitor reset halt
echo === Load the programm =======\n
load
echo === Detach from thread 1 ====\n
thread 1
detach
echo === quit debugger ===========\n
quit
