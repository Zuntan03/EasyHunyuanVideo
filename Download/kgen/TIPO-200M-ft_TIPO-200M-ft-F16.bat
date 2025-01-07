@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\kgen

@REM https://huggingface.co/KBlueLeaf/TIPO-200M-ft
call %HUGGING_FACE% .\ TIPO-200M-ft_TIPO-200M-ft-F16.gguf KBlueLeaf/TIPO-200M-ft TIPO-200M-ft-F16.gguf?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\kgen
