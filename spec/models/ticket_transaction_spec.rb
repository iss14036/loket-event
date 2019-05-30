require 'rails_helper'

RSpec.describe TicketTransaction, type: :model do
  before(:all) do
    @customer = Customer.create(name: 'daniel', email: 'dan@daniel.com', phone: '2134213')
  end
  subject { described_class.new(customer_id: @customer.id)}
  
  context 'when transaction is appropriate' do
    it { is_expected.to be_valid }
  end

  context 'when transaction is inappropriate' do
    before do
      subject.customer_id = nil
    end

    it { is_expected.to_not be_valid }
  end
end
