@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\controlnet

@REM https://huggingface.co/Eugeoter/noob-sdxl-controlnet-tile
call %HUGGING_FACE% NoobE\ Tile.safetensors Eugeoter/noob-sdxl-controlnet-tile diffusion_pytorch_model.fp16.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\controlnet
