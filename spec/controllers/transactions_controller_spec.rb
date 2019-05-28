require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'POST #create' do
    before do
      @ticket = Ticket.create(category: 'premium', price: 50000, quota: 10, event_id: 1)
      @ticket.save
    end
    
    context 'When create a transaction with enough quota of ticket' do
      subject { post :create, params: { transaction: { customer_id: 1, 
              tickets: [{ticket_id: @ticket.id, amount: 1}] } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When attributes are nil' do
      subject { post :create, params: { transaction: { customer_id: nil, 
              tickets: [{ticket_id: @ticket.id, amount: 1}] } } }

      it 'returns a 400 or bad request' do
        expect(subject).to have_http_status(400)
      end
    end

    context 'When create a transaction with no ticket id' do
      subject { post :create, params: { transaction: { customer_id: 1, 
              tickets: [{ticket_id: -1, amount: 20}] } } }

      it 'returns a 404 or ticket id not found' do
        expect(subject).to have_http_status(:not_found)
      end
    end

    context 'When create a transaction with no enough quota of ticket' do
      subject { post :create, params: { transaction: { customer_id: 1, 
              tickets: [{ticket_id: @ticket.id, amount: 20}] } } }

      it 'returns a 400 or bad response status' do
        expect(subject).to have_http_status(400)
      end
    end
  end

  describe 'GET #get_info' do
    before do
      @transaction = Transaction.create(customer_id: 1, tickets: "ticket_id: '1', :amount: 10")
      get :get_info, params: { id: @transaction.id }
    end

    context 'When transaction id is found' do
      it 'returns a 200 OK status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When transaction id is not found' do
      it 'returns a 400 OK status' do
        get :get_info, params: { id: -1 }
        
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
