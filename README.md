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

| Column          | Type    | Options      |
| --------------- | ------- | ------------ |
| name            | string  | null: false  |
| email           | string  | unique: true |
| password        | string  | null: false  |
| family_name     | string  | null: false  |
| first_name      | string  | null: false  |
| birthday        | integer | null: false  |

### Association

- has_many :items
- has_many :purchase_histories


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery_fee  | string     | null: false                    |
| shipping_area | string     | null: false                    |
| delivery_date | string     | null: false                    |
| value         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase_histories


##  purchase_histories テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| date          | references | null: false                    |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses


##  shipping_addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| prefectures        | string     | null: false                    |
| cities             | string     | null: false                    |
| address            | string     | null: false                    |
| phone_number       | string     | null: false                    |
| purchase_histories | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_histories


