require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できるとき' do
      it 'nickname,email,password,company_name,profession_idが存在する場合は登録ができる' do
        expect(@user).to be_valid
      end

      it 'nicknameが10文字以内であれば登録できる' do
        @user.nickname = 'test'
        @user.valid?
        expect(@user).to be_valid
      end

      it 'avatarが空でも登録できる' do
        @user.avatar = ''
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '登録ができないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it '重複したemailが存在する場合登録できない' do
        FactoryBot.create(:user, email: 'abc@abc.com')
        @user = FactoryBot.build(:user, email: 'abc@abc.com')
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordがないと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'passwordが6文字以下だと登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが6文字以上で英数字混合でなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を両方含む6文字にして下さい')
      end

      it 'passwordが英字のみでは登録出来ない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を両方含む6文字にして下さい')
      end

      it 'passwordが全角では登録出来ない' do
        @user.password = 'ＡＢＣ123'
        @user.password_confirmation = 'ＡＢＣ123'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を両方含む6文字にして下さい')
      end

      it 'passwordが存在してもencrypted_passwordがない場合は登録できない' do
        @user.password = 'test123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end

      it 'company_nameがからだと登録できない' do
        @user.company_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ご所属先名を入力してください')
      end

      it 'profession_idが空だと登録できない' do
        @user.profession_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ご職業を選択して下さい')
      end
      
      it 'profession_idが1だと登録できない' do
        @user.profession_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include('ご職業を選択して下さい')
      end
    end
  end
end
