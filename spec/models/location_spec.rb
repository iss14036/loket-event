require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { described_class.new(name: 'Gedung Serbaguna', address: 'Blok M, Jaksel',
    longitude: 0.0, latitude: 0.0) }

  context 'when location is appropriate' do
    it { is_expected.to be_valid }
  end

  context 'when longitude location is inappropriate' do
    before do
      subject.longitude = 'asd'
    end

    it { is_expected.to_not be_valid }
  end

  context 'when latitude location is inappropriate' do
    before do
      subject.latitude = 'asd'
    end

    it { is_expected.to_not be_valid }
  end
end
