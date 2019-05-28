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

  def get_info
    @events = Event.all
    body = []
    @events.each do |event|
      ticket = Ticket.where(event_id: event.id)
      body << {event: event, ticket: ticket}
    end
    render json: body, status: 200
  end

  private

  def event_params
    params.require(:event).permit(:description, :origanizer, :start_date, :end_date, :location_id)
  end
end
