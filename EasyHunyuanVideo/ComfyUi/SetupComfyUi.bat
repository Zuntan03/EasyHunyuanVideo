@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL_TAG=%EASY_TOOLS%\Git\GitHub_CloneOrPull_Tag.bat
set PYTHON_ACTIVATE=%EASY_TOOLS%\Python\Python_Activate.bat
pushd %~dp0..\..

@REM https://github.com/comfyanonymous/ComfyUI
call %GITHUB_CLONE_OR_PULL_TAG% comfyanonymous ComfyUI master v0.3.10
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0
pushd %~dp0..\..\ComfyUI

call %PYTHON_ACTIVATE%
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq torch==2.5.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
pip install -qq torch==2.5.1+cu124 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo pip install -qq -r requirements.txt
pip install -qq -r requirements.txt
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM bnb_nf4
echo pip install -qq bitsandbytes==0.45.0
pip install -qq bitsandbytes==0.45.0
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM torchao
@REM echo pip install -qq torchao==0.7.0
@REM pip install -qq torchao==0.7.0
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

if not exist models\llm_gguf\ ( mkdir models\llm_gguf )
if not exist models\mmaudio\ ( mkdir models\mmaudio )
if not exist models\ultralytics\ ( mkdir models\ultralytics )

if not exist triton-3.1.0-cp310-cp310-win_amd64.whl (
	setlocal enabledelayedexpansion
	echo.
	echo %CURL_CMD% -O https://github.com/woct0rdho/triton-windows/releases/download/v3.1.0-windows.post5/triton-3.1.0-cp310-cp310-win_amd64.whl
	%CURL_CMD% -O https://github.com/woct0rdho/triton-windows/releases/download/v3.1.0-windows.post5/triton-3.1.0-cp310-cp310-win_amd64.whl
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )

	echo pip install -qq triton-3.1.0-cp310-cp310-win_amd64.whl
	pip install -qq triton-3.1.0-cp310-cp310-win_amd64.whl
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)

if not exist "sageattention-2.0.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl" (
	setlocal enabledelayedexpansion
	echo.
	echo %CURL_CMD% -O https://github.com/sdbds/SageAttention-for-windows/releases/download/2.0.1_20250102/sageattention-2.0.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl
	%CURL_CMD% -O https://github.com/sdbds/SageAttention-for-windows/releases/download/2.0.1_20250102/sageattention-2.0.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )

	echo pip install -qq "sageattention-2.0.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl"
	pip install -qq "sageattention-2.0.1+cu124torch2.5.1-cp310-cp310-win_amd64.whl"
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)

popd rem %~dp0..\..\ComfyUI
