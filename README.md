# README

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|details|text|null: false|
|category|string|null: false|
|price|integer|null: false|
|status|text|null: false|
|stuation|text|null: false|
|shipping_area|string|null: false|
|estimated_date|string|null: false|
|postage|string|null: false|
|method|string|null: false|

### Association
- has_many :pictures
- has_many :comments
- belongs_to :main_categories
- belongs_to :users

## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|

### Association
- belongs_to :products

## main_catgoriesテーブル
|Column|Type|Options|
|------|----|-------|
|main_categories|string|null: false|

### Association
- belongs_to :products
- has_many :sub_categories

## sub_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|sub_categories|string|null: false|

### Association
- belongs_to :main_categories
- has_many :sub2_categories

## sub2_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|sub2_categories|string|null: false|

### Association
-belongs_to :sub_categories

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|

### Association
- belongs_to :users
- belongs_to :products

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false,unique: true|
|password|string|null: false|
|nickname|string|null: false|
|f_name_kanji|string|null: false|
|l_name_kanji|string|null: false|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|birthday|integer|null: false|
|tel_number|integer|null: false|

### Association
- has_many :products
- belongs_to :address
- belongs_to :credit_card
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
|card_number|integer|null:false|
|effective_date|integer|null: false|
|cvc|integer|null:false|

### Association
- belongs_to :user

