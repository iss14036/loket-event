class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: 200
    else
      render json: { message: "Validation failed", errors: @transaction.errors }, status: 400
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:customer_id,  { tickets: [:ticket_id, :amount]})
  end
end
