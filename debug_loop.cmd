@echo off
setlocal

Windbgx -o cmd.exe /c "%~dp0\scripts\debug_loop_inner.cmd %*"
