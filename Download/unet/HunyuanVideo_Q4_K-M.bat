@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\unet

@REM https://huggingface.co/city96/HunyuanVideo-gguf
call %HUGGING_FACE% .\ HunyuanVideo_Q4_K-M.gguf city96/HunyuanVideo-gguf hunyuan-video-t2v-720p-Q4_K_M.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\unet
