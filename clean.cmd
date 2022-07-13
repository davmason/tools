@echo off
setlocal

taskkill /f /im dotnet.exe
git clean -fXd
git clean -fd
