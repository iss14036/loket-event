require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { described_class.new(name: 'daniel', email: 'daniel@gmail.com', phone:'08523242') }
  
  context 'when email customer does appropriate' do
    it { is_expected.to be_valid }
  end

  context 'when email customer does not appropriate' do
    before do
      subject.email = 'daniel.com'
    end
    
    it { is_expected.to_not be_valid }
  end

  context 'when attributes nil' do
    before do
      subject.name = nil
    end

    it { is_expected.to_not be_valid }
  end
end
