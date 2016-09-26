require 'rails_helper'

RSpec.describe "/attendees", type: :request do
  include RSpecHtmlMatchers

  describe '/index' do
    before do
      create(:attendee, preferred_event: create(:event))
      get '/attendees'
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end

    it "includes attendee" do
      expect(response.body).to have_tag('div', 'John')
    end
  end

  describe '/create' do
    before do
      post '/attendees', params: { attendee: { first_name: "Jane", surname: "Jamieson", email: "jane@gmail.com", religion: "CATHOLIC", wedding_date: Date.today + 2.weeks, preferred_event: create(:event), phone_number: 12345, age: 25, address: "5 North Shore, Wellington", post_wedding_address: "Unknown", fiance_full_name: "Mr Me" }}
    end

    it "is redirects to welcome page" do
      expect(response.status).to eq(302)
    end
  end

  describe "/edit" do
    before do
      attendee = create(:attendee, preferred_event: create(:event))
      get "/attendees/#{attendee.id}/edit"
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end
  end

  describe "/update" do
    before do
      attendee = create(:attendee, preferred_event: create(:event), surname: "Ross")
      put "/attendees/#{attendee.id}", params: { attendee: {surname: "Ross"} }
    end

    it "redirect_to the index page" do
      expect(response.status).to eq(302)
    end
  end
end
