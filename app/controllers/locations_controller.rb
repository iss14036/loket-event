class LocationsController < ApplicationController
  def create
    @location = Location.new(location_params)
    if @location.save
      render json: @location, status: 200
    else
      render json: { message: "Validation failed", errors: @location.errors }, status: 400
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :longitude, :latitude)
  end
end
