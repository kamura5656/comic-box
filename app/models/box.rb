class Box < ApplicationRecord
  belongs_to :user
  belongs_to :comic 
  belongs_to :status


  def self.search(search)
    if search != ""
      Box.left_joins(:comic).where('title LIKE(?)', "%#{search}%").or(Box.left_joins(:comic).where('author LIKE(?)', "%#{search}%"))
    else
      Box.left_joins(:comic).all.order('title DESC')
    end

  end
end
