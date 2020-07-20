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
  |birthday_year|birthday_year_id|null: false|
  |birthday_month|birthday_month_id|null: false|
  |birthday_day|birthday_day_id|null: false|

  ### Association

  -has_many :Products
  -has_many :Comments
  -has_many :transaction


  ## Productテーブル

  |Column|Type|Option|
  |------|----|------|
  |name|string|null: false|
  |explanation|string|
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
  -belongs_to :transaction


  ## Commentテーブル

  |Column|Type|Option|
  |------|----|------|
  |content|string|null: false|
  |user_id|integer|null: false, foreign_key: true|
  |product_id|integer|null: false, foreign_key: true|

  ### Association

  -belongs_to :Product
  -belongs_to :user


  ## Transactionテーブル

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
  |product_id|integer|null: false, foreign_key: true|
  |user_id|integer|null: false, foreign_key: true|

  ### Association

  -belongs_to :user
  -belongs_to :product