＃　FurimaのER図

##  usersテーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| user        | string      | null: false                    |
| nickname    | string      | null: false                    |
| email       | string      | null: false                    |
| password    | string      | null: false                    |

### Association
- has_many :products
- belongs_to :purchase managements

## productsテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| user            | references  | null: false                    |
| image           |             |                                |
| product_name    | string      | null: false                    |
| description     | text        | null: false                    |
| category        | string      | null: false                    |
| status          | string      | null: false                    |
| delivery_fee    | string      | null: false                    |
| shipment_source | string      | null: false                    |
| time_to_ship    | string      | null: false                    |
| price           | string      | null: false                    |

### Association
- belongs_to :users
- belongs_to :purchase managements

## purchase managementsテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| user             | references  | null: false                    |
| product          | string      | null: false                    |
| shipping_address | string      | null: false                    |

### Association
- belongs_to :users
- belongs_to :shipping addresses

## shipping addressesテーブル

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| user         | references  | null: false                    |
| address      | string      | null: false                    |

### Association
- belongs_to :purchase managements