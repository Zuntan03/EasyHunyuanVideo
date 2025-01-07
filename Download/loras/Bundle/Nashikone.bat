@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE_HUB=%EASY_TOOLS%\Download\HuggingFaceHub.bat
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set JUNCTION=%EASY_TOOLS%\Link\Junction.bat

pushd %~dp0

echo.
echo https://huggingface.co/nashikone/iroiroLoRA
echo call %HUGGING_FACE_HUB% %~n0\ nashikone/iroiroLoRA model hunyuan_video_720_cfgdistill_fp8_e4m3fn/**
call %HUGGING_FACE_HUB% %~n0\ nashikone/iroiroLoRA model hunyuan_video_720_cfgdistill_fp8_e4m3fn/**
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo %CURL_CMD% -o Nashikone\hunyuan_video_720_cfgdistill_fp8_e4m3fn\NashikoneReadme.txt https://huggingface.co/nashikone/iroiroLoRA/resolve/main/hunyuan_video_720_cfgdistill_fp8_e4m3fn_LoRAReadme.txt
%CURL_CMD% -o Nashikone\hunyuan_video_720_cfgdistill_fp8_e4m3fn\NashikoneReadme.txt https://huggingface.co/nashikone/iroiroLoRA/resolve/main/hunyuan_video_720_cfgdistill_fp8_e4m3fn_LoRAReadme.txt

echo call %JUNCTION% %~dp0..\..\..\ComfyUI\models\loras\Nashikone .\%~n0\hunyuan_video_720_cfgdistill_fp8_e4m3fn
call %JUNCTION% %~dp0..\..\..\ComfyUI\models\loras\Nashikone .\%~n0\hunyuan_video_720_cfgdistill_fp8_e4m3fn
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0
