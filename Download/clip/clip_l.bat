@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\clip

@REM https://huggingface.co/Comfy-Org/HunyuanVideo_repackaged
call %HUGGING_FACE% .\ clip_l.safetensors Comfy-Org/HunyuanVideo_repackaged split_files/text_encoders/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\clip
