class Review < ApplicationRecord
  validates :review, presence: true
end
