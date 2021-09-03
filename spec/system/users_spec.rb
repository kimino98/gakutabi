require 'rails_helper'

RSpec.describe "新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザーが新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[company_name]', with: @user.company_name
      find('#user_profession_id').find("option[value='#{@user.profession_id}']").select_option
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {User.count}.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      fill_in 'user[company_name]', with: ''
      find('#user_profession_id').find("option[value='1']").select_option
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect { 
        find('input[name="commit"]').click 
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができる時' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンやログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_link('ログイン')
    end
  end
  context 'ログインができない時' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ遷移する
      visit new_user_session_path
      # ユーザー情報を入力する
      fill_in 'user[email]', with: ''
      fill_in 'user[password]', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'ユーザー情報編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ユーザー情報が編集できる時' do
    it '正しい情報を入力すればユーザー情報が編集され、ユーザー詳細ページが更新される' do
      # ログインする
      sign_in(@user)
      # ユーザー詳細ページへ遷移する
      visit user_path(@user)
      # ユーザー詳細ページにユーザー情報を編集するページへ遷移するボタンがあることを確認する
      expect(page).to have_content('プロフィール編集')
      # ユーザー情報編集ページへ遷移する
      visit edit_user_path(@user)
      # ユーザー情報を入力する（自己紹介も）
      fill_in 'user[nickname]', with: 'テスト先生'
      fill_in 'user[password]', with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[company_name]', with: 'テスト高校'
      fill_in 'user[profile]', with: 'こんにちは'
      find('#user_profession_id').find("option[value='4']").select_option
      # 編集完了ボタンを押す
      find('input[name="commit"]').click
      # ユーザー詳細ページへ遷移した事を確認する
      expect(current_path).to eq user_path(@user)
      # 編集された箇所が表示されている事を確認する
      expect(page).to have_content('テスト先生')
      expect(page).to have_content('テスト高校')
      expect(page).to have_content('こんにちは')
      expect(page).to have_content('高校教諭')
    end
  end
  context 'ユーザー情報が編集できない時' do
    it '正しい情報が入力されなければ、編集できない' do
      # ログインする
      sign_in(@user)
      # ユーザー詳細ページへ遷移する
      visit user_path(@user)
      # ユーザー詳細ページにユーザー情報を編集するページへ遷移するボタンがあることを確認する
      expect(page).to have_content('プロフィール編集')
      # ユーザー情報編集ページへ遷移する
      visit edit_user_path(@user)
      # ユーザー情報を入力する（自己紹介も）
      fill_in 'user[nickname]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      fill_in 'user[company_name]', with: ''
      fill_in 'user[profile]', with: ''
      find('#user_profession_id').find("option[value='1']").select_option
      # 編集完了ボタンを押す
      find('input[name="commit"]').click
      # 編集ページに戻る事を確認する
      expect(current_path).to eq user_path(@user)
    end
  end
end
