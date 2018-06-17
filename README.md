# VCCW for WordCamp Tokyo 2018

このリポジトリは[WordCamp Tokyo 2018](https://2018.tokyo.wordcamp.org)のための開発環境[VCCW](http://vccw.cc/)です。

フォークしていますが、本家リポジトリとは独立して管理します。

## インストール方法

このリポジトリをクローンまたはダウンロードします。ディレクトリ内で`vagrant up`コマンドを入力します。vccwの動作要件については[マニュアル](http://vccw.cc/#h2-2)を参照してください。

```
vagrant up
```

動作が終わると、プラグインやサイトの設定がインポートされます。

## テーマのインストール

オリジナルテーマ`wct2018`もインストールできればよかったのですが、できませんでした。したがって、個別にインストールしてください。こちらはGitを利用します。

```
# テーマディレクトリまで移動
cd wordpress/wp-content/themes
# クローンする
git clone git@github.com:wct2018/wct2018.git
# ビルドする
npm install && npm start
```

これでテーマはできたのですが、有効にする必要があるので、次のコマンドを入力してください。

```
# Vagrantの中に移動
vagrant ssh
# テーマを有効化
wp theme activate wct2018
```

## サイトへのアクセス

ローカルサイト`https://wctokyo2018.local`にはadmin/adminでログインすることができます。

## 問題報告

このリポジトリにイシューとして立ててください。担当者として @fumikito を指定していただくと話が早いです。
