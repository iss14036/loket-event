class EventsController < ApplicationController
  def create
    @location = Location.find(event_params['location_id'])
    @event = Event.new(event_params)
    @event.save
    render json: @event, status: 200
  end

  private

  def event_params
    params.require(:event).permit(:description, :origanizer, :start_date, :end_date, :location_id)
  end
end
