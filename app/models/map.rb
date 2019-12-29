class Map < ApplicationRecord
  belongs_to :user
  has_many :mapimages, dependent: :destroy
  accepts_nested_attributes_for :mapimages
end
