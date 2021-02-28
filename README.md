＃　FurimaのER図

##  usersテーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| nickname           | string      | null: false                    |
| email              | string      | null: false, unique: true      |
| encrypted_password | string      | null: false                    |
| last_name          | string      | null: false                    |
| first_name         | string      | null: false                    |
| last_name_kana     | string      | null: false                    |
| first_name_kana    | string      | null: false                    |
| birthday           | date        | null: false                    |

### Association
- has_many :products
- has_many :purchase_histories

## productsテーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false ,foreign_key: true |
| product_name       | string      | null: false                    |
| description        | text        | null: false                    |
| category_id        | integer     | null: false                    |
| status_id          | integer     | null: false                    |
| delivery_fee_id    | integer     | null: false                    |
| prefecture_id      | integer     | null: false                    |
| time_to_ship_id    | integer     | null: false                    |
| price              | integer     | null: false                    |

### Association
- belongs_to :user
- has_one :purchase_history

## purchase_historiesテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user             | references  | null: false ,foreign_key: true |
| product          | references  | null: false ,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :buyer

## buyersテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase_history | references | null: false ,foreign_key: true |
| postal_code      | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipality     | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |

### Association
- belongs_to :purchase_history