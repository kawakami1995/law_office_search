class LawOffice < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :office_name, presence: true
  validates :representative_lawyer_name, presence: true
  validates :postal_code, presence: true, numericality: {only_integer: true}, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :business_hours, presence: true
  validates :office_url, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
