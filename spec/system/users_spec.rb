require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    sign_in @user1
  end

  describe 'GET #account' do
    before do
      @review1 = FactoryBot.create(:review1)
      @review2 = FactoryBot.create(:review2)
      @review3 = FactoryBot.create(:review3)
      @review4 = FactoryBot.create(:review4)
      visit account_path(@user1.id)
    end
    
    describe 'アカウントページの表示' do 
      it 'ユーザー名が表示されている' do
        expect(page).to have_content @user1.user_name
      end

      it 'メールアドレスが表示されている' do
        expect(page).to have_content @user1.email
      end

      it 'ユーザーIDに合致する口コミが表示されている' do
        expect(page).to have_content @review1.review
        expect(page).to have_content @review2.review
      end

      it 'ユーザーIDに合致しない口コミは表示されない' do
        expect(page).not_to have_content @review3.review
        expect(page).not_to have_content @review4.review
      end
    end
  end

  describe 'GET #user_name_edit' do
    before do
      visit user_name_edit_path(@user1.id)
    end

    it 'ユーザー名変更ページにアクセスできる' do
      expect(page).to have_content('ユーザー名編集')
    end

    it '戻るボタンを押すとマイページに戻ることができる' do
      click_link '戻る'
      expect(page).to have_content('マイページ')
    end
  end

  describe 'GET #email_edit' do
    before do
      visit email_edit_path(@user1.id)
    end

    it 'メールアドレス変更ページにアクセスできる' do
      expect(page).to have_content('メールアドレス編集')
    end

    it '戻るボタンを押すとマイページに戻ることができる' do
      click_link '戻る'
      expect(page).to have_content('マイページ')
    end
  end

  describe 'PATCH #user_name_update' do
    it 'ユーザー名が更新できている' do
      visit user_name_edit_path(@user1.id)
      fill_in 'user-name-form', with: 'naruhodo'
      click_button '更新'
      within '.user-account' do
        expect(page).to have_content ('naruhodo')
      end
    end
  end

  describe 'PATCH #email_update' do
    it 'メールアドレスが更新できている' do
      visit email_edit_path(@user1.id)
      fill_in 'email-form', with: 'naruhodo@gmail.com'
      click_button '更新'
      within '.user-account' do
        expect(page).to have_content ('naruhodo@gmail.com')
      end
    end
  end
end
