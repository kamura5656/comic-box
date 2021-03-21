class BoxesController < ApplicationController
  def new
    @box = Box.new
  end

  def create
    @box = Box.new(shelf_params)
    if @box.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def show
    @boxes = Box.all.order('created_at DESC')
  end

  private

  def shelf_params
    params.require(:comic).permit(:title)
  end

end

