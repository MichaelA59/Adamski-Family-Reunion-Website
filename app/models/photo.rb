class Photo < ApplicationRecord

  mount_uploader :photo, UserPhotoUploader
  belongs_to :user

end
