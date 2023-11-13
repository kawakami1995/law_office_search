class UsersController < ApplicationController
  def account
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:user_name, :email_address, :password))
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def user_name_edit
    @user = current_user
  end

  def user_name_update
    @user = current_user
    if @user.update(params.require(:user).permit(:user_name))
      redirect_to "/users/account"
    else
      render "user_name_edit"      
    end
  end
end
