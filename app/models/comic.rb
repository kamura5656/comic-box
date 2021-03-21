class Comic < ApplicationRecord
  has_many :boxes
  has_one_attached :image

  with_options presence: true do
    validates :image
  end

  def self.search(search)
    if search != ""
      Comic.where('title LIKE(?)', "%#{search}%")
    else
      Comic.all
    end
  end
end
