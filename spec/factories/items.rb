FactoryBot.define do
  factory :item do
    image { File.open("#{Rails.root}/public/images/test_image.jpg") }
    name { 'バッグ' }
    explanation { '去年買いました。' }
    price { 5000 }
    category_id { 3 }
    status_id { 3 }
    delivery_fee { '送料込み' }
    area_id { 4 }
    term { '2~3日で発送' }
    association :user, factory: :user
  end
end
