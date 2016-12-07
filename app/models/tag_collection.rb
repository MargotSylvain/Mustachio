class TagCollection < ApplicationRecord
  belongs_to :collection, dependent: :destroy
  belongs_to :tag
  # ^ was not added in the migration

  has_many :movies, through: :collections

  validates :tag_id, :collection_id, presence: true
  # ^ not sure this is needed if referenced
end
