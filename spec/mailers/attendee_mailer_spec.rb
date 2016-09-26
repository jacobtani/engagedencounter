require "rails_helper"

RSpec.describe AttendeeMailer, :type => :mailer do
  let(:attendee){ create(:attendee, preferred_event: create(:event))}

  describe "send_notification" do
    context 'when sending mail it has the right content' do
      before do
        @mail = AttendeeMailer.registration_confirmation(attendee: attendee).deliver_now
      end

      it "has appropriate subject" do
        expect(@mail.subject).to eq("Registration Confirmation to Engaged Encounter")
      end

      it "sends from the correct email" do
        expect(@mail.from).to eq ["tjterminator.dev@gmail.com"]
      end

      it "sends to the right recipient" do
        expect(@mail.to).to eq ["john.smith@gmail.com"]
      end

      it "includes the thank you for confirming message" do
        expect(@mail.body).to include "This is to confirm your registration to an Engaged Encounter weekend"
      end
    end
  end
end
