@echo off
setlocal

ruby %~dp0\scripts\build.rb --rc=release %*