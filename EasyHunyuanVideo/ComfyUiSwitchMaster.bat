@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools
set GIT_SET_PATH=%EASY_TOOLS%\Git\Git_SetPath.bat

call %GIT_SET_PATH%
if %ERRORLEVEL% neq 0 ( exit /b 1 )

pushd %~dp0..\ComfyUI

@REM master ブランチへの切り替え
git switch -C master origin/master
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\ComfyUI
