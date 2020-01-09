# AWS Lambdaでpandas / numpyを使うテンプレート

- macOS 10.13 ~ 10.15^
- Python 3.7.3 (with pyenv)
- Docker

## AWS Lambdaでpandas / numpyを使う

`Unable to import module 'main': Missing required dependencies ['numpy']`

とか言われるケース。

macOSで構築されるpipのライブラリリソースと、

Lambda（Amazon Linux）で構築されるライブラリリソースが違うので

結果としてnumpyを呼び出せない現象が起こる :cry:

解決策として

- Amazon Linuxでpip installする
- AWS LambdaのLayersを使う

という2つの方法がある

でもLayersにするとパッケージアップデートの時に毎回上げ直すのつらい

### Dockerでビルドさせたら良さそう

`lambci/lambda` を使って、AWS Lambdaの実行環境でビルドして圧縮する

## 使い方

適当に `lambda_function.py` を書いて、依存関係も `requirements.txt` 追加しておく

あとは `Docker-build.sh` を叩くと適当にビルドされてzipになったになったやつが出てくる
