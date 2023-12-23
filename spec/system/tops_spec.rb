require 'rails_helper'

RSpec.describe 'top', type: :system do
  it 'ゲストユーザーとして正常にログインできる' do
    visit root_path
    click_on 'ゲストログイン'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'マイページ'
  end

  describe 'index' do
    before do
      @law_office1 = FactoryBot.create(:law_office1)
      @law_office2 = FactoryBot.create(:law_office2)
      @review1 = FactoryBot.create(:review1)
      @review2 = FactoryBot.create(:review2)
      @review3 = FactoryBot.create(:review3)
      @review4 = FactoryBot.create(:review4)
      @review5 = FactoryBot.create(:review5)
      @review6 = FactoryBot.create(:review6)
      visit root_path
    end

    it '最新の口コミが5つ表示されている' do
      expect(page).not_to have_content(@review1.review)
      expect(page).to have_content(@review2.review)
      expect(page).to have_content(@review3.review)
      expect(page).to have_content(@review4.review)
      expect(page).to have_content(@review5.review)
      expect(page).to have_content(@review6.review)
    end

    it '口コミのリンクが正しく表示されている' do
      expect(page).to have_link(@review1.law_office.office_name, href: law_office_show_path(@review1.law_office))
      expect(page).to have_link(@review2.law_office.office_name, href: law_office_show_path(@review2.law_office))
    end

    it '口コミの法律事務所名をクリックすると該当する法律事務所の詳細ページに遷移する' do
      click_link @review1.law_office.office_name
      expect(page).to have_current_path(law_office_show_path(@review1.law_office_id))
    end
  end
end
