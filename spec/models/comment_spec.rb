require 'rails_helper'
RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント投稿' do
    context 'コメントできる時' do
      it 'コメント入力済みあれば投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントできない時' do
      it 'コメントが空のとき、コメントできない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end

      it 'コメントが空のとき、コメントできない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end

      it 'コメントが140文字以上のとき、コメントできない' do
        @comment.content = 'テスト'*140
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントは140文字以内で入力してください')
      end

      it 'ユーザと紐づいてないとき' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end

      it '投稿と紐づいてないとき' do
        @comment.review = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Reviewを入力してください')
      end
    end
  end
end
