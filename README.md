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
|birthday_year|birthdayyear_id|null: false|
|birthday_month|birthdaymonth_id|null: false|
|birthday_day|birthday_id|null: false|

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
|category|category_id|null: false|
|status|status_id|null :false|
|delivery_fee|delivery_fee_id|null :false|
|area|area_id|null :false|
|term|term_id|null :false|
|user_id|integer|null: false, foreign_key: true|

### Association

-has_many :Comments
-belongs_to :user
-has_one :item_purchaseｓ


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
|postal_code|integer|null: false, unique: true|
|prefectures|prefectures_id|null:false|
|city|string|null: false|
|address|integer|null:false|
|building_name|string|
|phone_number|string|null: false, unique: true|

### Association

-belongs_to :item_purchase