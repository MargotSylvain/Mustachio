class Tag < ApplicationRecord
  has_many :tag_collections, dependent: :destroy
  has_many :collections, through: :tag_collections

  validates :tag, presence: true
end
