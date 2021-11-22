require 'rails_helper'

RSpec.describe "/registered_couples", type: :request do
  include RSpecHtmlMatchers
  let(:user){create(:user)}

  describe '/index' do
    before do
      create(:registered_couple, preferred_event: create(:event), event: create(:event))
      sign_in user
      get '/registered_couples'
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end

    it "includes registered_couple" do
      expect(response.body).to have_tag('div', 'John Smith')
    end
  end

  describe '/create' do
    before do
      event = create(:event)
      post '/registered_couples', params: { registered_couple: { first_name: "Jane", surname: "Jamieson", email: "jane@gmail.com", religion: "CATHOLIC", wedding_date: Date.today + 2.weeks, preferred_event: event.id, event: event.id, phone_number: 12345, age: 25, address: "5 North Shore, Wellington", parish: "HI", post_wedding_address: "Unknown"}}
    end

    it "is redirects to welcome page" do
      expect(response.status).to eq(200)
    end
  end

  describe "/edit" do
    before do
      event = create(:event)
      registered_couple = create(:registered_couple, preferred_event: event, event: event)
      sign_in user
      get "/registered_couples/#{registered_couple.id}/edit"
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end
  end

  describe "/update" do
    before do
      event = create(:event)
      registered_couple = create(:registered_couple, preferred_event: event, event: event, surname: "Ross")
      sign_in user
      put "/registered_couples/#{registered_couple.id}", params: { registered_couple: {surname: "Ross"} }
    end

    it "redirect_to the index page" do
      expect(response.status).to eq(302)
    end
  end
end
