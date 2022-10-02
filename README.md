# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| kanji_name         | string | null: false              |
| hiragana_name      | string | null: false              |
| katakana_name      | string | null: false              |
| hurigana_name      | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :purchases
- has_many :purchases_records

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| user_nickname      | references | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| deliverytime_id    | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- has_one :purchases_record

## mailing_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| area_id       | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_many :products

## purchases_records テーブル

| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item