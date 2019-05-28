class TransactionsController < ApplicationController
  def create
    ticket = Ticket.find(transaction_params['tickets'][0]['ticket_id'])
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: 200
    else
      render json: { message: "Validation failed", errors: @transaction.errors }, status: 400
    end
    rescue ActiveRecord::RecordNotFound => e
      render json: {
        error: e.to_s
      }, status: :not_found
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id,  { tickets: [:ticket_id, :amount]})
  end
end
