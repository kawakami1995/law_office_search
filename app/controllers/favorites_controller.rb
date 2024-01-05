class FavoritesController < ApplicationController
  def create
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @favorite = Favorite.new(user_id: params[:user_id], law_office_id: params[:law_office_id])
      @favorite.save
      redirect_to law_office_show_path(@favorite.law_office_id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: params[:user_id], law_office_id: params[:law_office_id])
    @favorite.destroy
    redirect_to law_office_show_path(@favorite.law_office_id)
  end

  private

  def set_law_office
    @law_office = LawOffice.find(params[:law_office_id])
  end
end
