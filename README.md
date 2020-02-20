# README

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|detail|text|null: false|
|category|references|null: false, foreign_key: true|
|brand|string|
|size|string|
|price|integer|null: false|
|status|integer|null: false|
|shipping_area|integer|null: false|
|estimated_date|integer|null: false|
|postage|integer|null: false|
|favorite|integer|null: false|
|buyer_id|integer|

### Association
- has_many :images
- has_many :comments
- belongs_to :category
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :product

## catgoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|varchar|

### Association
- belongs_to :product
- has_ancestry

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false,unique: true|
|password|string|null: false|
|nickname|string|null: false|
|f_name|string|null: false|
|l_name|string|null: false|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|birthday|integer|null: false|
|tel_number|integer|null: false|
<!-- 以下はdevise導入時分 -->
|reset_password_token|string||
|reset_password_sent_at|datetime||
|encrypted_password|string|null:false,||remember_created_at|datetime||
||timestamps|null: false|

### Association
- has_many :products
- has_many :address
- has_many :credit_cards
- has_many :comments

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key|
|postal_code|integer|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|

### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false,foreign_key:true|
|customer_id|string|null: false|
|card_number|integer|null: false|
|effective_date|integer|null: false|
|cvc|integer|null:false|

### Association
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key:true|
|product_id|string|null: false|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :product