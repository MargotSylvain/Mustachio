class Tag < ApplicationRecord
  has_many :tag_collections, dependent: :destroy
  has_many :collections, through: :tag_collections
  has_many :movies

  validates :name, presence: true
end
