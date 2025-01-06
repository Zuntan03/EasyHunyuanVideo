@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\clip

@REM https://huggingface.co/zer0int/LongCLIP-SAE-ViT-L-14
call %HUGGING_FACE% .\ Long-ViT-L-14-GmP-SAE.safetensors zer0int/LongCLIP-SAE-ViT-L-14 Long-ViT-L-14-GmP-SAE-TE-only.safetensors?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\clip
