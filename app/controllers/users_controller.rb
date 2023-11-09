class UsersController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
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
end
