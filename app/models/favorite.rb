class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :law_office
  validates :user_id, uniqueness: { scope: :law_office_id }
end
