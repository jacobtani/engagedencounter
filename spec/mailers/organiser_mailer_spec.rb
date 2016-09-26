require "rails_helper"

RSpec.describe OrganiserMailer, :type => :mailer do
  let(:attendee){ create(:attendee, preferred_event: create(:event))}

  describe "send_notification" do
    context 'when sending mail it has the right content' do
      before do
        @mail = OrganiserMailer.new_registration(attendee: attendee).deliver_now
      end

      it "has appropriate subject" do
        expect(@mail.subject).to eq("New Registration to Engaged Encounter")
      end

      it "sends from the correct email" do
        expect(@mail.from).to eq ["john.smith@gmail.com"]
      end

      it "sends to the right recipient" do
        expect(@mail.to).to eq ["tjterminator.dev@gmail.com"]
      end

      it "includes the new registration has been made message" do
        expect(@mail.body).to include "A new attendee has registered for an Engaged Encounter Weekend. Their details are as follows:"
      end
    end
  end
end
