require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'POST #create' do
    before do
      @location = Location.create(name: 'Blok M Square', address: 'Jl. Thamrin', longitude: 2.2, latitude: 2.2)
    end

    context 'When create an event' do
      subject { post :create, params: { event: { description: 'Event Hari Raya', origanizer: 'Kebayoran',
        start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 02:00:00', location_id: @location.id } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end
  end
end
