require 'rails_helper'

RSpec.describe 'reviews', type: :system do
  before do
    @user1 = FactoryBot.create(:user1)
    @law_office1 = FactoryBot.create(:law_office1)
  end

  describe 'GET #index' do
    it '口コミの一覧が表示される' do
      @law_office2 = FactoryBot.create(:law_office2)
      @review1 = FactoryBot.create(:review1)
      @review2 = FactoryBot.create(:review2)
      visit reviews_index_path
      expect(page).to have_content(@review1.review)
      expect(page).to have_content(@review2.review)
    end
  end

  describe 'GET #new' do
    it 'ユーザーがログインしていない場合、ログインページにリダイレクトする' do
      visit law_office_show_path(@law_office1.id)
      click_link '口コミを投稿する'
      expect(page).to have_current_path(law_office_show_path(@law_office1.id))
      expect(page).to have_content('口コミを投稿するにはログインまたは新規登録が必要です')
    end

    it 'ユーザーがログインしている場合、新規投稿ページを表示する' do
      sign_in @user1
      visit law_office_show_path(@law_office1.id)
      click_link '口コミを投稿する'
      expect(page).to have_current_path(reviews_new_path(law_office_id: @law_office1.id))
      expect(page).to have_content('口コミ投稿')
      expect(page).to have_css('#star')
    end
  end

  describe 'POST #create ', js: true do
    before do
      sign_in @user1
      visit reviews_new_path(law_office_id: @law_office1.id)
    end
    
    it '新しい口コミを作成すること' do
      fill_in 'review', with: 'テスト'
      find('img[alt="3"]').click
      click_button '投稿'
      expect(page).to have_current_path(law_office_show_path(@law_office1.id))
      expect(page).to have_content('テスト')
    end

    it '口コミの保存に失敗した場合、新規投稿ページを表示すること' do
      fill_in 'review', with: ''
      click_button '投稿'
      expect(page).not_to have_current_path(law_office_show_path(@law_office1.id))
      expect(page).to have_content('口コミ投稿')
    end
  end

  describe 'DELETE #destroy' do
    it '口コミを削除すること' do
      @review1 = FactoryBot.create(:review1)
      visit reviews_index_path(@review1.id)
      click_link '削除'
      expect(page).not_to have_content('先生のお陰で勝訴することができました。')
    end
  end

  describe 'PATCH #update ', js: true do
  before do
    sign_in @user1
    @review1 = FactoryBot.create(:review1)
    visit account_path(@user1.id)
    click_button '編集'
  end
  
  it '口コミが編集できること' do 
    fill_in 'review', with: '更新しました'
    find('img[alt="2"]').click
    click_button '更新'
    expect(page).to have_current_path(account_path(@user1.id))
    expect(page).to have_content('更新しました')
  end

  it '口コミの更新に失敗した場合、口コミ編集ページを表示すること' do
    fill_in 'review', with: ''
    click_button '更新'
    expect(page).not_to have_current_path(account_path(@user1.id))
    expect(page).to have_content('口コミ投稿')
    expect(page).to have_content('レビューを入力してください')
  end
end
end
