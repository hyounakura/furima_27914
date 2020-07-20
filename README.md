## Userテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false, unique:true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|yearofbirth_id|integer|null: false|
|monthofbirth_id|integer|null: false|
|dayofbirth_id|integer|null: false|

### Association

-has_many :items
-has_many :Comments
-has_many :item_purchases


## Itemテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|explanation|text|
|price|integer|null :false|
|category_id|integer|null: false|
|status_id|integer|null :false|
|delivery_fee_id|integer|null :false|
|area_id|integer|null :false|
|term_id|integer|null :false|
|user_id|integer|null: false, foreign_key: true|

### Association

-has_many :Comments
-belongs_to :user
-has_one :item_purchase


## Commentテーブル

|Column|Type|Option|
|------|----|------|
|content|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

-belongs_to :item
-belongs_to :user


## Item_purchaseテーブル

|Column|Type|Option|
|------|----|------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to :item


## Address

|Column|Type|Option|
|------|----|------|
|number|string|null: false, unique: true|
|term_month|integer|null: false|
|term_year|integer|null: false|
|cvc|integer|null: false|
|postal_code|string|null: false, unique: true|
|prefectures_id|integer|null:false|
|city|string|null: false|
|address|string|null:false|
|building_name|string|
|phone_number|string|null: false, unique: true|

### Association

-belongs_to :item_purchase