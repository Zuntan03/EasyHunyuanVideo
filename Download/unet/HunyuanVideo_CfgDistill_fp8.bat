@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\unet

@REM https://huggingface.co/Kijai/HunyuanVideo_comfy
call %HUGGING_FACE% .\ HunyuanVideo_CfgDistill_fp8.safetensors Kijai/HunyuanVideo_comfy hunyuan_video_720_cfgdistill_fp8_e4m3fn.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\unet
