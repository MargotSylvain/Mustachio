# encoding: utf-8

class BackdropPhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
