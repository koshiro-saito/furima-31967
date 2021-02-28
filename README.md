＃　FurimaのER図

##  usersテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| nickname        | string      | null: false                    |
| email           | string      | null: false                    |
| password        | string      | null: false                    |
| last_name       | string      | null: false                    |
| first_name      | string      | null: false                    |
| last_name_kana  | string      | null: false                    |
| first_name_kana | string      | null: false                    |
| birthday        | string      | null: false                    |

### Association
- has_many :products
- belongs_to :purchase history

## productsテーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false                    |
| product_name       | string      | null: false                    |
| description        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| status_id          | integer     | null: false                    |
| delivery_fee_id    | integer     | null: false                    |
| shipment_source_id | integer     | null: false                    |
| time_to_ship_id    | integer     | null: false                    |
| price              | integer     | null: false                    |

### Association
- belongs_to :users
- belongs_to :purchase history

## purchase historyテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user             | references  | null: false                    |
| product          | references  | null: false                    |

### Association
- has_many :users
- has_many :products

## buyer informationテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false                    |
| postal_code   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |

### Association
- has_one :purchase history