# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# name
  my_product_controll

# Production environment
  - AWS,mysql57,S3
  - URL http://18.178.80.130/

# Overview
  このアプリではユーザー登録、画像,テキスト,カテゴリーの登録・編集・削除が出来ます。

# Production intention
  - このアプリを作成した背景としては、自身がスーパーなど買い物に行った際に、買い忘れや必要以上に買い過ぎる事があるので、日用品や食料品を手軽に管理できるツールあれば便利ではないかと考え作成しました。

# DEMO
  - ![demo](https://raw.github.com/wiki/matumoto76i/my_products_controll/my_products_controll.wiki/gif/image.gif)
  - ![sample](https://i.gyazo.com/cb1dd37b733ad924c947ca44ddea9662.png)

# Ingenuity
  - ユーザー目線で考えて、アカウントの作成や機能はシンプルに。
  いくら技術の高い機能でもユーザーが使うかどうか分からない実装をするより、視覚的にも直感的にも使いやすいいくつかのシンプルな機能の実装をする事を考えました。

# Task
  - 消費期限３年以上の食料品において、消費期限までの日数が100日を切った場合にメールやマイページで通知をする機能の実装を考えています。

# Technology used
  - テキストエディタ:VSコード, 使用言語:Ruby,rails,javascript,haml,html,scss
  mysql2,GitHub,Google Chrome

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
