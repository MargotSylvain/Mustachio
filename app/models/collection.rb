class Collection < ApplicationRecord
  belongs_to :movie, dependent: :destroy
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :tags, through: :tag_collections
  has_many :tag_collections, dependent: :destroy

  validates :movie_id, :user_id, presence: true
  validates :movie_id, uniqueness: {scope: :user_id}
end
