require 'rails_helper'

RSpec.describe Ticket, type: :model do
  before(:all) do
    location = Location.create(name: 'Pasaraya Blok M', address: 'Jl. Thamrin', longitude: 1.2, latitude: 2.2)
    @event = location.events.create(description: 'Ruby meet up', origanizer: 'Gojek', start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 01:00:00')
  end
  subject { described_class.new(category: 'premium', price: 50000, quota: 10, event_id: @event.id) }
  
  context 'when ticket is appropriate' do
    it { is_expected.to be_valid }
  end

  context 'when ticket is inappropriate' do
    before do
      subject.category = nil
    end

    it { is_expected.to_not be_valid }
  end

  context 'when quota or price is not integer' do
    before do
      subject.price = 'seribu'
    end

    it { is_expected.to_not be_valid }
  end
end
