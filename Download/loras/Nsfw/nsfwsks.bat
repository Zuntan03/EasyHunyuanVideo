@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\loras

@REM https://huggingface.co/TheYuriLover/HunyuanVideo_nfsw_lora
call %HUGGING_FACE% Nsfw\ nsfwsks.safetensors TheYuriLover/HunyuanVideo_nfsw_lora nsfw-e7.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\loras
