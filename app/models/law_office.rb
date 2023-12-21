class LawOffice < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :office_name, presence: true
  validates :representative_lawyer_name, presence: true
  validates :postal_code, presence: true, numericality: {only_integer: true}, length: { is: 7 }
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A[\d\-]+\z/, message: "は半角数字またはハイフンのみ入力できます" }
  validates :business_hours, presence: true
  validates :office_url, presence: true
  validates :focus, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
end
