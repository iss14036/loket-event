require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  describe 'POST #create' do
    before(:all) do
      @location = Location.create(name: 'Pasaraya Blok M', address: 'Jl. Thamrin', longitude: 1.2, latitude: 2.2)
      @event = @location.events.create(description: 'Ruby meet up', origanizer: 'Gojek', start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 01:00:00', location_id: 1)
    end

    context 'When create a ticket' do
      subject { post :create, params: { ticket: { category: 'premium', price: 50000, 
                quota: 10, event_id: @event.id } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When price is not number' do
      subject { post :create, params: { ticket: { category: 'premium', price: "seribu", 
                quota: 10, event_id: @event.id } } }

      it 'returns a 400 or bad request status' do
        expect(subject).to have_http_status(400)
      end
    end

    context 'When event id is not found' do
      subject { post :create, params: { ticket: { category: 'premium', price: 50000, 
                quota: 10, event_id: -1 } } }

      it 'returns a 404 event id not found' do
        expect(subject).to have_http_status(:not_found)
      end
    end
    
    context 'When ticket category already exist' do
      subject { post :create, params: { ticket: { category: 'premium', price: 50000, 
                quota: 10, event_id: @event.id } } }

      it 'returns a 400 or bad request' do
        @ticket = Ticket.create(category: 'premium', price: 10000, 
          quota: 10, event_id: @event.id)

        expect(subject).to have_http_status(400)
      end
    end
  end
end
