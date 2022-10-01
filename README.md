# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| kana_name          | string | null: false              |
| birthday           | string | null: false              |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| user_nickname      | references | null: false, foreign_key: true |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| area               | string     | null: false                    |
| criterion          | text       | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belong to :users
- belong to :purchases

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false, unique:true       |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false, unique:true       |
| user_id       | references | null: false, foreign_key: true |
| product_id    | references | null: false, foreign_key: true |

### Association

- belong_to :users
- has_many :products
