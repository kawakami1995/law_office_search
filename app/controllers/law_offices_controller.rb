class LawOfficesController < ApplicationController
  def index
    @law_offices = LawOffice.all
  end

  def new
    @law_office = LawOffice.new
  end

  def create
    @law_office = LawOffice.new(params.require(:law_office).permit(:office_name, :representative_lawyer_name, :postal_code, :address, :latitude, :longitude, :phone_number, :business_hours, :office_url))
    if @law_office.save
      redirect_to law_offices_index_path
    else
      render "new"
    end
  end

  def edit
    @law_office = LawOffice.find_by(id: params[:id])
  end

  def update
    @law_office = LawOffice.find_by(id: params[:id])
    if @law_office.update(params.require(:law_office).permit(:office_name, :representative_lawyer_name, :postal_code, :address, :latitude, :longitude, :phone_number, :business_hours, :office_url))
      redirect_to law_offices_index_path
    else
      render "edit"
    end
  end
end
