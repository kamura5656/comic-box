class Comic < ApplicationRecord
  has_many :boxes
  has_one_attached :image

  with_options presence: true do
    validates :image
  end
end
