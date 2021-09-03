require 'rails_helper'

RSpec.describe "コメント送信", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @another = FactoryBot.create(:user)
    @review = FactoryBot.create(:review, user_id: @user.id)
    @another_review = FactoryBot.create(:review, user_id: @another.id)
    @comment = FactoryBot.build(:comment)
  end
  context 'コメントできるとき' do
    it 'ログイン後、他の投稿に対してコメントができる' do
      # ログインする
      sign_in(@user)
      # 他ユーザーの詳細ページに遷移
      visit review_path(@another_review)
      # コメント投稿をする
      fill_in 'comment[content]', with: @comment.content
      # 送信するとreviewモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 投稿したコメントが存在する
      expect(page).to have_content(@comment.content)
    end
    it 'ログイン後、自分の投稿に対してコメントができる' do
      # ログインする
      sign_in(@user)
      # 自分の投稿した詳細ページに遷移
      visit review_path(@review)
      # コメント投稿をする
      fill_in 'comment[content]', with: @comment.content
      # 送信するとcommentモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(1)
      # 投稿したコメントが存在する
      expect(page).to have_content(@comment.content)
    end
  end
  context 'コメントできないとき' do
    it 'ログインしなければコメントができない' do
      # 自分の投稿した詳細ページに遷移
      visit review_path(@review)
      # コメントするボタンが存在しない
      expect(page).to have_no_content('コメントする')
      expect(page).to have_content('※※※ コメントの投稿には新規登録/ログインが必要です ※※※')
    end
    it 'ログイン後、コメント入力欄に入力しなければコメントできない' do
      # ログインする
      sign_in(@user)
      # 自分の投稿した詳細ページに遷移
      visit review_path(@review)
      # コメント投稿をする
      fill_in 'comment[content]', with: ''
      # 送信するとcommentモデルのカウントが空のため上がらない
      expect{
        find('input[name="commit"]').click
      }.to change { Comment.count }.by(0)
    end
  end
end
