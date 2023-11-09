class User < ApplicationRecord
  validates :user_name, presence: true
  validates :email_address, presence: true
  validates :password, presence: true
end
