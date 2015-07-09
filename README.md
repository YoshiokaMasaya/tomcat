# 管理Docker環境構築手順

## image作成
### ベースイメージ

#### 実行ディレクトリ構成
base
 ├Dockerfile
 └opt/
 
#### ビルドコマンド
```
docker build -t kanri/base:latest .
```

### リリースイメージ

#### 実行ディレクトリ構成
release
 ├Dockerfile
 ├HontoAdmin.war
 └./resources

#### ビルドコマンド
```
docker build -t kanri/release:latest .
```

## コンテナ起動
```
docker run -p 8080:8080 \
           -d --name apkanri \
           -v /usr/lib:/usr/lib \
           -v /usr/lib64:/usr/lib64 \
           -v /var/log/tomcat:/var/log/tomcat \
           -v /nas:/nas \
           kanri/release:latest
```

## その他
起動スクリプトなど管理用に手を加えてるものがあるため、各ファイルの修正点について記載。

| ファイル | 変更点 |
|--------|--------|
|./base/opt/tomcat6_0_35/bin/setenv.sh|必要なクラスパスを追加|
|./base/opt/tomcat6_0_35/lib|参照が必要なjarを配備|
|./base/usr/lib|参照が必要なjarを配備|

