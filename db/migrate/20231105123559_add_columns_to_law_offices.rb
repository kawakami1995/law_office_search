class AddColumnsToLawOffices < ActiveRecord::Migration[6.1]
  def change
    add_column :law_offices, :office_name, :string
    add_column :law_offices, :representative_lawyer_name, :string
    add_column :law_offices, :postal_code, :string
    add_column :law_offices, :address, :string
    add_column :law_offices, :latitude, :float
    add_column :law_offices, :longitude, :float
    add_column :law_offices, :phone_number, :string
    add_column :law_offices, :business_hours, :string
    add_column :law_offices, :office_url, :text
  end
end
