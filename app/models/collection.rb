class Collection < ApplicationRecord
  belongs_to :movie
  belongs_to :user, dependent: :destroy

  has_many :tags, through: :tag_collections
  has_many :tag_collections

  validates :movie_id, :user_id, presence: true
  validates :movie_id, uniqueness: {scope: :user_id}
end
