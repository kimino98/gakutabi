require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できるとき' do
      it 'nickname,email,password,company_name,profession_idが存在する場合は登録ができる' do
        
      end

      it 'nicknameが10文字いないであれば登録できる' do
        
    end
  end
end
