# テーブル設計

## users テーブル

| Column                  | Type      | Options                  |
| ----------------------  | -------   | -----------------------  |
| nickname                | string    | null: false              |
| email                   | string    | null: false,unique: true |
| encrypted_password      | string    | null: false              |
| name_last               | string    | null: false              |
| name_first              | string    | null: false              |
| name_reading_last       | string    | null: false              | 
| name_reading_first      | string    | null: false              |
| birthday                | date      | null: false              |



### Association

- has_many :items
- has_many :orders


## items テーブル

| Column                      | Type        | Options                        |
| --------------------------  | ----------  | -----------------------------  |
| name                        | string      | null: false                    |
| description                 | text        | null: false                    |
| category_id                 | integer     | null: false                    |
| status_id                   | integer     | null: false                    |
| who_pay_shipping_charge_id  | integer     | null: false                    |
| ship_where_from_id          | integer     | null: false                    |
| delivery_day_id             | integer     | null: false                    |
| price                       | integer     | null: false                    |
| user                        | references  | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user


## shippments テーブル

| Column                | Type       | Options                        |
| ------------------    | ---------- | ---------------------------    |
| postal_code           | string     | null: false                    |
| ship_where_from_id    | integer    | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building_name         | string                                      |
| phone_number          | string     | null: false                    |
| order                 | references | null: false, foreign_key: true |

### Association


- belongs_to :order




## ordersテーブル

| Column | Type        | Options                        |
| ------ | ----------  | ------------------------------ |
| user   | references  | null: false, foreign_key: true |
| item   | references  | null: false, foreign_key: true |

### Association

- has_one :shippment
- belongs_to :item
- belongs_to :user