class TicketsController < ApplicationController
  def create
    @event = Event.find(ticket_params['event_id'])
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    render json: @ticket, status: 200
  end

  private

  def ticket_params
    params.require(:ticket).permit(:category, :price, :quota, :event_id)
  end
end
