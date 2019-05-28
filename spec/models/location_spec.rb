require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { described_class.new(name: 'Gedung Serbaguna', address: 'Blok M, Jaksel',
    longitude: 0.0, latitude: 0.0) }

  context 'when location is appropriate' do
    it { is_expected.to be_valid }
  end
end
