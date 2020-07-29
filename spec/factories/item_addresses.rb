FactoryBot.define do
  factory :item_address do
    postal_code { '123-4567' }
    area_id { 5 }
    city { '名古屋市' }
    address { '中区' }
    phone_number { 55_512_345_678 }
    token { 'abcd' }
    user_id { 1 }
    item_id { 1 }
  end
end
