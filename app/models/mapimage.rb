class Mapimage < ApplicationRecord
  #belongs_to :map
  mount_uploader :mapimage, MapimageUploader
  belongs_to :map
  validates_size_of :mapimage, maximum: 2.megabytes, message: "Upload should be less than 2MB"
end
