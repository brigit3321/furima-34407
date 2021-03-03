
## users テーブル

| Column          | Type   | Options     |
| ----------      | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| name(全角)       | string | null: false |
| name(カナ)       | text   | null: false |
| user-birth-date | text   | null: false |
|            | text   | null: false |


### Association

- has_many :items
- belong_to :cards

## items テーブル

| Column                   | Type       | Options     |
| ----------               | ---------- | ----------- |
| image                    | string     | null: false |
| item-name                | text       | null: false |
| item-info                | text       | null: false |
| item-category            |            |             |
| item-sales-status        | references |             |
| item-shipping-fee-status | references |             |
| item-prefecture          | references |             |
| item-schedule-delivery   | references |             |
| item-price               | references |             |

### Association

- belongs_to :user
- has_many :comments

## cards テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card-number    | references | null: false, foreign_key: true |
| card-exp-month | references | null: false, foreign_key: true |
| card-exp-month | references |                                |
| card-cvc       | references |                                |
### Association

- belongs_to :user
- has_one :addresses
- has_many :items

## addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture       | text       | null: false |
| city             | text       | null: false |
| house_number     |            |             |
| building_name    | references |             |
| card | references|            |

### Association

- belongs_to :user
