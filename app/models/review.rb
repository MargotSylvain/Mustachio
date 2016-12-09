class Review < ApplicationRecord
  belongs_to :user
  belongs_to :collection

  validates :my_rating, :phrase, presence: true
  # validates :collection, uniqueness: {scope: :user}
end
