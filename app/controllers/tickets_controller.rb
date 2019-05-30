class TicketsController < ApplicationController
  def create
    if Ticket.where(event_id: ticket_params[:event_id], category: ticket_params[:category]).exists?
      raise TransactionHandler::CategoryTicketIsExist
    end
    if ticket_params[:price].to_i < 0
      raise TransactionHandler::PriceIsNegative
    end
    if ticket_params[:quota].to_i < 0
      raise TransactionHandler::QuotaIsNegative
    end
     
    @event = Event.find(ticket_params['event_id'])
    @ticket = @event.tickets.new(ticket_params)
    if @ticket.save
      render json: @ticket, status: 200
    else
      render json: { message: "Validation failed", errors: @ticket.errors }, status: 400
    end
    
  rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
  rescue TransactionHandler::CategoryTicketIsExist => e
      render json: {
        error: e.message.to_s
      }, status: 400
  rescue TransactionHandler::PriceIsNegative => e
      render json: {
        error: e.message.to_s
      }, status: 400
  rescue TransactionHandler::QuotaIsNegative => e
      render json: {
        error: e.message.to_s
      }, status: 400
  end

  private

  def ticket_params
    params.require(:ticket).permit(:category, :price, :quota, :event_id)
  end
end
