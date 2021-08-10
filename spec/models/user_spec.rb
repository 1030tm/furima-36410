require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it 'nicknameとemail, passwordとpassword_confirmation, first_nameとlast_name, first_kanaとlast_kanac, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        
      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
         
      end
      it 'last_nameとfirst_nameが全角であれば登録できる' do
        
      end
      it 'last_kanaとfirst_kanaが全角であれば登録できる' do
        
      end

    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        
      end
      it 'emailが空では登録できない' do
        
      end
      it 'passwordが空では登録できない' do
        
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        
      end
      it '重複したemailが存在する場合登録できない' do
        
      end
      it 'passwordが５文字以下では登録できない' do
        
      end
      it 'lasr_nameとfirst_nameが半角では登録できない' do
        
      end
      it 'last_kanaとfirst_kanaが半角では登録できない' do
        
      end
    end
  end

end
