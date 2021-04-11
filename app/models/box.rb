class Box < ApplicationRecord
  belongs_to :user
  belongs_to :comic, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :statu, optional: true

  with_options presence: true do
    validates :comic_id
  end

  def self.search(search)
    if search != ''
      Box.left_joins(:comic).where('title LIKE(?)',
                                   "%#{search}%").or(Box.left_joins(:comic).where('author LIKE(?)', "%#{search}%"))
    else
      Box.left_joins(:comic).all.order('title DESC')
    end
  end
end
