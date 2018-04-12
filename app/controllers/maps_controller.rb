class MapsController < ApplicationController
  def index
    @maps = Map.order('created_at DESC')
  end

  def new
    @maps = Map.new
  end

  def create
    @maps = Map.new(map_params)
    if @maps.save
      flash[:success] = "Map place added!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def map_params
    params.require(:map).permit(:title, :address, :visited_by)
  end
end