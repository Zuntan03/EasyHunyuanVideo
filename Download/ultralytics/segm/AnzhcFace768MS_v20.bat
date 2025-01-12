@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\..\ComfyUI\models\ultralytics

@REM https://huggingface.co/Anzhc/Anzhcs_YOLOs
call %HUGGING_FACE% segm\ AnzhcFace768MS_v20.pt Anzhc/Anzhcs_YOLOs Anzhc%%%%%%%%20Face%%%%%%%%20seg%%%%%%%%20768MS%%%%%%%%20v2%%%%%%%%20y8n.pt?
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\ComfyUI\models\ultralytics
