@echo off
chcp 65001 > NUL

call %~dp0EasyTools\Git\Git_SetPath.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

echo "動作に必要なモデルなどをダウンロードします。よろしいですか？ [y/n]（空欄なら y）"
echo.
echo "Download Model etc. Are you sure? [y/n] (default: y)"
set /p DOWNLOAD_MDOEL_YES_OR_NO=

pushd %~dp0EasyTools
echo.
echo git pull https://github.com/Zuntan03/EasyTools
git pull
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo git reset --hard origin/main
git reset --hard origin/main
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
popd

pushd %~dp0
echo.
echo git pull https://github.com/Zuntan03/EasyHunyuanVideo
git pull
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo git reset --hard origin/main
git reset --hard origin/main
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
popd

call %~dp0EasyHunyuanVideo\Setup.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if /i "%DOWNLOAD_MDOEL_YES_OR_NO%" == "n" ( exit /b 0 )
call %~dp0Download.bat
