require 'rails_helper'

RSpec.describe TicketTransactionsController, type: :controller do
  describe 'POST #create' do
    before(:all) do
      location = Location.create(name: 'Pasaraya Blok M', address: 'Jl. Thamrin', longitude: 1.2, latitude: 2.2)
      event1 = location.events.create(description: 'Ruby meet up', origanizer: 'Gojek', start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 01:00:00')
      event2 = location.events.create(description: 'Ruby meet up', origanizer: 'Gojek', start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 01:00:00')
      @ticket = event1.tickets.create(category: 'premium', price: 50000, quota: 10)
      @ticket2 = event2.tickets.create(category: 'premium', price: 50000, quota: 10)
      @customer = Customer.create(name: 'daniel', email: 'dan@daniel.com', phone: '2134213')
    end
    
    context 'When create a transaction with enough quota of ticket' do
      subject { post :create, params: { transaction: { customer_id: @customer.id, 
              tickets: [{ticket_id: @ticket.id, amount: 1}] } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When attributes customer id is not found' do
      subject { post :create, params: { transaction: { customer_id: -1, 
              tickets: [{ticket_id: @ticket.id, amount: 1}] } } }

      it 'returns a 404 or not found' do
        expect(subject).to have_http_status(:not_found)
      end
    end

    context 'When create a transaction with no ticket id' do
      subject { post :create, params: { transaction: { customer_id: @customer.id, 
              tickets: [{ticket_id: -1, amount: 20}] } } }

      it 'returns a 404 or ticket id not found' do
        expect(subject).to have_http_status(:not_found)
      end
    end

    context 'When create a transaction with no enough quota of ticket' do
      subject { post :create, params: { transaction: { customer_id: @customer.id, 
              tickets: [{ticket_id: @ticket.id, amount: 20}] } } }

      it 'returns a 400 or bad response status' do
        expect(subject).to have_http_status(400)
      end
    end

    context 'When create a transaction with multiple event' do
      subject { post :create, params: { transaction: { customer_id: @customer.id, 
              tickets: [{ticket_id: @ticket.id, amount: 1}, {ticket_id: @ticket2.id, amount: 1}] } } }

      it 'returns a 400 or bad response status' do
        expect(subject).to have_http_status(400)
      end
    end

    context 'When amount of ticket is negative' do
      subject { post :create, params: { transaction: { customer_id: @customer.id, 
              tickets: [{ticket_id: @ticket.id, amount: -1}] } } }

      it 'returns a 400 or bad request' do
        expect(subject).to have_http_status(400)
      end
    end
  end

  describe 'GET #get_info' do
    before do
      @transaction = TicketTransaction.create(customer_id: 1)
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
