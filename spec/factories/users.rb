FactoryBot.define do
  factory :user do
    name { 'taro' }
    email { 'taro@com' }
    password { 'taro12' }
    password_confirmation { 'taro12' }
    family_name { '鈴木' }
    first_name { '太郎' }
    family_name_kana { 'スズキ' }
    first_name_kana { 'タロウ' }
    birthday_id { 1993 - 0o3 - 20 }
  end
end
