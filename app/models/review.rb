class Review < ApplicationRecord
  validates :review, presence: true
  validates :star, presence: true
  belongs_to :law_office
end
