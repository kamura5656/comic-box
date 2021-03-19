class ComicsController < ApplicationController
  def index
    @comics = Comic.all.order('created_at DESC')
  end

  def new
    @comic = Comic.new
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comic = Comic.find(params[:id])
  end

  private

  def comic_params
    params.require(:comic).permit(:image, :title, :author)
  end
end
