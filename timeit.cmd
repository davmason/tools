@echo off
setlocal

powershell.exe -Command "Measure-Command { cmd.exe /c %* | Out-Default }"