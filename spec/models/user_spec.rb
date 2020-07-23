require 'rails_helper'
describe User do
  describe '#create' do
    context 'can save' do
      it 'is valid with a name, email, password, password_confirmation,     family_name, first_name,family_name_kana, first_name_kana, birthday_id' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'can not sasve null' do |user|
      before do
        user = build(:user, { name: nil, email: nil, password: nil, family_name: nil, first_name: nil, family_name_kana: nil, first_name_kana: nil, birthday_id: nil })
      end

      it 'is invalid without a name' do
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a email' do
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid without a password' do
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid without a family_name' do
        user.valid?
        expect(user.errors[:family_name]).to include("can't be blank")
      end

      it 'is invalid without a first_name' do
        user.valid?
        expect(user.errors[:first_name]).to include("can't be blank")
      end

      it 'is invalid without a family_name_kana' do
        user.valid?
        expect(user.errors[:family_name_kana]).to include("can't be blank")
      end

      it 'is invalid without a first_name_kana' do
        user.valid?
        expect(user.errors[:first_name_kana]).to include("can't be blank")
      end

      it 'is invalid without a birthday_id' do
        user.valid?
        expect(user.errors[:birthday_id]).to include("can't be blank")
      end
    end

    context 'can not sasve letter' do
      it 'is invalid without big letter family_name' do
        user = build(:user, family_name: 'suzuki')
        user.valid?
        expect(user.errors[:family_name]).to include('Full-width characters')
      end

      it 'is invalid without big letter first_name' do
        user = build(:user, first_name: 'taro')
        user.valid?
        expect(user.errors[:first_name]).to include('Full-width characters')
      end

      it 'is invalid without katakana family_name_kana' do
        user = build(:user, family_name_kana: 'すずきsuzuki')
        user.valid?
        expect(user.errors[:family_name_kana]).to include('Full-width katakana characters')
      end

      it 'is invalid without katakana first_name_kana' do
        user = build(:user, first_name_kana: 'たろうtaro')
        user.valid?
        expect(user.errors[:first_name_kana]).to include('Full-width katakana characters')
      end

      it 'is invalid without integer && letter password 1' do
        user = build(:user, password: '111111')
        user.valid?
        expect(user.errors[:password]).to include('Password Include both letters and numbers')
      end

      it 'is invalid without integer && letter password 2' do
        user = build(:user, password: 'aaaaaa')
        user.valid?
        expect(user.errors[:password]).to include('Password Include both letters and numbers')
      end

      it 'is invalid within 6 characters' do
        user = build(:user, password: '11aa')
        user.valid?
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end
    end
  end
end
