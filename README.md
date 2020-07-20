## Userテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null:false, unique:true|
|credit_id|integer|null: false, foreign_key: true|

### Association

-has_many :Products
-has_many :Comments
-belongs_to :Credit


## Productテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|
|price|integer|null :false|
|category|check-box|null: false|
|status|check-box|null :false|
|delivery_fee|check-box|null :false|
|area|check-box|null :false|
|term|check-box|null :false|
|user_id|integer|null: false, foreign_key: true|
|credit_id|integer|null: false, foreign_key: true|

### Association

-has_many :Comments
-belongs_to :Credit
-belongs_to :user


## Commentテーブル

|Column|Type|Option|
|------|----|------|
|content|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|

### Association

-belongs_to :Product
-belongs_to :user


## Creditテーブル

|Column|Type|Option|
|------|----|------|
|number|integer|null: false, unique: true|
|deadline|integer|null: false|
|cvc|integer|null: false|

### Association

-belongs_to :user
-has_many :products