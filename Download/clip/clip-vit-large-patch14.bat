@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat
pushd %~dp0..\..\ComfyUI\models\clip

@REM Kijai のオートダウンローダーが失敗する環境向け
@REM HuggingFace Hub が使えない可能性を考慮して、個別ダウンロード

@REM https://huggingface.co/openai/clip-vit-large-patch14
call %HUGGING_FACE% clip-vit-large-patch14\ config.json openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ merges.txt openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ model.safetensors openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ preprocessor_config.json openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ special_tokens_map.json openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ tokenizer.json openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ tokenizer_config.json openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% clip-vit-large-patch14\ vocab.json openai/clip-vit-large-patch14
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\clip
