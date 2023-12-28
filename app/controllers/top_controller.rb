class TopController < ApplicationController
  def index
    @user = current_user
    @reviews = Review.order(updated_at: :desc).limit(5)
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.user_name = 'ゲスト'
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
    sign_in user
    redirect_to root_path
  end
end
