require 'rails_helper'

RSpec.describe Attendee do
  let(:attendee){ create(:attendee, preferred_event: create(:event)) }

  context 'valid attendee' do
    it "does not raise any errors" do
      expect(attendee).to be_valid
      expect(attendee.errors).to be_empty
    end
  end

  context 'with a missing mandatory parameter' do
    let(:attendee){ build(:attendee, wedding_date: nil, preferred_event: create(:event)) }

    it "does raise an error with nil wedding_date" do
      expect(attendee).to be_invalid
      expect(attendee.errors.full_messages).to eq ["Wedding date can't be blank"]
    end
  end
end
