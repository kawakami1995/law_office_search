class LawOffice < ApplicationRecord
  validates :office_name, presence: true
  validates :representative_lawyer_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :phone_number, presence: true
  validates :business_hours, presence: true
  validates :office_url, presence: true
end
