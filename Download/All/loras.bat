@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set RECURSIVE_BAT_CALL=%EASY_TOOLS%\Bat\RecursiveBatCall.bat

call "%RECURSIVE_BAT_CALL%" "%~dp0..\loras"
for /d %%d in ("%~dp0..\loras\*") do ( call "%RECURSIVE_BAT_CALL%" %%d )
