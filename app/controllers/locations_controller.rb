class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    @location.save
    render json: @location, status: 200
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude)
  end
end
