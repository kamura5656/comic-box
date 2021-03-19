class ComicsController < ApplicationController
  before_action :params_find,        only: [:show]

  def index
    @comics = Comic.all.order('created_at DESC')
  end

  def new
    @comicshelf = ComicShelf.new
  end

  def create
    @comicshelf = ComicShelf.new(box_params)
    if @comicshelf.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comic = Comic.find(params[:id])
  end

  private
  def params_find
    @comic = Comic.find(params[:comic_id])
  end

  def box_params
    params.require(:comic_shelf).permit(:image, :title, :author, :user_id)
  end
end
