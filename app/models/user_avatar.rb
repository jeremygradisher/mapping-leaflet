class UserAvatar < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  validates_size_of :avatar, maximum: 1.megabytes, message: "Upload should be less than 1MB"
end
