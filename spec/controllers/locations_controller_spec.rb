require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  describe 'POST #create' do
    context 'When create a location' do
      subject { post :create, params: { location: { name: 'Gedung Serbaguna', address: 'Blok M, Jaksel',
        longitude: 0.0, latitude: 0.0 } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end

    context 'When create a location with nil attribute' do
      subject { post :create, params: { location: { name: 'Gedung Serbaguna', address: 'Blok M, Jaksel',
        longitude: nil, latitude: 0.0 } } }

      it 'returns a 400 or bad request status' do
        expect(subject).to have_http_status(400)
      end
    end
  end
end
