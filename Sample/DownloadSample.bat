@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\EasyTools
set ARIA_CMD=%EASY_TOOLS%\Download\Aria.bat
pushd %~dp0

echo.
echo %CURL_CMD% -O "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/SampleList.txt"
%CURL_CMD% -O "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/SampleList.txt&ver=0"
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

for /f "tokens=*" %%f in (SampleList.txt) do (
	if not exist "%%~nxf" (
		echo.
		echo %ARIA_CMD% .\ "%%f" "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/%%f"
		%ARIA_CMD% .\ "%%f" "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/%%f"
		if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
	)
	if not exist "%%~nf.mp4" (
		echo.
		echo %ARIA_CMD% .\ "%%~nf.mp4" "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/%%~nf.mp4"
		%ARIA_CMD% .\ "%%~nf.mp4" "https://yyy.wpx.jp/EasyHunyuanVideo/Sample/%%~nf.mp4"
		if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
	) 
)
popd
