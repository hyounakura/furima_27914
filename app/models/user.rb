class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :family_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters'}
  validates :first_name, presence: true, format: { with: /\A[一-龥ぁ-ん]/, message: 'Full-width characters'}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
  validates :birthday_id, presence: true
  validates :password, format: { with: (/\A[a-z]+[0-9]+\z/), message: 'Password Include both letters and numbers'}
end