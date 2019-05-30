class EventsController < ApplicationController
  def create
    @location = Location.find(event_params['location_id'])
    @event = @location.events.new(event_params)
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

  def get_info
    @events = Event.all
    body = []
    @events.each do |event|
      body << {event: event, ticket: event.tickets}
    end
    render json: body, status: 200
  end

  private

  def event_params
    params.require(:event).permit(:description, :origanizer, :start_date, :end_date, :location_id)
  end
end
