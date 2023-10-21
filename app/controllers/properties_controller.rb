class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
    @property.stations.new
  end

  def create
    Property.create(property_params)
    redirect_to new_property_path
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
    @property.stations.new
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(update_property_params)
      redirect_to properties_path
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, stations_attributes:[:id, :route_name, :station_name, :time, :property_id])
  end

  def update_property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note, stations_attributes:[:id, :route_name, :station_name, :time, :property_id,[:id]])
  end
end
