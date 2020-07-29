class ItemAddress
  include ActiveModel::Model
  int_hyp = /\A\d{3}[-]\d{4}\z/
  attr_accessor :postal_code, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: int_hyp, message: 'Only integer and hyphen' }
    validates :area_id
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :user_id
    validates :item_id
  end
  def save
    item_parchase = ItemParchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_parchase_id: item_parchase.id)
  end
end
