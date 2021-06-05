# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------  | ------   | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| name            | string   | null: false |
| name_reading    | string   | null: false |
| birthday_id     | integer  | null: false |



### Association

- has_many :items
- has_many :rops


## items テーブル

| Column                      | Type       | Options     |
| --------------------------  | ---------- | ----------- |
| name                        | string     | null: false |
| description                 | text       | null: false |
| category_id                 | integer    | null: false |
| status_id                   | integer    | null: false |
| who_pay_shipping_charge_id  | integer    | null: false |
| ship_where_from_id          | integer    | null: false |
| days_id                     | integer    | null: false |
| price                       | integer    | null: false |


### Association

- has_many :rops
- belongs_to :users


## shippments テーブル

| Column         | Type       | Options        |
| ------------   | ---------- | -------------- |
| postal_code    | integer    | null: false    |
| prefecture_id  | integer    | null: false    |
| city           | string     | null: false    |
| house_number   | string     | null: false    |
| building_name  | string     | null: false    |
| phone_number   | integer    | null: false    |


### Association


- belongs_to :rops



## ropsテーブル

| Column | Type        | Options                        |
| ------ | ----------  | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association

- has_one :shippments
