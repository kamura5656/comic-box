class Box < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :statu, optional: true


  def self.search(search)
    if search != ""
      Box.left_joins(:comic).where('title LIKE(?)', "%#{search}%").or(Box.left_joins(:comic).where('author LIKE(?)', "%#{search}%"))
    else
      Box.left_joins(:comic).all.order('title DESC')
    end

  end
end
