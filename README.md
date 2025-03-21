﻿# EasyHunyuanVideo

**公開したてで細々とした調整や不具合修正をしています。**  
**`Update.bat` で問題が解決したり、このREADMEに重要なことが追記されたりしますので、ご注意ください。**

[Hunyuan Video](https://aivideo.hunyuan.tencent.com/) を簡単に試せる環境です。

- 簡単インストールで [Kijai 版](https://github.com/kijai/ComfyUI-HunyuanVideoWrapper) や [Native 版](https://comfyanonymous.github.io/ComfyUI_examples/hunyuan_video/) のモデルや LoRA も一式ダウンロード
- [SageAttention](https://github.com/thu-ml/SageAttention), [FastVideo](https://github.com/hao-ai-lab/FastVideo), TeaChache の併用で Geforce RTX 3060 でも高速・省 VRAM 生成
- 日本語プロンプトや LLM・TIPO プロンプト拡張に対応
- アップスケール、フレーム補間、自動・手動モザイクに対応
- MMAudio による音声生成に対応

動作確認環境: NVIDIA Geforce 3060 12GB 搭載の Windows PC (RAM 64GB, ストレージ 100GB 程度)

## インストール

1. [EasyHunyuanVideoInstaller.bat](https://github.com/Zuntan03/EasyHunyuanVideo/raw/main/EasyHunyuanVideo/EasyHunyuanVideoInstaller.bat?ver=0) を右クリックから保存します。
2. インストール先の空フォルダを `C:/EasyHunyuan/` などの浅いパスに用意して、ここに `EasyHunyuanVideoInstaller.bat` を移動して実行します。
	- **`WindowsによってPCが保護されました` と表示されたら、`詳細表示` から `実行` します。**
3. インストール先の `EasyHunyuanVideo/vs_BuildTools.exe` を実行して、Microsoft の [Visual Studio Build Tools](https://learn.microsoft.com/ja-jp/visualstudio/install/use-command-line-parameters-to-install-visual-studio) の **`C++ によるデスクトップ開発` をインストールします。**  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/VsBuildTools_Cpp.png)
1. `EasyHunyuanVideo/cuda_12.6.3_windows_network.exe` を実行して、NVIDIA の [CUDA Toolkit](https://developer.nvidia.com/cuda-downloads?target_os=Windows&target_arch=x86_64&target_version=11&target_type=exe_network) をインストールします。
	- CUDA Toolkit に対応したドライバや Geforce Experience も同時にインストールされます。  
	Geforce Experience が不要な場合は、`インストールオプション` の `カスタム` から変更します。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/CudaToolkit.webp)
1. `Download.bat` を実行して、モデルや LoRA をダウンロードします。
	- **ダウンロードには Civitai の API Key が必要です。**  
**[Civitai](https://civitai.com) にログインして [アカウント設定](https://civitai.com/user/account) から API Key をコピー＆ペーストしてください。**

**`ComfyUi.bat` で EasyHunyuanVideo が起動し、`Update.bat` で更新できます。**  

### インストールのトラブルシューティング

- アバストなどの Windows Defender でないセキュリティソフトが有効だと、インストールに失敗する場合があります。
- Windows PC の管理者権限がないと、インストールに失敗する場合があります。
- ダウンロード中にエラーが発生する場合は、`EasyTools/Download/Aria_UseCurl.bat` を実行してから再インストールします。
	- または、PC の管理者権限で `EasyTools/EnableLongPaths.bat` を実行してから再インストールします。
- VPN を利用していると、インストールに失敗する場合があります。
- プロキシ環境でインストールに失敗する場合は、[Git for Windows](https://gitforwindows.org/) と [Python 3.10.x](https://www.python.org/ftp/python/3.10.6/python-3.10.6-amd64.exe) に [パスを通してから](https://github.com/Zuntan03/SdWebUiTutorial/blob/main/_/doc/SdWebUiInstall/SdWebUiInstall.md#git-for-windows-%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) 再インストールします。

## チュートリアル

**チュートリアルは高速な [Kijai 版](https://github.com/kijai/ComfyUI-HunyuanVideoWrapper) で解説していますが、Kijai 版は動作環境がシビアです。**  
動作しない場合は以下を試してみてください。

- `HunyuanVideo Model Loader` の `attention_mode` を `spda` にする。  
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/KijaiSpda.png)
- ComfyUI ネイティブ版の `Easy/20_HunyuanVideo_Native` を利用する。
![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/NativeWorkflow.png)
	- [Geforce GTX 1660 Ti (VRAM 6GB, RAM 16GB) でも一応動作しました。](https://yyy.wpx.jp/EasyHunyuanVideo/202501/GeforceGTX1660Ti.mp4)

### 動画の生成

1. `ComfyUi.bat` を実行するとブラウザで [ComfyUI](https://www.comfy.org/) が起動します。
2. インストール先の `Sample/` から好みの `*.png` 画像を選んで、ComfyUI にドラッグ＆ドロップします。
3. `実行` で動画の生成を開始します。**初回はモデルの追加ダウンロードで時間が掛かります。**
	- プロンプト入力欄左側の `Seed` ノードで `Randomize Each Time` すると、バリエーションを生成できます。
4. 生成した動画は `Output/` にあります。
	- `*.mp4` は通常の動画で、`*.webp` は加工用の劣化しない動画（ただし大きくて重い）です。`*.png` はワークフロー保存用の画像です。
5. 気に入った動画が生成できたら、左側ツールバーの `📂` から `Easy/40_Upscale.json` ワークフローを開きます。
	- `画像を読み込む` で `*.webp` をドラッグ＆ドロップなどで読み込んで実行するとアップスケールします。
6. 同様に `Easy/50_Refine_NoobE` で、img2img で書き加えた `*.webp` 動画を生成します。
	- フレーム間のちらつきは `Tile ControlNet` の `強度` を上げたり、`Kサンプラー` の `ノイズ除去` を下げたりして抑え、フレーム補間でも滑らかにします。
7. 同様に `Easy/60_Detail_NoobE` で、顔などを拡大して img2img で書き加えた `*.webp` 動画を生成します。
	- フレーム間のちらつきは `Tile ControlNet` の `強度` を上げたり、`Kサンプラー` の `ノイズ除去` を下げたりして抑え、フレーム補間でも滑らかにします。
8. 同様に `Easy/70_Interpolate` で、フレーム補間によって滑らかにした `*.mp4` 動画を生成します。
9.  最後に `Easy/80_MMAudio` で滑らかにした `*.mp4` を読み込んで音声を生成します。
	- `Seed` 違いの生成や、プロンプトの工夫で当たり音声を引いてください。

**`Easy/` 以下のワークフローは更新 (`Update.bat`) で最新状態になります。**  
**編集したワークフローを残したい場合は別名で保存してください。**

### VRAM 不足 (CudaOutOfMemory) 対策

- VRAM 不足のエラーの後に、そのまま再度 `実行` すると正常に動作する場合があります。
- 上部メニューの `Manager` の右にある `Unload Models` した後に `実行` すると正常に動作する場合があります。
- `HunyuanVideo Sampler` ノードで `width`, `height`(384 x 512など), `num_frames`（73 や 97 など） を下げます。  
	`width` や `height` を下げた場合は `flow_shift` も下げたほうがよいかもしれません。
- `HunyuanVideo Decode` ノードで止まる場合は、`spatial_tile_sample_min_size` を `128` にします。
- `Easy/20_HunyuanVideo_Native` ワークフローを使用すると、生成は遅くなりますが低 VRAM や低 RAM でも生成できる場合があります。
	- [Geforce GTX 1660 Ti (VRAM 6GB, RAM 16GB) でも一応動作しました。](https://yyy.wpx.jp/EasyHunyuanVideo/202501/GeforceGTX1660Ti.mp4)

### `Easy/10_HunyuanVideo_Kijai` ワークフロー

- プロンプト入力欄左の `ControlPanel` でいろいろな機能の有効無効を切り替えられます。
- 通常のプロンプト入力欄である `Prompt` では、`Dynamic Prompt` を使用できます。
	- `TIPO` を有効にすると、少量のプロンプトからプロンプトのバリエーションを生成できます。
- LoRA は `ControlPanel` で LoRA 1-5 を有効にして、LoRA を選択してトリガーワードを指定します。
	- 左にある通常の LoRA 読み込みノードで LoRA を選択し、右クリックから `View Lora Info...` でトリガーワードや Civitai ページを確認できます。  
	**[Civitai の LoRA 作者のプロンプト](https://civitai.com/search/models?baseModel=Hunyuan%20Video&sortBy=models_v9%3AcreatedAt%3Adesc)をぜひ参考にしてください（画像生成よりプロンプトがシビアです）。**  
	![](https://raw.githubusercontent.com/wiki/Zuntan03/EasyHunyuanVideo/Setup/LoraInfo.webp)
	- LoRA の影響が強すぎる場合に、`Get_LbwDoble` と LoRA ノードを繋ぐと影響を軽減できる場合があります。
- `LLM Prompt` では日本語プロンプトを英訳したり、さらにプロンプトの続きを生成したりできます。
- `TranslateJa` を有効にすると、生成用プロンプトの日本語訳を確認できます。
- `Shape Mosaic` では手動で指定した丸や四角のモザイクを、`Segm Mosaic` では自動検出でモザイクをかけられます。
	- `*.webp` のロスレス出力を `30_Mosaic` ワークフローで読み込んで、後からモザイク処理をすることもできます。
		- **`*.webp` をネットで共有する場合は、`ロスレス` を `false` にしてください。**
	- `Upscale`, `Interpolate` も同様に、後から処理できます。
- 動画の解像度や長さなどのパラメータは `HunyuanVideo Sampler` ノードで編集できます。
	- num＿frames は 73（3秒）～ 145 (6秒) ぐらいがオススメです。
	- 解像度や LoRA との相性？で、flow_shift を `6.0` ~ `20.0` ぐらいに変更すると、結果が良くなる場合があります。

## 最近の更新履歴

### 2025/02/24

- [Kijai の HunyuanVideoWrapper](https://github.com/kijai/ComfyUI-HunyuanVideoWrapper) で互換性のない変更があり、過去のワークフローでエラーが発生します。
	- `KeyError: 'context_schedule'` のエラーが出る場合は、`HunyuanVideo Sampler` ノードの `context_options` に繋がっている線を `feta_args` に繋ぎ直して直してください。
	- `10_HunyuanVideo_Kijai` は修正済みですが、`Sample/` 内は未修正です。

### 2025/01/19

- [NVIDIA Cosmos](https://www.nvidia.com/en-us/ai/cosmos/) 対応を追加しました。
	- `Download/Cosmos.bat` で必要なファイルをダウンロードしてから、ワークフローの `Easy/Cosmos_ImageToVideo` や `Easy/Cosmos_TextToVideo` で生成できます。
		- Geforce RTX 3060 で 1280x704 の 121フレーム生成に 45分程度掛かります。
		- リファイン・アップスケール・フレーム補間などは Hunyuan 用のワークフローを流用できます。
	- [Flux example の ImageToVideo 例](https://yyy.wpx.jp/EasyHunyuanVideo/202501/Cosmos.mp4)

### 2025/01/13

- [NoobAI Epsilon Prediction v1.1](https://huggingface.co/Laxhar/noobai-XL-1.1) と [ControlNet Tile](https://huggingface.co/Eugeoter/noob-sdxl-controlnet-tile) で、動画を詳細にする `Easy/50_Refine_NoobE` と `Easy/60_Detail_NoobE` のワークフローを追加しました。
	- フレーム間のちらつきは `Tile ControlNet` の `強度` を上げたり、`Kサンプラー` の `ノイズ除去` を下げたりして抑え、フレーム補間でも滑らかにします。
- サンプルを 4種追加しました。

### 2025/01/11

- Python がインストールされていない環境で、Kijai 版ワークフローが動作しない不具合を修正しました。
- サンプルを 1 種追加しました。
- LoRA を 5 種追加しました。

### 2025/01/09

- `Easy/20_HunyuanVideo_Native` ワークフローに [First Block Cache](https://github.com/TTPlanetPig/Comfyui_TTP_Toolset) のノードを追加しました。
- ComfyUI の起動時に `--use-sage-attention` オプションを追加する `ComfyUi_SageAttention.bat` を追加しました。
- `Easy/` のワークフローで webp 保存のロスレスを無効にしました。
- `ComfyUI/user/default/workflows` へのリンクを `Workflow/` に作成しました。
- [アンインストール](https://github.com/Zuntan03/EasyHunyuanVideo?tab=readme-ov-file#%E3%82%A2%E3%83%B3%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB) について追記しました。

### 2025/01/08

- `Easy/20_HunyuanVideo_Native` ワークフローで [TeaChache](https://github.com/TTPlanetPig/Comfyui_TTP_Toolset) による高速化に対応しました。
	- [手元では生成時間が 75% 程度になっています](https://yyy.wpx.jp/EasyHunyuanVideo/202501/NativeTeaChache.mp4)。
- LoRA を 8 種追加しました。

### 2025/01/07

- EasyHunyuanVideo を公開しました。
- サンプルのダウンロードの不具合を修正しました。
- 各種ノードによる HuggingFace からのダウンロードに失敗する一部環境のために、`Download.bat` でダウンロードするファイルを増やしました。

## アンインストール

- インストール先のフォルダを削除します。
	- 容量の多くをインストール先のフォルダが占めていますので、これでアンインストール完了とするのがオススメです。
- Visual Studio Build Tools と CUDA Toolkit は Windows の `アプリ` - `インストールされているアプリ` からアンインストールできます。
	- ただし、CUDA Toolkit といっしょにインストールされる `NVIDIA グラフィックス ドライバー`、`NVIDIA オーディオ ドライバー`、`PhysX システム ソフトウェア` あたりはアンインストールすると PC が正常に動作しなくなる可能性があります。
	- Visual Studio Build Tools のアンインストールで問題が起こる可能性は低い想定です。

## ライセンス

このリポジトリの内容は [MIT License](./LICENSE.txt) です。  
別途ライセンスファイルがあるフォルダ以下は、そのライセンスです。
