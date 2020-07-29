class User < ApplicationRecord
  has_many :items
  has_many :item_parchases

  full_widht = /\A[一-龥ぁ-ん]/
  name_kana = /\A[ァ-ヶー－]+\z/
  alp_int = /\A[a-z]+[0-9]+\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name, uniqueness: { case_sensitive: true }
    validates :family_name, format: { with: full_widht, message: 'Full-width characters' }
    validates :first_name, format: { with: full_widht, message: 'Full-width characters' }
    validates :family_name_kana, format: { with: name_kana, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: name_kana, message: 'Full-width katakana characters' }
    validates :birthday_id
    validates :password, format: { with: alp_int, message: 'Password Include both letters and numbers' }
  end
end
