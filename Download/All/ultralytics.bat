@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set RECURSIVE_BAT_CALL=%EASY_TOOLS%\Bat\RecursiveBatCall_NoErrorCheck.bat

for /d %%d in ("%~dp0..\ultralytics\*") do ( call "%RECURSIVE_BAT_CALL%" %%d )
