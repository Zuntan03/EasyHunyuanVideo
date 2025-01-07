@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat

@REM set GIT_SET_PATH=%EASY_TOOLS%\Git\Git_SetPath.bat
@REM call %GIT_SET_PATH%
@REM if %ERRORLEVEL% neq 0 ( exit /b 1 )

pushd %~dp0..\..\ComfyUI\models\LLM

@REM https://huggingface.co/Kijai/llava-llama-3-8b-text-encoder-tokenizer

@REM git clone --depth=1 https://huggingface.co/Kijai/llava-llama-3-8b-text-encoder-tokenizer
@REM if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ config.json Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ generation_config.json Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ model.safetensors.index.json Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ special_tokens_map.json Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ tokenizer.json Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ tokenizer_config.json Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ model-00001-of-00004.safetensors Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ model-00002-of-00004.safetensors Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ model-00003-of-00004.safetensors Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %HUGGING_FACE% llava-llama-3-8b-text-encoder-tokenizer\ model-00004-of-00004.safetensors Kijai/llava-llama-3-8b-text-encoder-tokenizer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI\models\LLM
