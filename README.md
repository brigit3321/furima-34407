
## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last-name       | string | null: false |
| first-name      | string | null: false |
| last-name-kana  | string | null: false |
| first-name-kana | string | null: false |
| user-birth-date | date   | null: false |


### Association

- has_many :items
- belong_to :order

## items テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| image                    |            | null: false |
| item_name                | integer    | null: false |
| item_info                | integer    | null: false |
| item_category            | integer    | null: false |
| item_sales-status        | integer    | null: false |
| item_shipping_fee_status | integer    | null: false |
| item_prefecture          | integer    | null: false |
| item_schedule_delivery   | integer    | null: false |
| item_price               | integer    | null: false |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       |  Options                       |
| -------------- | ---------- | ------------------------------ |
| order_amount   | string     | null: false,                   |
| order_day      | string     | null: false,                   |
| user_id        | references | null: false, foreign_key: true |
| items_id       | references | null: false, foreign_key: true |
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
| building_name    | string     | null: false                    |
| phone_number     | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order
