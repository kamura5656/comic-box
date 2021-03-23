class ComicShelf
  include ActiveModel::Model
  attr_accessor :image, :title, :author, :user_ids, :volume, :status_id



  def save
    comic = Comic.create(title: title, author: author, volume: volume, image: image)
    if user_ids.present?
      Box.create(comic_id: comic.id, user_id: user_ids, status_id: status_id)
    else
    end
  end
end