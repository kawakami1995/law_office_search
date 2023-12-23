class Review < ApplicationRecord
  validates :review, presence: true
  belongs_to :law_office
end
