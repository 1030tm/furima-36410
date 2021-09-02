require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @sell_item = FactoryBot.build(:buy_delivery, user_id: user.id, item_id: item.id)
    sleep 1.0
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it '全ての項目が存在すれば購入できる' do
        expect(@sell_item).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @sell_item.building = ''
        expect(@sell_item).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @sell_item.postal_code = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postal_codeに - がないと購入できない' do
        @sell_item.postal_code = '1234567'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include('郵便番号は3桁-4桁で入力してください')
      end
      it 'postal_codeが(3つの数字)-(4つの数字)の形でないと購入できない' do
        @sell_item.postal_code = '1234-567'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include('郵便番号は3桁-4桁で入力してください')
      end
      it 'consignor_idが空だと購入できない' do
        @sell_item.consignor_id = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'consignor_idが --- だと購入できない' do
        @sell_item.consignor_id = 1
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと購入できない' do
        @sell_item.city = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと購入できない' do
        @sell_item.address = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("番地を入力してください")
      end
      it 'telが空だと購入できない' do
        @sell_item.tel = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'telに - があると購入できない' do
        @sell_item.tel = '090-1234-5678'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include('電話番号に-(ハイフン)を入力しないでください')
      end
      it 'telの文字数が12以上だと購入できない' do
        @sell_item.tel = '090123456789'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include('電話番号に-(ハイフン)を入力しないでください')
      end
      it 'user_idが無い場合は購入できない' do
        @sell_item.user_id = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが無い場合は購入できない' do
        @sell_item.item_id = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では購入できない' do
        @sell_item.token = ''
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'telが9桁以下だと登録できないこと' do
        @sell_item.tel = '123456789'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include('電話番号に-(ハイフン)を入力しないでください')
      end
      it 'telが電話番号が半角数字のみでないと登録できないこと' do
        @sell_item.tel = 'abc1234567'
        @sell_item.valid?
        expect(@sell_item.errors.full_messages).to include('電話番号に-(ハイフン)を入力しないでください')
      end
    end
  end
end
