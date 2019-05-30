class CustomersController < ApplicationController
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    render json: @customer, status: 200
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end
