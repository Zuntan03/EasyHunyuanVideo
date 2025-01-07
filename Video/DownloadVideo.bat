@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\EasyTools
set ARIA_CMD=%EASY_TOOLS%\Download\Aria.bat
pushd %~dp0

echo.
echo %CURL_CMD% -O "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/VideoList.txt"
%CURL_CMD% -O "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/VideoList.txt"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

for /f "tokens=*" %%f in (VideoList.txt) do (
	if not exist "%%~nxf" (
		echo.
		echo %ARIA_CMD% .\ "%%f" "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/%%f"
		%ARIA_CMD% .\ "%%f" "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/%%f"
		if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
	)
)
popd
