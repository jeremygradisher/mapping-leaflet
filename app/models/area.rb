class Area < ApplicationRecord
  belongs_to :map
  validates_presence_of :coords
end
