## usersテーブル (ユーザー情報)
| Column             | Type         | Options                              |
| ------------------ | ------------ | ------------------------------------ |
| nickname           | string       | null: false                          | <!--ニックネーム-->
| encrypted_password | string       | null: false                          | <!--パスワード-->
| email              | string       | null: false unique: true, index:true | <!--メールアドレス-->
| first_name         | string       | null: false                          | <!--名前-->
| family_name        | string       | null: false                          | <!--苗字-->
| first_name_kana    | string       | null: false                          | <!--名前(カナ)-->
| family_name_kana   | string       | null: false                          | <!--苗字(カナ)-->
| birth_date         | date         | null: false                          | <!--生年月日-->

### Association
- has_many :items <!--1対多-->
- has_many :orders <!--1対多-->

## itemsテーブル (商品情報)
| Column           | Type         | Options                         |
| ---------------- | ------------ | ------------------------------- |
| user_id          | integer      | null: false, foreign_key: true  |
| product_name     | string       | null: false                     | <!--商品名-->
| explanation      | text         | null: false                     | <!--商品の説明-->
| price            | integer      | null: false                     | <!--販売価格-->
| category_id      | integer      | null: false                     | <!--カテゴリー-->
| status_id        | integer      | null: false                     | <!--商品の状態-->
| burden_id        | integer      | null: false                     | <!--配送料の負担-->
| area_id          | integer      | null: false                     | <!--発送元の地域-->
| guideline_id     | integer      | null: false                     | <!--発送日の目安-->

### Association
- belongs_to :user <!--1対1(参照元テーブル → 参照先テーブル)-->
- has_one    :order <!--1対1-->

## shippingsテーブル (住所)
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| postcode         | string       | null: false, foreign_key: true | <!--郵便番号-->
| prefecture_id    | integer      | null: false, foreign_key: true | <!--都道府県-->
| city             | string       | null: false, foreign_key: true | <!--市区町村-->
| block            | string       | null: false, foreign_key: true | <!--番地-->
| building         | string       |                                | <!--建物名-->
| phone_number     | string       | null: false, foreign_key: true | <!--電話番号-->
| order_id         | integer      | null: false, foreign_key: true |

### Association
- belongs_to :order <!--1対1(参照元テーブル → 参照先テーブル)-->

## ordersテーブル (購入情報)
| Column           | Type         | Options                        |
| ---------------- | ------------ | ------------------------------ |
| user_id          | integer      | null: false, foreign_key: true | <!--購入者名-->
| item_id          | integer      | null: false, foreign_key: true | <!--購入商品-->

### Association
- belongs_to :user <!--1対1(参照元テーブル → 参照先テーブル)-->
- belongs_to :item <!--1対1(参照元テーブル → 参照先テーブル)-->
- has_one    :shipping <!--1対1-->
