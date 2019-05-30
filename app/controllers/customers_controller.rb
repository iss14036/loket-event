class CustomersController < ApplicationController
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: 200
    else
      render json: { message: "Validation failed", errors: @customer.errors }, status: 400
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end
