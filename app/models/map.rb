class Map < ApplicationRecord
  belongs_to :user
  has_many :mapimages, dependent: :destroy
  accepts_nested_attributes_for :mapimages
  has_many :areas, dependent: :destroy
end
