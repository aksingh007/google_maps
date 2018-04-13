class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

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

  # GET /maps/1/edit
  def edit
  end

  def show
    @map = Map.find(params[:id])
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    if @map.update(map_params)
      redirect_to @map, notice: 'Map was successfully updated.'
    else
      render action: 'edit'
    end
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

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_map
    @map = Map.find(params[:id])
  end

  def map_params
    params.require(:map).permit(:title, :address, :visited_by)
  end
end