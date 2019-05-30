class TransactionsController < ApplicationController
  def create
    number_of_event = []
    @customer = Customer.find(transaction_params['customer_id'])
    #check if ticket is enough or no
    transaction_params['tickets'].each do |ticket_pay|
      ticket = Ticket.find(ticket_pay['ticket_id'])
      if ticket_pay['amount'].to_i < 0
        raise TransactionHandler::AmountTicketIsNegative
      end
      if ticket['quota'].to_i - ticket_pay['amount'].to_i < 0
        raise TransactionHandler::QuotaIsNotEnough
      end
      number_of_event << ticket.event_id
    end
    ##Check if ticket comes from multiple event
    number_of_event = number_of_event.to_set
    if number_of_event.length > 1
      raise TransactionHandler::TicketEventExceed
    end
    #Update every amount ticket
    transaction_params['tickets'].each do |ticket_pay|
      ticket = Ticket.find(ticket_pay['ticket_id'])
      current_quota = ticket['quota'].to_i - ticket_pay['amount'].to_i
      ticket.update(quota: current_quota)
    end

    @transaction = Transaction.new(transaction_purchase_params)
    @transaction.save
    tickets = []
    transaction_params['tickets'].each do |ticket_purchase|
      tickets << TicketPurchase.create(ticket_id: ticket_purchase['ticket_id'], amount: ticket_purchase['amount'], transaction_id: @transaction.id)
    end
    body = {transaction: @transaction, ticket_purchase: tickets}
    render json: body, status: 200

  rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
  rescue TransactionHandler::QuotaIsNotEnough => e
      render json: {
        error: e.message.to_s
      }, status: 400       
  rescue TransactionHandler::TicketEventExceed => e
      render json: {
        error: e.message.to_s
      }, status: 400       
  rescue TransactionHandler::AmountTicketIsNegative => e
    render json: {
      error: e.message.to_s
    }, status: 400  
  end

  def get_info
    @transaction = Transaction.find(params[:id])
    render json: @transaction, status: 200
    
  rescue ActiveRecord::RecordNotFound => e
    render json: {
      error: e.to_s
    }, status: :not_found
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id,  { tickets: [:ticket_id, :amount]})
  end

  def transaction_purchase_params
    params.require(:transaction).permit(:customer_id)
  end
end
