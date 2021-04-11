require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do 
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # メインページ
      visit root_path
      # 新規登録ボタン押下・移動
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      # 情報入力・登録ボタン押下・カウントアップ
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      expect{
      find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # メインページに戻る・ボタンの表示変更
      expect(current_path).to eq(root_path)
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_content('ログアウト')
    end
  end
end

# テストコード実行
# bundle exec rspec spec/system/users_spec.rb
