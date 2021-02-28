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
| birthday        | date        | null: false                    |

### Association
- has_many :products
- has_many :purchase_history

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
- belongs_to :user
- has_many :purchase_history

## purchase_historyテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user             | references  | null: false                    |
| product          | references  | null: false                    |

### Association
- belongs_to :user
- belongs_to :product
- has_many  :buyer_information

## buyer_informationテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase_history | references | null: false                    |
| postal_code      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| phone_number     | integer    | null: false                    |

### Association
- belongs_to :purchase_history