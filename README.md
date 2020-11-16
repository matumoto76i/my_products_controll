# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# Appname
  my_product_controll

# Production environment
  - AWS,　mysql57,　S3
  - URL　http://18.178.80.130/

# Overview
  - このアプリではアカウント登録を行い、日用品や食料品、防災用品などの画像やテキスト,カテゴリーなどを登録し在庫の管理を行う事が出来ます。
  - 登録したデータは他のユーザーからは見られないようになっています。
  - 登録したデータはユーザーマイページの下部に一覧表示されます。またカテゴリー一覧からもアクセス出来ます。
  - 画面上部の検索窓に登録したデータ(購入した商品の名前)を入力する事でもすぐに確認する事が出来ます。


# Production intention
  - このアプリを作成した背景としては、自身がスーパーなど買い物に行った際に、買い忘れや必要以上に買い過ぎる事があるので、日用品や食料品を手軽に管理できるツールあれば便利ではないかと考え作成しました。

# DEMO
  - 以下実際に管理したい物を登録するgif動画になります。
  ![image](https://user-images.githubusercontent.com/66428722/99243629-4aa2c300-2844-11eb-9477-65330d0ebe43.gif)


# Ingenuity
  - ユーザー目線で考えて、アカウントの作成や機能はシンプルに。
  視覚的にも直感的にも使いやすい機能の実装をする事を考えました。

# Task
  - 今後は消費期限３年以上の食料品において、消費期限までの日数が100日を切った場合にメールやマイページで通知をする機能の実装を出来ればと考えています。

# Development environment
  - エディタ：VScode,　使用言語：Ruby,　Rails,　javascript,　haml,　html,　scss
  db：mysql2,　管理ツール：GitHub,　挙動確認：Google Chrome

# Database creation

# users_table

| column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| name     | string | null: false               |
| email    | string | null: false, unipue: true |
| password | string | null: false               |

## Association

- has_many :items

# items_table
|column|Type|Options|
|------|----|-------|
|name       |string| null: false               |
|remarks    |text|
|shop       |text|
|deadline   |date|
|quantity   |integer| null: false              |
|user       |references|null: false, foregin_key: true|
|category   |references|null: false, foregin_key: true|


## Association

- belongs_to :user
- belongs_to :category
- has_many :images

# categories_table

| column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | index: true |

## Association
- has_many :item
- has_ancestry

# images_table

| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string     |
| item   | references | null: false, foregin_key: true |

## Association
- belongs_to :item

# comments_table

| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       |
| user   | references | null: false, foregin_key: true |
| item   | references | null: false, foregin_key: true |

## Association

- has_many :user
- has_many :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
