@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\checkpoints

@REM https://huggingface.co/Laxhar/noobai-XL-1.1
call %HUGGING_FACE% NoobE\ NoobE_v11.safetensors Laxhar/noobai-XL-1.1 NoobAI-XL-v1.1.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\checkpoints
