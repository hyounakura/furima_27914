require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a postal_code, area_id, city, address, phone_number, token, item_id, user_id' do
        item_address = build(:item_address)
        expect(item_address).to be_valid
      end
    end

    context 'can not save nil' do |item_address|
      before do
        item_address = build(:item_address, { postal_code: nil, area_id: nil, city: nil, address: nil, phone_number: nil, token: nil, user_id: nil, item_id: nil })
      end

      it 'is valid without a postal_code' do
        item_address.valid?
        expect(item_address.errors[:postal_code]).to include("can't be blank")
      end

      it 'is valid without a area_id' do
        item_address.valid?
        expect(item_address.errors[:area_id]).to include("can't be blank")
      end

      it 'is valid without a city' do
        item_address.valid?
        expect(item_address.errors[:city]).to include("can't be blank")
      end

      it 'is valid without a address' do
        item_address.valid?
        expect(item_address.errors[:address]).to include("can't be blank")
      end

      it 'is valid without a phone_number' do
        item_address.valid?
        expect(item_address.errors[:phone_number]).to include("can't be blank")
      end

      it 'is valid without a token' do
        item_address.valid?
        expect(item_address.errors[:token]).to include("can't be blank")
      end

      it 'is valid without a user_id' do
        item_address.valid?
        expect(item_address.errors[:user_id]).to include("can't be blank")
      end

      it 'is valid without a item_id' do
        item_address.valid?
        expect(item_address.errors[:item_id]).to include("can't be blank")
      end
    end

    context 'can not save about postal_code ' do
      it 'is valid with letter' do
        item_address = build(:item_address, { postal_code: 'word' })
        item_address.valid?
        expect(item_address.errors[:postal_code]).to include('Only integer and hyphen')
      end

      it 'is valid with other than 3int hyphen 4int' do
        item_address = build(:item_address, { postal_code: '1234-567' })
        item_address.valid?
        expect(item_address.errors[:postal_code]).to include('Only integer and hyphen')
      end
    end

    context 'can not save about phone_number ' do
      it 'is valid with more 11' do
        item_address = build(:item_address, { phone_number: '0000123445678' })
        item_address.valid?
        expect(item_address.errors[:phone_number]).to include('is too long (maximum is 11 characters)')
      end
    end
  end
end
