require 'rails_helper'

RSpec.describe SendAttendeeEmail do

  before do
    @email_sender = SendAttendeeEmail.new(attendee: attendee)
  end

  describe "#perform" do
    let(:attendee){ create(:attendee, preferred_event: create(:event)) }
    let(:mailer_response){double('mailer', deliver_now: true)}

    context 'with a successful mail sent to attendee' do

      it "calls the organiser mailer" do
        expect(AttendeeMailer).to receive(:registration_confirmation).with(attendee: attendee).and_return(mailer_response)
        @email_sender.perform
      end

      it "does not add any errors" do
        @email_sender.perform
        expect(@email_sender.success?).to eq true
      end
    end

    context 'with an invalid attendee' do
      let(:attendee){ build(:attendee, surname: nil, preferred_event: create(:event)) }

      before do
        @email_sender.perform
      end

      it "adds an error" do
        expect(@email_sender.errors.full_messages).to eq ["Attendee is invalid"]
      end

      it { expect(@email_sender.success?).to eq(false) }
    end
  end
end
