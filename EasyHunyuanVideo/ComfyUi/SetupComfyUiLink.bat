@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set JUNCTION=%EASY_TOOLS%\Link\Junction.bat

pushd %~dp0..\..\ComfyUI

call %JUNCTION% ..\Output output
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% ..\Lora models\loras
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist user\default\workflows\ ( mkdir user\default\workflows )
call %JUNCTION% user\default\workflows\Easy ..\EasyHunyuanVideo\ComfyUi\Workflow
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI
