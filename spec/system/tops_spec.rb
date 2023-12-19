require 'rails_helper'

RSpec.describe 'top', type: :system do
  it 'ゲストユーザーとして正常にログインできる' do
    visit root_path
    click_on 'ゲストログイン'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content 'マイページ'
  end
end
