require 'rails_helper'

RSpec.describe TicketPurchase, type: :model do
  subject { described_class.new(ticket_id: 1, amount: 10) }
  
  context 'when ticket purchase is appropriate' do
    it { is_expected.to be_valid }
  end
end
