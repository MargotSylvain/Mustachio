# encoding: utf-8

class UserPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
