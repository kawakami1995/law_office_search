require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it 'ユーザー名が必須である' do
      user = build(:user1, user_name: nil)
      expect(user).to_not be_valid
      expect(user.errors[:user_name]).to include('を入力してください')
    end

    it 'メールアドレスが必須である' do
      user = build(:user1, email: nil)
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'パスワードが必須である' do
      user = build(:user1, password: nil)
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include('を入力してください')
    end

    it 'パスワードは6文字以上入力する必要がある' do
      user = build(:user1, password: 'aa')
      expect(user).to_not be_valid
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end

    it 'パスワード確認が必須である' do
      user = build(:user1, password_confirmation: nil)
      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to include('を入力してください')
    end

    it 'パスワード確認が必須である' do
      user = build(:user1, password: 'aaaaaa', password_confirmation: 'bbbbbb')
      expect(user).to_not be_valid
      expect(user.errors[:password_confirmation]).to include(/入力が一致しません/)
    end
  end

  describe 'アクション' do
    before do
      @user1 = create(:user1)
    end

    it 'ユーザー名が更新できる' do
      new_user_name = 'New User Name'
      @user1.update(user_name: new_user_name)
      expect(@user1.reload.user_name).to eq(new_user_name)
    end

    it 'メールアドレスが更新できる' do
      new_email = 'new_email@example.com'
      @user1.update(email: new_email)
      expect(@user1.reload.email).to eq(new_email)
    end

    it 'ユーザーが削除できる' do
      expect {
        @user1.destroy
      }.to change(User, :count).by(-1)
    end
  end
end
