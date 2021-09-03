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
      # 送信するとreviewモデルのカウントが1上がることを確認する
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

RSpec.describe "投稿編集", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review, user_id: @user.id)
    @another = FactoryBot.create(:user)
  end
  context '投稿編集ができるとき'do
    it 'ログイン後自分の投稿詳細ページから編集ボタンを押して編集ページに遷移し、正しく入力すると投稿が編集される' do
      # ログインする
      sign_in(@user)
      # 自分の投稿であることを確認する
      expect(page).to have_content(@review.faclity_name)
      # 詳細ページに遷移
      visit review_path(@review)
      # 編集ボタン確認
      expect(page).to have_content('編集する')
      # 編集ページへ遷移
      visit edit_review_path(@review)
      # 編集内容情報を入力する
      fill_in 'review[faclity_name]', with: '変更しました'
      find('#review_hotel_type_id').find("option[value='#{@review.hotel_type_id}']").select_option
      find('#review_grade_id').find("option[value='#{@review.grade_id}']").select_option
      find('#review_season_id').find("option[value='#{@review.season_id}']").select_option
      find('#review_region_id').find("option[value='#{@review.region_id}']").select_option
      find('#review_student_count_id').find("option[value='#{@review.student_count_id}']").select_option
      fill_in 'review[price]', with: @review.price
      fill_in 'review[text]', with: '変更'
      fill_in 'review[safety]', with: '変更'
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('review[images][]', image_path, make_visible: true)
      # 編集完了ボタンを押す
      find('input[name="commit"]').click
      # 一覧ページへ遷移した事を確認する
      expect(current_path).to eq(root_path)
      # 編集された箇所が表示されている事を確認する
      expect(page).to have_content('変更')
    end
  end
  context '投稿編集できないとき' do
    it 'ログイン後、投稿詳細ページから編集ボタンを押して編集ページに遷移し、誤った入力すると編集できない' do
      # ログインする
      sign_in(@user)
      # 自分の投稿であることを確認する
      expect(page).to have_content(@review.faclity_name)
      # 詳細ページに遷移
      visit review_path(@review)
      # 編集ボタン確認
      expect(page).to have_content('編集する')
      # 編集ページへ遷移
      visit edit_review_path(@review)
      # 編集内容情報を入力する
      fill_in 'review[faclity_name]', with: ''
      fill_in 'review[price]', with: ''
      fill_in 'review[text]', with: ''
      fill_in 'review[safety]', with: ''
      # 編集完了ボタンを押す
      find('input[name="commit"]').click
    end
    it '自分以外の投稿は編集ボタンがないのでできない' do
      # 別のユーザーでサインイン
      sign_in(@another)
      # 詳細ページに遷移
      visit review_path(@review)
      # 編集ボタンがないことを確認
      expect(page).to have_no_content('編集する')
    end
    it 'ログインしないと詳細ページには遷移できるが編集ページに遷移することはできない' do
      # トップページ
      visit root_path
      # 詳細ページに遷移
      visit review_path(@review)
      # 編集ボタンがないことを確認
      expect(page).to have_no_content('編集する')
    end
  end
end

describe '投稿削除' do
  before do
    @user = FactoryBot.create(:user)
    @review = FactoryBot.create(:review, user_id: @user.id)
    @another = FactoryBot.create(:user)
  end
  context '投稿削除できるとき' do
    it 'ログイン後、投稿詳細ページから自分の投稿を削除できる' do
      # ログインする
      sign_in(@user)
      # 自分の投稿であることを確認する
      expect(page).to have_content(@review.faclity_name)
      # 詳細ページに遷移
      visit review_path(@review)
      # 削除ボタン確認
      expect(page).to have_content('削除する')
      # 投稿を削除するとreviewモデルのカウントが1下がることを確認する
      expect{
        click_on('削除する')
        expect(page.accept_confirm).to eq '本当に削除しますか?'
        sleep 0.5
      }.to change { Review.count }.by(-1)
      # 投稿一覧ページに遷移
      expect(current_path).to eq(root_path)
      # 削除しましたを確認
      expect(page).to have_content('削除しました')
    end
  end
  context '投稿削除できないとき' do
    it '自分以外の投稿は削除ボタンがないのでできない' do
      # 別のユーザーでサインイン
      sign_in(@another)
      # 詳細ページに遷移
      visit review_path(@review)
      # 編集ボタンがないことを確認
      expect(page).to have_no_content('削除する')
    end
    it 'ログインしないと詳細ページには遷移できるが削除することはできない' do
       # トップページ
       visit root_path
       # 詳細ページに遷移
       visit review_path(@review)
       # 編集ボタンがないことを確認
       expect(page).to have_no_content('削除する')
    end
  end
end

