class Photo < ApplicationRecord
  attr_accessor :photo
  
  mount_uploader :photo, PhotoUploader
  belongs_to :user

end
