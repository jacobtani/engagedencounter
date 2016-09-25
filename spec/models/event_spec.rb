require 'rails_helper'

RSpec.describe Event do
  let(:event){ create(:event) }

  context 'valid event' do
    it "does not raise any errors" do
      expect(event).to be_valid
      expect(event.errors).to be_empty
    end
  end

  context 'with a missing mandatory parameter' do
    let(:event){ build(:event, event_date: nil) }

    it "does raise an error with nil event_date" do
      expect(event).to be_invalid
      expect(event.errors.full_messages).to eq ["Event date can't be blank"]
    end
  end
end
