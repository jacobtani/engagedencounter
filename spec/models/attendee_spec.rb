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
    let(:attendee){ build(:attendee, preferred_event: nil) }

    it "does raise an error with nil preferred_event" do
      expect(attendee).to be_invalid
      expect(attendee.errors.full_messages).to eq ["Preferred event can't be blank"]
    end
  end
end
