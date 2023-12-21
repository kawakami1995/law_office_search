class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password_confirmation, presence: true, on: :create
  has_many :favorites, dependent: :destroy
  # has_many :favorited_law_offices, through: :favorites, source: :law_office

  # def favorite(law_office)
  #   favorited_law_offices << law_office
  # end

  # def unfavorite(law_office)
  #   favorited_law_offices.destroy(law_office)
  # end

  # def favorited?(law_office)
  #   favorited_law_offices.include?(law_office)
  # end
end
