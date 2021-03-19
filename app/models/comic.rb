class Comic < ApplicationRecord
  has_many :boxes
  has_one_attached :image
end
