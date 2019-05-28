class TicketsController < ApplicationController
  def create
    @event = Event.find(ticket_params['event_id'])
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      render json: @ticket, status: 200
    else
      render json: { message: "Validation failed", errors: @ticket.errors }, status: 400
    end
    
  rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
  end

  private

  def ticket_params
    params.require(:ticket).permit(:category, :price, :quota, :event_id)
  end
end
