require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end


  describe '購入機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it 'building_nameが空でも保存される' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空だと保存できないこと' do
      @purchase_address.post_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid')
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.post_code = '1234567'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post code is invalid')
    end

    it 'prefecture_idが0の場合保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it 'cityが空だと保存できないこと' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @purchase_address.street = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
    end

    it 'phone_numberが半角のハイフンを含まない正しい形式でないと保存できないこと' do
      @purchase_address.phone_number = '000-2345-3445'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberが12桁以上だと保存できないこと' do
      @purchase_address.phone_number = '000-1234-56789'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
