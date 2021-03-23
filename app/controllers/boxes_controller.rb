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
    @box = Box.create(box_params)
    if @box.valid?
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

  def search
    @boxes = Box.search(params[:keyword])
  end

  private

  def box_params   
    params.permit(:comic_id).merge(user_id: current_user.id)
  end

end

