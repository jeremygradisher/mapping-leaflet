class Areaimage < ApplicationRecord
    mount_uploader :areaimage, AreaimageUploader
    belongs_to :area
    validates_size_of :areaimage, maximum: 2.megabytes, message: "Upload should be less than 2MB"
end
