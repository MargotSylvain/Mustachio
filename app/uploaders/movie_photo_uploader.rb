# encoding: utf-8

class MoviePhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
