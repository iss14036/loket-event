require 'rails_helper'

RSpec.describe TicketPurchase, type: :model do
  before do
    customer = Customer.create(name: 'daniel', email: 'dan@daniel.com', phone: '2134213')
    @transaction = transaction = TicketTransaction.create(customer_id: customer.id)
  end
  subject { described_class.new(ticket_id: 1, amount: 10, ticket_transaction_id: @transaction.id) }
  
  context 'when ticket purchase is appropriate' do
    it { is_expected.to be_valid }
  end

  context 'when ticket purchase is inappropriate' do
    before do
      subject.ticket_id = nil
    end

    it { is_expected.to_not be_valid }
  end
end
