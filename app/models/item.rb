class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :area
  has_one :item_parchase
  belongs_to :user
  has_one_attached :image

  validates :category, :status, :area, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id
  end

  with_options exclusion: { in: %w[---] } do
    validates :delivery_fee, :term
  end

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :category_id
    validates :status_id
    validates :delivery_fee
    validates :area_id
    validates :term
    validates :user_id
    validates :image
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
