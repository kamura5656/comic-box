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
  end

  def show
    @box = Box.find(params[:id])
  end


  private

  def box_params   
    params.require(:box).permit(:comic_id).merge(user_id: current_user.id)
  end
end

