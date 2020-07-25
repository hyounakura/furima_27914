require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a image, name, explanation, price, category_id, status_id, delivery_fee, area_id, term, user_id' do
        item = build(:item)
        item.image = fixture_file_upload('public/images/test_image.jpg')
        expect(item).to be_valid
      end
    end

    context 'can not save nil' do |item|
      before do
        item = build(:item, { image: nil, name: nil, explanation: nil, price: nil, category_id: nil, status_id: nil, delivery_fee: nil, area_id: nil, term: nil, user_id: nil })
      end

      it 'is valid without a image' do
        item.valid?
        expect(item.errors[:image]).to include("can't be blank")
      end

      it 'is valid without a name' do
        item.valid?
        expect(item.errors[:name]).to include("can't be blank")
      end

      it 'is valid without a explanation' do
        item.valid?
        expect(item.errors[:explanation]).to include("can't be blank")
      end

      it 'is valid without a price' do
        item.valid?
        expect(item.errors[:price]).to include("can't be blank")
      end

      it 'is valid without a category_id' do
        item.valid?
        expect(item.errors[:category_id]).to include("can't be blank")
      end

      it 'is valid without a status_id' do
        item.valid?
        expect(item.errors[:status_id]).to include("can't be blank")
      end

      it 'is valid without a delivery_fee' do
        item.valid?
        expect(item.errors[:delivery_fee]).to include("can't be blank")
      end

      it 'is valid without a area_id' do
        item.valid?
        expect(item.errors[:area_id]).to include("can't be blank")
      end

      it 'is valid without a term' do
        item.valid?
        expect(item.errors[:term]).to include("can't be blank")
      end

      it 'is valid without a user_id' do
        item.valid?
        expect(item.errors[:user_id]).to include("can't be blank")
      end

      it 'is valid without a category' do
        item.valid?
        expect(item.errors[:category]).to include("can't be blank")
      end

      it 'is valid without a status' do
        item.valid?
        expect(item.errors[:status]).to include("can't be blank")
      end

      it 'is valid without a area' do
        item.valid?
        expect(item.errors[:area]).to include("can't be blank")
      end
    end

    context 'can not save value = 1' do |item|
      before do
        item = build(:item, { category_id: 1, status_id: 1 })
        item.image = fixture_file_upload('public/images/test_image.jpg')
      end

      it 'is valid category_id = 1' do
        item.valid?
        expect(item.errors[:category_id]).to include('must be other than 1')
      end

      it 'is valid status_id = 1' do
        item.valid?
        expect(item.errors[:status_id]).to include('must be other than 1')
      end
    end

    context 'can not save value = 0' do |item|
      it 'is valid area_id = 0' do
        item = build(:item, area_id: 0)
        item.image = fixture_file_upload('public/images/test_image.jpg')
        item.valid?
        expect(item.errors[:area_id]).to include('must be other than 0')
      end
    end

    context 'can not save value = ---' do |item|
      before do
        item = build(:item, { delivery_fee: '---', term: '---' })
        item.image = fixture_file_upload('public/images/test_image.jpg')
      end

      it 'is valid delivery_fee = ---' do
        item.valid?
        expect(item.errors[:delivery_fee]).to include('is reserved')
      end

      it 'is valid term = ---' do
        item.valid?
        expect(item.errors[:term]).to include('is reserved')
      end
    end

    context 'can not save about price' do |item|
      it 'is valid not integer' do
        item = build(:item, price: 'aaa')
        item.image = fixture_file_upload('public/images/test_image.jpg')
        item.valid?
        expect(item.errors[:price]).to include('is not a number')
      end

      it 'is valid price =< 300' do
        item = build(:item, price: 299)
        item.image = fixture_file_upload('public/images/test_image.jpg')
        item.valid?
        expect(item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it 'is valid price => 9999999' do
        item = build(:item, price: 10_000_000)
        item.image = fixture_file_upload('public/images/test_image.jpg')
        item.valid?
        expect(item.errors[:price]).to include('must be less than or equal to 9999999')
      end
    end
  end
end
