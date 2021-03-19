class BoxesController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def show
    @comics = Comic.all.order('created_at DESC')
  end
end

