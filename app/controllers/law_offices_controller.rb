class LawOfficesController < ApplicationController
  def index
    @user = current_user
    @law_offices = LawOffice.includes(:reviews)
                .left_joins(:reviews)
                .group('law_offices.id')
                .select('law_offices.*, COALESCE(AVG(reviews.star), 0) AS average_star')
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
    average_star_value = @reviews.average(:star)

    if average_star_value.present?
      @average_star = average_star_value.to_f
    else
      @average_star = 0
    end
    
    if @user.present?
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
    @law_offices = LawOffice.includes(:reviews)
                  .left_joins(:reviews)
                  .where("office_name like ? and address like ? and focus like ?", "%#{params[:office_name]}%", "#{params[:prefectures]}%", "%#{params[:focus]}%" )
                  .group('law_offices.id')
                  .select('law_offices.*, COALESCE(AVG(reviews.star), 0) AS average_star')
                  
    case params[:sort]
    when 'address'
      @law_offices = @law_offices.order(:postal_code)
    when 'review'
      @law_offices = @law_offices.order('average_star DESC')
    else
      @law_offices = @law_offices.order(:postal_code)
    end

    @law_offices_count = LawOffice.where("office_name like ? and address like ? and focus like ?", "%#{params[:office_name]}%", "#{params[:prefectures]}%", "%#{params[:focus]}%").pluck(:id).count
  end
end
