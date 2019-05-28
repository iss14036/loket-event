require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { described_class.new(customer_id: '1', tickets: "ticket_id: '1', :amount: 10") }
  
  context 'when transaction is appropriate' do
    it { is_expected.to be_valid }
  end
end
