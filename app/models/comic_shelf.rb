class ComicShelf
  include ActiveModel::Model
  attr_accessor :image, :title, :author, :user_ids, :volume, :status_id

  with_options presence: true do
    validates :title
    validates :author
    validates :volume, numericality: { only_integer: true }
    validates :image
  end

  def save
    comic = Comic.create(title: title, author: author, volume: volume, image: image)
    Box.create(comic_id: comic.id, user_id: user_ids, status_id: status_id) if user_ids.present?
  end
end
