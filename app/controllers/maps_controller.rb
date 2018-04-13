class MapsController < ApplicationController
  def index
    @maps = Map.where.not(latitude: nil, longitude: nil).order('created_at DESC')
    @hash = Gmaps4rails.build_markers(@maps) do |map, marker|
      marker.lat map.latitude
      marker.lng map.longitude
      marker.infowindow render_to_string(partial: "/maps/map_box", locals: { map: map })
    end
  end

  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
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