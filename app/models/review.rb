class Review < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validates :my_rating, :phrase, presence: true
  validates :my_rating, inclusion: {in: (1..5)}
  validates :collection, uniqueness: {scope: :user}
end
