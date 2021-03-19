class BoxesController < ApplicationController
  def new
    @box = Box.new
  end

  def create

  end

  def destroy
  end

  def show
    @comics = Comic.all.order('created_at DESC')
  end

  private


end

