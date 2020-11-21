## usersテーブル (ユーザー情報)
| Column           | Type         | Options                              |
| ---------------- | ------------ | ------------------------------------ |
| nickname         | string       | null: false                          | <!--ニックネーム-->
| password         | string       | null: false                          | <!--パスワード-->
| email            | string       | null: false unique: true, index:true | <!--メールアドレス-->
| first_name       | string       | null: false                          | <!--名前-->
| family_name      | string       | null: false                          | <!--苗字-->
| first_name_kana  | string       | null: false                          | <!--名前(カナ)-->
| family_name_kana | string       | null: false                          | <!--苗字(カナ)-->
| birth_year       | date         | null: false                          | <!--生年月日(年)-->
| birth_month      | date         | null: false                          | <!--生年月日(月)-->
| birth_day        | date         | null: false                          | <!--生年月日(日)-->

### Association
- has_many :items <!--1対多-->
- has_one  :shipping <!--1対1-->
- has_one  :order <!--1対1-->

## itemsテーブル (商品情報)
| Column           | Type         | Options                         |
| ---------------- | ------------ | ------------------------------- |
| user_id          | integer      | null: false, foreign_key: true  |
| image            |              |                                 | <!--出品画像-->
| product_name     | string       | null: false                     | <!--商品名-->
| explanation      | text         | null: false                     | <!--商品の説明-->
| price            | integer      | null: false                     | <!--販売価格-->
| category         | text         | null: false                     | <!--カテゴリー-->
| status           | text         | null: false                     | <!--商品の状態-->
| burden           | text         | null: false                     | <!--配送料の負担-->
| area             | text         | null: false                     | <!--発送元の地域-->
| guideline        | text         | null: false                     | <!--発送日の目安-->

### Association
- belongs_to :user <!--1対1(参照元テーブル → 参照先テーブル)-->
- has_one    :shipping <!--1対1-->
- has_one    :order <!--1対1-->

## shippingsテーブル (住所)
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          |              | null: false, foreign_key: true |
| item_id          |              | null: false, foreign_key: true |
| postcode         | text         | null: false, foreign_key: true | <!--郵便番号-->
| prefecture       | text         | null: false, foreign_key: true | <!--都道府県-->
| city             | text         | null: false, foreign_key: true | <!--市区町村-->
| block            | integer      | null: false, foreign_key: true | <!--番地-->
| building         | text         | null: false, foreign_key: true | <!--建物名-->
| phone_number     | integer      | null: false, foreign_key: true | <!--電話番号-->

### Association
- belongs_to :user <!--1対1(参照元テーブル → 参照先テーブル)-->
- belongs_to :item <!--1対1(参照元テーブル → 参照先テーブル)-->
- has_one    :order <!--1対1-->

## ordersテーブル (購入記録)
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          |              | null: false, foreign_key: true | <!--購入者名-->
| item_id          |              | null: false, foreign_key: true | <!--購入商品-->
| shipping_id      |              | null: false, foreign_key: true | <!--配送先-->
| created_at       |              |                                | <!--購入記録-->

### Association
- belongs_to :user <!--1対1(参照元テーブル → 参照先テーブル)-->
- belongs_to :item <!--1対1(参照元テーブル → 参照先テーブル)-->
- belongs_to :shipping <!--1対1(参照元テーブル → 参照先テーブル)-->
