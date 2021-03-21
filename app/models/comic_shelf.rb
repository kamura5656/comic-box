class ComicShelf
  include ActiveModel::Model
  attr_accessor :image, :title, :author, :user_id

  with_options presence: true do
    validates :image
  end

  def save
    comic = Comic.create(image: image, title: title, author: author)
    if user_id.present?
      Box.create(comic_id: comic.id, user_id: user_id)
    else
    end
  end
end