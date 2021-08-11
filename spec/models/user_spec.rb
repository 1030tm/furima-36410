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
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end

    end
    context '新規登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_cofirmationが英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password passwordには英字と数字の両方を含めて設定してください")
      end
      it 'last_nameが半角では登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it 'first_nameが半角では登録できない' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it 'last_kanaが半角では登録できない' do
        @user.last_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana 全角文字(カタカナ)を使用してください")
      end
      it 'first_kanaが半角では登録できない' do
        @user.first_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana 全角文字(カタカナ)を使用してください")
      end
    end
  end

end
