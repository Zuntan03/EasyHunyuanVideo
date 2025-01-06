@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\llm_gguf

@REM https://huggingface.co/mmnga/Vecteus-v1-gguf
call %HUGGING_FACE% .\ Vecteus-v1-Q4_K_M.gguf mmnga/Vecteus-v1-gguf
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\llm_gguf
