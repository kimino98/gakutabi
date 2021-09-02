require 'rails_helper'

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.build(:review)
  end

  context '投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿でき、正しく入力するとトップページに投稿が表示される' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('投稿')
      # 投稿ページに移動する
      visit new_review_path
      # フォームに情報を入力する
      fill_in 'review[faclity_name]', with: @review.faclity_name
      find('#review_event_id').find("option[value='#{@review.event_id}']").select_option
      find('#review_hotel_type_id').find("option[value='#{@review.hotel_type_id}']").select_option
      find('#review_grade_id').find("option[value='#{@review.grade_id}']").select_option
      find('#review_season_id').find("option[value='#{@review.season_id}']").select_option
      find('#review_region_id').find("option[value='#{@review.region_id}']").select_option
      find('#review_student_count_id').find("option[value='#{@review.student_count_id}']").select_option
      fill_in 'review[price]', with: @review.price
      fill_in 'review[text]', with: @review.text
      fill_in 'review[safety]', with: @review.safety
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('review[images][]', image_path, make_visible: true)
      # 送信するとTweetモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Review.count }.by(1)
      # 投稿一覧ページに遷移することを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど投稿した内容の投稿が存在することを確認する
      expect(page).to have_content(@review.faclity_name)
    end
  end
  context '新規練習投稿できないとき' do
    it 'ログインしないと投稿できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('投稿')
    end
    it 'ログインしたユーザーが新規投稿ページで正しく入力しないと投稿できない' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('投稿')
      # 投稿ページに移動する
      visit new_review_path
      # フォームに情報を入力する
      fill_in 'review[faclity_name]', with: ''
      find('#review_event_id').find("option[value='1']").select_option
      find('#review_hotel_type_id').find("option[value='1']").select_option
      find('#review_grade_id').find("option[value='1']").select_option
      find('#review_season_id').find("option[value='1']").select_option
      find('#review_region_id').find("option[value='1']").select_option
      find('#review_student_count_id').find("option[value='1']").select_option
      fill_in 'review[price]', with: ''
      fill_in 'review[text]', with: ''
      fill_in 'review[safety]', with: ''
      # 投稿ボタンを押してもreviewモデルのカウントは上がらないことを確認する
      expect { 
        find('input[name="commit"]').click 
      }.to change { Review.count }.by(0)
    end
  end
end

