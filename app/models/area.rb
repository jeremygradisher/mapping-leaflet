class Area < ApplicationRecord
  belongs_to :map
  validates_presence_of :coords
  has_many :areaimages, dependent: :destroy
  accepts_nested_attributes_for :areaimages
end
