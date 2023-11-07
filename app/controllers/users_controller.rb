class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :email_address, :password))
    if @user.save
      redirect_to "/user/index"
    else
      render "new"
    end
  end
end
