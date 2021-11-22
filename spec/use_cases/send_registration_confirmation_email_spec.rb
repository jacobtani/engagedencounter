require 'rails_helper'

RSpec.describe SendRegistrationConfirmationEmail do

  before do
    @email_sender = SendRegistrationConfirmationEmail.new(registered_couple: registered_couple)
  end

  describe "#perform" do
    let(:registered_couple){ create(:registered_couple, preferred_event: create(:event)) }
    let(:mailer_response){double('mailer', deliver_now: true)}

    context 'with a successful mail sent to registered_couple' do

      it "calls the registered_couple mailer" do
        expect(RegisteredCoupleMailer).to receive(:registration_confirmation).with(registered_couple: registered_couple).and_return(mailer_response)
        @email_sender.perform
      end

      it "calls the organiser mailer" do
        expect(OrganiserMailer).to receive(:new_registration).and_return(mailer_response)
        @email_sender.perform
      end

      it "does not add any errors" do
        @email_sender.perform
        expect(@email_sender.success?).to eq true
      end
    end

    context 'with an invalid registered_couple' do
      let(:registered_couple){ build(:registered_couple, surname: nil, preferred_event: create(:event)) }

      before do
        @email_sender.perform
      end

      it "adds an error" do
        expect(@email_sender.errors.full_messages).to eq ["Registered couple is invalid"]
      end

      it { expect(@email_sender.success?).to eq(false) }
    end
  end
end
