require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    sign_in @user1
  end
  
  describe 'GET #account' do
    before do
      @law_office1 = FactoryBot.create(:law_office1)
      @law_office2 = FactoryBot.create(:law_office2)
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

      it '口コミのリンクが正しく表示されている' do
        expect(page).to have_link(@review1.law_office.office_name, href: law_office_show_path(@review1.law_office))
        expect(page).to have_link(@review2.law_office.office_name, href: law_office_show_path(@review2.law_office))
      end
  
      it 'ユーザーアイコン、レビューの星、口コミの更新日が表示されている' do
        within('.review-box') do
          expect(page).to have_css('.user-icon')
          expect(page).to have_content(@review1.updated_at.strftime("%Y年%m月%d日"))
          expect(page).to have_css('.review-star-read')
        end
      end

      it 'ユーザーIDに合致する口コミが表示されている' do
        expect(page).to have_content @review1.review
        expect(page).to have_content @review2.review
      end

      it 'ユーザーIDに合致しない口コミは表示されない' do
        expect(page).not_to have_content @review3.review
        expect(page).not_to have_content @review4.review
      end

      it 'お気に入り登録した事務所の情報のみが表示される' do
        @law_office1 = FactoryBot.create(:law_office1)
        @law_office2 = FactoryBot.create(:law_office2)
        visit law_office_show_path(@law_office1.id)
        click_button 'お気に入り登録'
        visit account_path(@user1.id)
        within '.favorite' do
          expect(page).to have_content @law_office1.office_name
          expect(page).not_to have_content @law_office2.office_name
        end
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
        expect(page).to have_content('naruhodo')
      end
    end
  end

  describe 'PATCH #email_update' do
    it 'メールアドレスが更新できている' do
      visit email_edit_path(@user1.id)
      fill_in 'email-form', with: 'naruhodo@gmail.com'
      click_button '更新'
      within '.user-account' do
        expect(page).to have_content('naruhodo@gmail.com')
      end
    end
  end

  describe 'GET #destroy_confirm' do
    before do
      visit user_destroy_confirm_path(@user1.id)
    end

    it 'アカウント削除確認画面にアクセスできる' do
      expect(page).to have_content('このアカウントを削除しますか？')
    end

    it '削除しようとしているアカウントのユーザー名が表示されている' do
      expect(page).to have_content(@user1.user_name)
    end

    it '削除しようとしているアカウントのメールアドレスが表示されている' do
      expect(page).to have_content(@user1.email)
    end
  end

  describe 'DELETE #user_destroy' do
    it 'アカウントを削除することができる' do
      visit user_destroy_confirm_path(@user1.id)
      expect(User.exists?(@user1.id)).to be_truthy
      click_link 'アカウントを削除する'
      expect(User.exists?(@user1.id)).to be_falsey
    end
  end
end
