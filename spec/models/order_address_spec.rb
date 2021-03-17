require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user_id = FactoryBot.create(:user)
    item_id = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user_id, item_id: item_id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '保存できる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

      it 'phone_numberは10桁でも保存できること' do
        @order_address.phone_number = '0901234567'
        expect(@order_address).to be_valid
      end
    end

    context '保存できない時' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end

      it '発送元の地域についての情報が必須であること' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityは空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberは空では保存できないこと' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberは空では保存できないこと' do
        @order_address.phone_number = 'nil'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  Input only number ')
      end

      it 'phone_numberは9桁以下では保存できないこと' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number  Input only number ')
      end

      it 'phone_numberは半角数字のみ保存可能であること' do
        @order_address.phone_number = '１００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number Half-width number')
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
