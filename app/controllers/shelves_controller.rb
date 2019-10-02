class ShelvesController < ApplicationController
  def new
    @shelf = Shelf.new
  end

  def create
    @shelf = Shelf.new(shelf_params)
    if @shelf.save?
      redirect_to user_path
  end

  def edit
  end

  def update
  end
end
