require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { described_class.new(name: 'daniel', email: 'daniel@gmail.com', phone:'08523242') }
  
  context 'when email customer does appropriate' do
    it { is_expected.to be_valid }
  end
end
