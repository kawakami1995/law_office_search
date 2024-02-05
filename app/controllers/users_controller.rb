class UsersController < ApplicationController
  def account
    @user = current_user
    @reviews = Review.where(user_id: @user.id).order(updated_at: :desc)
    @favorites = Favorite.where(user_id: @user.id)
    favorite_ids = Favorite.where(user_id: @user.id).pluck(:law_office_id)
    @law_offices = LawOffice.includes(:reviews)
                            .left_joins(:reviews)
                            .where(id: favorite_ids)
                            .group('law_offices.id')
                            .select('law_offices.*, COALESCE(AVG(reviews.star), 0) AS average_star')
                            .order(:postal_code)
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
