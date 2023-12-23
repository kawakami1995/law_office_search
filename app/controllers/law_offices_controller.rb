class LawOfficesController < ApplicationController
  def index
    @user = current_user
    @law_offices = LawOffice.all
  end

  def new
    @user = current_user
    @law_office = LawOffice.new
  end

  def create
    @user = current_user
    @law_office = LawOffice.new(params.require(:law_office).permit(:office_name, :representative_lawyer_name, :focus, :postal_code, :address, :latitude, :longitude, :phone_number, :business_hours, :office_url))
    if @law_office.save
      redirect_to law_offices_index_path
    else
      render "new"
    end
  end

  def show
    @user = current_user
    @law_office = LawOffice.find_by(id: params[:id])
    @reviews = Review.where(law_office_id: @law_office.id)
    if @user.nil?
      @favorite = nil
    else
      @favorite = Favorite.find_by(user_id: @user.id, law_office_id: @law_office.id)
    end
  end

  def edit
    @user = current_user
    @law_office = LawOffice.find_by(id: params[:id])
  end

  def update
    @user = current_user
    @law_office = LawOffice.find_by(id: params[:id])
    if @law_office.update(params.require(:law_office).permit(:office_name, :representative_lawyer_name, :focus, :postal_code, :address, :latitude, :longitude, :phone_number, :business_hours, :office_url))
      redirect_to law_offices_index_path
    else
      render "edit"
    end
  end

  def destroy_confirm
    @user = current_user
    @law_office = LawOffice.find_by(id: params[:id])
  end

  def destroy
    @user = current_user
    @law_office = LawOffice.find_by(id: params[:id])
    @law_office.destroy
    redirect_to law_offices_index_path
  end

  def search
    @user = current_user
    @law_offices = LawOffice.where("office_name like ? and address like ? and focus like ?", "%#{params[:office_name]}%", "#{params[:prefectures]}%", "%#{params[:focus]}%" ).order(:postal_code)
  end
end