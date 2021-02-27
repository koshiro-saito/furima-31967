＃　FurimaのER図

##  ユーザー管理機能テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| ユーザー名    | string      | NOT NULL                       |
| ニックネーム  | string      | NOT NULL                       |
| メールアドレス | string      | NOT NULL                       |
| パスワード    | string      | NOT NULL                       |

### Association
- has_many :商品出品機能
- belongs_to :商品購入機能

## 商品出品機能テーブル

| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| ユーザー名    | references  | NOT NULL                       |
| 画像         |             | NOT NULL                       |
| 品名         | string      | NOT NULL                       |
| 説明         | text        | NOT NULL                       |
| カテゴリ      | string      | NOT NULL                       |
| 状態         | string      | NOT NULL                       |
| 配送料負担    | string      | NOT NULL                       |
| 発送元地域    | string      | NOT NULL                       |
| 発送L/T      | string      | NOT NULL                       |
| 価格         | string      | NOT NULL                       |

### Association
- belongs_to :商品購入機能
- belongs_to :ユーザー管理機能

## 商品購入機能テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------- | ------------------------------ |
| ユーザー名         | references  | NOT NULL                       |
| クレジットカード情報 | references  | NOT NULL                       |
| 配送先             | string      | NOT NULL                       |

### Association
- belongs_to :ユーザー管理機能
- belongs_to :商品出品機能