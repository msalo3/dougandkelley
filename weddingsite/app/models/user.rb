class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  mount_uploader :pic, PicUploader
end
