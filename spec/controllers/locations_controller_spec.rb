require 'rails_helper'

RSpec.describe LocationsController, type: :controller do
  describe 'POST #create' do
    context 'When create a location' do
      subject { post :create, params: { location: { name: 'Gedung Serbaguna', address: 'Blok M, Jaksel',
        longitude: 0.0, altitude: 0.0 } } }

      it 'returns a 200 OK status' do
        expect(subject).to have_http_status(:ok)
      end
    end
  end
end
