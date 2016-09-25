require 'rails_helper'

RSpec.describe SendEmail do

  before do
    @email_sender = SendEmail.new(attendee: attendee)
  end

  describe "#perform" do
    let(:attendee){ create(:attendee) }

    context 'with a valid attendee' do

      before do
        @email_sender.perform
      end

      it "calls the send email method"do
        expect()
      end

      it "does not add any errors" do
        @converter.perform
        expect(@converter.success?).to eq true
      end
    end

    context 'with an invalid file which exists but is not parseable' do
      let(:xls_file_name){ "spec/fixtures/xls/invalid_file.xlsx" }
      let(:csv_file_name){ "spec/fixtures/csv/invalid_file.csv" }

      before do
        @converter.perform
      end

      it "adds an error" do
        expect(@converter.errors.full_messages).to eq ["Xls file name Zip end of central directory signature not found"]
      end

      it { expect(@converter.success?).to eq(false) }
    end

    context 'with a file that does not exist' do
      let(:xls_file_name){ "spec/fixtures/xls/inexistentfile.xls" }

      before do
        @converter.perform
      end

      it "adds an error" do
        expect(@converter.errors.full_messages).to eq ["Xls file name does not exist"]
      end

      it { expect(@converter.success?).to eq(false) }
    end
  end
end
