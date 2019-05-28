require 'rails_helper'

RSpec.describe Ticket, type: :model do
  subject { described_class.new(category: 'premium', price: 50000, quota: 10, event_id: 1) }
  
  context 'when ticket is appropriate' do
    it { is_expected.to be_valid }
  end
end
