@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\EasyTools
set HUGGING_FACE=%EASY_TOOLS%\Download\HuggingFace.bat

pushd %~dp0..\ComfyUI\models\text_encoders

@REM https://huggingface.co/comfyanonymous/cosmos_1.0_text_encoder_and_VAE_ComfyUI
call %HUGGING_FACE% Cosmos\ oldt5_xxl_fp8_e4m3fn_scaled.safetensors comfyanonymous/cosmos_1.0_text_encoder_and_VAE_ComfyUI text_encoders/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\ComfyUI\models\text_encoders
pushd %~dp0..\ComfyUI\models\vae

@REM https://huggingface.co/comfyanonymous/cosmos_1.0_text_encoder_and_VAE_ComfyUI
call %HUGGING_FACE% Cosmos\ cosmos_cv8x8x8_1.0.safetensors comfyanonymous/cosmos_1.0_text_encoder_and_VAE_ComfyUI vae/
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\ComfyUI\models\vae
pushd %~dp0..\ComfyUI\models\diffusion_models

@REM https://huggingface.co/mcmonkey/cosmos-1.0
call %HUGGING_FACE% Cosmos\ Cosmos-1_0-Diffusion-7B-Text2World.safetensors mcmonkey/cosmos-1.0
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://huggingface.co/mcmonkey/cosmos-1.0
call %HUGGING_FACE% Cosmos\ Cosmos-1_0-Diffusion-7B-Video2World.safetensors mcmonkey/cosmos-1.0
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\ComfyUI\models\diffusion_models
