class Movie < ApplicationRecord
  mount_uploader :backdrop, BackdropPhotoUploader
  mount_uploader :photo, MoviePhotoUploader
  has_many :collections
  has_many :users, through: :collections

  validates :title, :year, presence: true
  validates :title, uniqueness: {scope: :year}
end
