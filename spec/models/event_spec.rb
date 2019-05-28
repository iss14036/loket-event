require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { described_class.new(description: 'Event Hari Raya', origanizer: 'Kebayoran',
            start_date: '2013-02-02 01:00:00', end_date: '2013-02-02 02:00:00', location_id: 2) }
  
  context 'when event is appropriate' do
    it { is_expected.to be_valid }
  end
end
