# aozora-mobi

青空文庫のテキストファイルをmobiに変換するコンテナと、それを使った変換用コマンド。

## ビルドとインストール

### 準備

* AozoraEpub3-xxx.zipをダウンロードして、カレントディレクトリに置く。
* kindlegenのLinux版をダウンロードして、カレントディレクトリに置く。
* DockerfileのARGを適宜書き換える。

### コンテナのビルド

```
make build
```

### 変換コマンドのインストール

Makefileの`bindir`をお好みのディレクトリに変更し、以下を実行する。

```
make install
```

## 使い方

青空文庫のテキストファイルをダウンロードして、以下を実行すると
カレントディレクトリに、同じ名前のmobiファイルができる。

```
aozora-mobi <青空文庫のテキストファイル>.zip
```

## LICENCE

Same As Perl.
