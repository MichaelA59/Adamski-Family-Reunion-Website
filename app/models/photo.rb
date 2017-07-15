class Photo < ApplicationRecord
  attr_accessor :photo

  mount_uploaders :photos, PhotosUploader
  belongs_to :user

end
