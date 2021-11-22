require 'rails_helper'

RSpec.describe RegisteredCouple do
  let(:registered_couple){ create(:registered_couple, preferred_event: create(:event)) }

  context 'valid registered_couple' do
    it "does not raise any errors" do
      expect(registered_couple).to be_valid
      expect(registered_couple.errors).to be_empty
    end
  end

  context 'with a missing mandatory parameter' do
    let(:registered_couple){ build(:registered_couple, preferred_event: nil) }

    it "does raise an error with nil preferred_event" do
      expect(registered_couple).to be_invalid
      expect(registered_couple.errors.full_messages).to eq ["Preferred event can't be blank"]
    end
  end
end
