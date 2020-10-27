# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column           | Type    | Options      |
| ---------------- | ------- | ------------ |
| name             | string  | null: false  |
| email            | string  | unique: true |
| password         | string  | null: false  |
| family_name      | string  | null: false  |
| first_name       | string  | null: false  |
| family_name_kana | string  | null: false  |
| first_name_kana  | string  | null: false  |
| birthday         | date    | null: false  |

### Association

- has_many :items
- has_many :purchase_histories


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | integer    | null: false                    |
| delivery_date | integer    | null: false                    |
| value         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history


##  purchase_histories テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


##  shipping_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefectures        | integer    | null: false                    |
| cities             | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| purchase_history   | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_history


