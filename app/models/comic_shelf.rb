class ComicShelf
  include ActiveModel::Model
  attr_accessor :image, :title, :author, :user_id, :volume



  def save
    comic = Comic.create(title: title, author: author, volume: volume, image: image)
    if user_id.present?
      Box.create(comic_id: comic.id, user_id: user_id)
    else
    end
  end
end