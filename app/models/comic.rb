class Comic < ApplicationRecord
  has_many :boxes
  has_one_attached :image


  def self.search(search)
    if search != ""
      Comic.where('title LIKE(?)', "%#{search}%").or(Comic.where('author LIKE(?)', "%#{search}%"))
    else
      Comic.all
    end
  end

end
