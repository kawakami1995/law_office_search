require 'rails_helper'

RSpec.describe 'Law_offices', type: :system do
  before do
    @law_office1 = FactoryBot.create(:law_office1)
    @law_office2 = FactoryBot.create(:law_office2)
  end

  describe 'GET #index' do
    before do
      visit law_offices_index_path
    end

    it 'ページのタイトルが表示されている' do
      expect(page).to have_title('法律事務所一覧')
    end

    it '法律事務所が一覧として表示されている' do
      expect(page).to have_content(@law_office1.office_name)
      expect(page).to have_content(@law_office2.office_name)
    end

    it '各法律事務所の詳細、変更、削除リンクが表示されている' do
      expect(page).to have_link('詳細', href: law_office_show_path(id: @law_office1.id))
      expect(page).to have_link('変更', href: law_office_edit_path(id: @law_office1.id))
      expect(page).to have_link('削除', href: law_office_destroy_confirm_path(id: @law_office1.id))
      expect(page).to have_link('詳細', href: law_office_show_path(id: @law_office2.id))
      expect(page).to have_link('変更', href: law_office_edit_path(id: @law_office2.id))
      expect(page).to have_link('削除', href: law_office_destroy_confirm_path(id: @law_office2.id))
    end
  end

  describe 'GET #new' do
    before do
      visit law_offices_new_path
    end

    it 'ページのタイトルが表示されている' do
      expect(page).to have_title('法律事務所新規登録')
    end

    it '「※すべての項目を入力してください」という注意書きが表示されている' do
      expect(page).to have_content('※すべての項目を入力してください')
    end

    it '法律事務所新規登録フォームが表示されている' do
      expect(page).to have_content('法律事務所新規登録')
      expect(page).to have_selector('form')
      expect(page).to have_field('office-name')
      expect(page).to have_field('representative-lawyer-name')
      expect(page).to have_field('focus-select')
      expect(page).to have_field('postal-code')
      expect(page).to have_field('address')
      expect(page).to have_field('phone-number')
      expect(page).to have_field('business-hours')
      expect(page).to have_field('office-url')
    end

    it '保存ボタンが表示されている' do
      expect(page).to have_button('保存')
    end
  end

  describe 'POST #create' do 
    it '新しい法律事務所が登録できた場合、法律事務所一覧ページにリダイレクトされる' do
      visit law_offices_new_path
      fill_in 'office-name', with: '王泥喜法律事務所'
      fill_in 'representative-lawyer-name', with: '王泥喜法介'
      select '国際・外国人問題', from: 'focus-select'
      fill_in 'postal-code', with: '1111113'
      fill_in 'address', with: '東京都千代田区1-1-3'
      fill_in 'phone-number', with: '00-0000-0003'
      fill_in 'business-hours', with: '9:00 - 18:00'
      fill_in 'office-url', with: 'http://example.com'
      click_button '保存'
      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(law_offices_index_path)
    end

    it '法律事務所の登録に失敗した場合、法律事務所登録画面を再表示する' do
      visit law_offices_new_path
      fill_in 'office-name', with: ''
      click_button '保存'
      expect(page).not_to have_current_path(law_offices_index_path)
      expect(page).to have_content('法律事務所新規登録')
    end
  end

  describe 'GET #show' do
    before do
      @review1 = FactoryBot.create(:review1)
      @review2 = FactoryBot.create(:review2)
      @review3 = FactoryBot.create(:review3)
      @review4 = FactoryBot.create(:review4)
      visit law_offices_index_path
      click_link('詳細', href: law_office_show_path(id: @law_office1.id))
    end

    it '該当する法律事務所の詳細が表示される' do
      expect(page).to have_content(@law_office1.office_name)
      expect(page).to have_content(@law_office1.representative_lawyer_name)
      expect(page).to have_content(@law_office1.focus)
      expect(page).to have_content(@law_office1.address)
      expect(page).to have_content(@law_office1.phone_number)
      expect(page).to have_content(@law_office1.business_hours)
      expect(page).to have_link(@law_office1.office_name, href: @law_office1.office_url)
    end

    it 'ユーザーアイコンと該当する法律事務所の口コミが表示される' do
      within('.review') do
        expect(page).to have_css('.user-icon')
        expect(page).to have_content(@review1.review)
        expect(page).to have_content(@review3.review)
      end
    end

    it '該当しない法律事務所の詳細は表示されない' do
      within('.law-offices') do
        expect(page).not_to have_content(@law_office2.representative_lawyer_name)
      end
    end

    it '該当しない法律事務所の口コミは表示されない' do
      within('.review') do
        expect(page).not_to have_content(@review2.review)
        expect(page).not_to have_content(@review4.review)
      end
    end
  end

  describe 'GET #edit' do
    before do
      visit law_offices_index_path
      click_link('変更', href: law_office_edit_path(id: @law_office1.id))
    end

    it 'ページのタイトルが表示されている' do
      expect(page).to have_title('法律事務所情報変更')
    end

    it '「※すべての項目を入力してください」という注意書きが表示されている' do
      expect(page).to have_content('※すべての項目を入力してください')
    end
    
    it '法律事務所情報変更フォームが表示されている' do
      expect(page).to have_content('法律事務所情報変更')
      expect(page).to have_selector('form')
      expect(page).to have_field('office-name')
      expect(page).to have_field('representative-lawyer-name')
      expect(page).to have_field('focus-select')
      expect(page).to have_field('postal-code')
      expect(page).to have_field('address')
      expect(page).to have_field('phone-number')
      expect(page).to have_field('business-hours')
      expect(page).to have_field('office-url')
    end

    it '更新ボタンが表示されている' do
      expect(page).to have_button('更新する')
    end

    it '前の画面に戻るためのリンクが表示されている' do
      expect(page).to have_link('戻る')
    end
  end

  describe 'PATCH #update' do
    it '法律事務所の情報を更新できた場合、法律事務所一覧ページにリダイレクトされる' do
      visit law_office_edit_path(@law_office1.id)
      fill_in 'office-name', with: '王泥喜法律事務所'
      fill_in 'representative-lawyer-name', with: '王泥喜法介'
      select '国際・外国人問題', from: 'focus-select'
      fill_in 'postal-code', with: '1111113'
      fill_in 'address', with: '東京都千代田区1-1-3'
      fill_in 'phone-number', with: '00-0000-0003'
      fill_in 'business-hours', with: '9:00 - 18:00'
      fill_in 'office-url', with: 'http://example.com'
      click_button '更新する'
      expect(page).to have_http_status(:success)
      expect(page).to have_current_path(law_offices_index_path)
      expect(page).to have_content('王泥喜法律事務所')
    end

    it '法律事務所の情報の更新に失敗した場合、法律事務所更新画面を再表示する' do
      visit law_office_edit_path(@law_office1.id)
      allow_any_instance_of(LawOffice).to receive(:update).and_return(false)
      fill_in 'office-name', with: '王泥喜法律事務所'
      click_button '更新する'
      expect(page).not_to have_current_path(law_offices_index_path)
      expect(page).to have_content('法律事務所情報変更')
    end
  end

  describe 'GET #destroy_confirm' do
    before do
      visit law_offices_index_path
      click_link('削除', href: law_office_destroy_confirm_path(@law_office1.id))
    end

    it '法律事務所の削除確認ページが表示される' do
      expect(page).to have_content(@law_office1.office_name)
      expect(page).to have_content(@law_office1.representative_lawyer_name)
      expect(page).to have_content(@law_office1.focus)
      expect(page).to have_content(@law_office1.address)
      expect(page).to have_content(@law_office1.phone_number)
      expect(page).to have_content(@law_office1.business_hours)
      expect(page).to have_link(@law_office1.office_name, href: @law_office1.office_url)
      expect(page).to have_content("この法律事務所を削除しますか？")
      expect(page).to have_button("削除する")
      expect(page).to have_button("戻る")
    end

    it '戻るボタンを押すと法律事務所一覧ページに遷移する' do
      click_link '戻る'
      expect(page).to have_current_path(law_offices_index_path)
    end
  end

  describe 'DELETE #destroy' do
    before do
      visit law_office_destroy_confirm_path(@law_office1.id)
    end

    it '削除するボタンを押すと該当する法律事務所のデータが削除され、法律事務所一覧ページに遷移される' do
      click_link '削除する'
      expect(page).to have_current_path(law_offices_index_path)
      expect(page).not_to have_content(@law_office1.office_name)
    end
  end

  describe 'GET #search' do
    before do
      visit root_path
    end

    it '選択した都道府県と合致する法律事務所の件数および情報が表示される' do
      select '東京都', from: 'focus-select-prefectures'
      click_button '検索', id: 'enter-prefecture'
      expect(page).to have_content("1件見つかりました")
      expect(page).to have_content(@law_office1.office_name)
      expect(page).not_to have_content(@law_office2.office_name)
    end

    it '選択した注力分野と合致する法律事務所の件数および情報が表示される' do
      select '交通事故', from: 'focus-select-cases'
      click_button '検索', id: 'enter-case'
      expect(page).to have_content("1件見つかりました")
      expect(page).to have_content(@law_office2.office_name)
      expect(page).not_to have_content(@law_office1.office_name)
    end
  end
end
