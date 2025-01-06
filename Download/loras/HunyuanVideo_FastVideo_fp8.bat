@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\loras

@REM https://huggingface.co/Kijai/HunyuanVideo_comfy
call %HUGGING_FACE% .\ HunyuanVideo_FastVideo_fp8.safetensors Kijai/HunyuanVideo_comfy hyvideo_FastVideo_LoRA-fp8.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\loras
