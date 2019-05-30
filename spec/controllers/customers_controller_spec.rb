require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'POST #create' do
    context 'When create a customer with appropriate' do
      subject { post :create, params: { customer: { name: 'daniel', email:'daniel@daniel.com', phone: '123' } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When create a customer with nil attributes' do
      subject { post :create, params: { customer: { name: nil, email:'daniel@daniel.com', phone: '123' } } }

      it 'returns a 400 OK status' do
        expect(subject).to have_http_status(400)
      end
    end
  end
end
