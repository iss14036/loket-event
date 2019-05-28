class EventsController < ApplicationController
  def create
    @location = Location.find(event_params['location_id'])
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: 200
    else
      render json: { message: "Validation failed", errors: @event.errors }, status: 400
    end
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
  end

  private

  def event_params
    params.require(:event).permit(:description, :origanizer, :start_date, :end_date, :location_id)
  end
end
