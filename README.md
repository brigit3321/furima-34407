
## users テーブル

| Column             | Type   | Options                  |
| ---------------    | ------ | -------------------------|
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| user_birth_date    | date   | null: false              |


### Association

- has_many :items
- belong_to :order

## items テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| name                     | string     | null: false |
| info                     | string     | null: false |
| category_id              | integer    | null: false |
| sales_status_id          | integer    | null: false |
| shipping_fee_status_id   | integer    | null: false |
| prefecture_id            | integer    | null: false |
| schedule_delivery_id     | integer    | null: false |
| price                    | integer    | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       |  Options                       |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| items          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :addresses
- belongs_to :items

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
