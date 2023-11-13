class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password_confirmation, presence: true, on: :create
end
