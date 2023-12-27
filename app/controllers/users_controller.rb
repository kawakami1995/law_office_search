class UsersController < ApplicationController
  def account
    @user = current_user
    @reviews = Review.where(user_id: @user.id).order(created_at: :desc)
    @favorites = Favorite.where(user_id: @user.id)
    favorite_ids = @favorites.pluck(:law_office_id)
    @law_offices = LawOffice.where(id: favorite_ids).order(:postal_code)
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

  def email_edit
    @user = current_user
  end

  def email_update
    @user = current_user
    if @user.update(params.require(:user).permit(:email))
      redirect_to "/users/account"
    else
      render "email_edit"      
    end
  end

  def destroy_confirm
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end
end
