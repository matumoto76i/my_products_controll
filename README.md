# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

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
|name       |string|
|remarks    |text|
|shop       |text|
|quantity   |integer|
|user       |references|null: false, foregin_key: true|
|category   |references|null: false, foregin_key: true|
|deadline_id(active_hash) |integer|null: false, foregin_key: true|

## Association

- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :deadline
- has_many :images

# categories_table

| column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string | index: true |

## Association
- has_many :item
- has_ancestry

# deadline_table

| column   | Type   | Options     |
| -------- | ------ | ----------- |
| deadline | string | null: false |

## Association
- has_many :item

# images_table

| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string     |
| item   | references | null: false, foregin_key: true |

## Association
- belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
