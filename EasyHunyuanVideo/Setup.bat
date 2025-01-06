@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL

call %~dp0ComfyUi\SetupComfyUi.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ComfyUi\SetupComfyUiCustomNodes.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ComfyUi\SetupComfyUiLink.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

pushd %~dp0
setlocal enabledelayedexpansion
if not exist cuda_12.6.3_windows_network.exe (
	echo.
	echo %CURL_CMD% -O https://developer.download.nvidia.com/compute/cuda/12.6.3/network_installers/cuda_12.6.3_windows_network.exe
	%CURL_CMD% -O https://developer.download.nvidia.com/compute/cuda/12.6.3/network_installers/cuda_12.6.3_windows_network.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
)

if not exist vs_BuildTools.exe (
	echo.
	echo %CURL_CMD% -O https://aka.ms/vs/17/release/vs_buildtools.exe
	%CURL_CMD% -O https://aka.ms/vs/17/release/vs_buildtools.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
)
endlocal
popd

@REM setlocal enabledelayedexpansion
@REM if exist %~dp0..\Model\Stable-diffusion\NoobE\ (
@REM 	call %~dp0..\Download\NoobAiEpsilonPred_Minimum.bat
@REM 	if !ERRORLEVEL! neq 0 ( endlocal & exit /b 1 )
@REM )
@REM endlocal
