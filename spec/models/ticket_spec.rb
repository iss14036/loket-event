require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { described_class.new(category: 'premium', price: 50000, quota: 10, event_id: 1) }
  
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
