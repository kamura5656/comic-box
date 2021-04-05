class BoxesController < ApplicationController
  def index
    @boxes = Box.all.order('created_at DESC')
    @comics = Comic.all.order('created_at DESC')
  end

  def new
    @box = Box.new
    @comics = Comic.all.order('created_at DESC')
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    redirect_to search_boxes_path
  end

  def show
    @box = Box.find(params[:id])
  end

  def update
    @box = Box.find(params[:id])
    @box.update(comment_params)
    if @box.save
      redirect_to box_path
    else
      render :show
    end
  end

  def search
    @boxes = Box.search(params[:keyword])
  end

  private

  def box_params
    params.permit(:comic_id).merge(user_id: current_user.id)
  end

  def comment_params
    params.require(:box).permit(:comment)
  end
end
