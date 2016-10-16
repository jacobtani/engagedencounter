require 'rails_helper'

RSpec.describe "/events", type: :request do
  include RSpecHtmlMatchers
  let(:user){create(:user)}

  describe '/index' do
    before do
      create(:event)
      get '/events'
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end

    it "includes event" do
      expect(response.body).to include "January 2017"
    end
  end

  describe '/create' do
    before do
      post '/events', params: { event: { event_name: "November 2017", event_date: "11-11-2017", location: "Pa Maria, Thorndon" }}
    end

    it "it redirects" do
      expect(response.status).to eq(302)
    end
  end

  describe "/edit" do
    before do
      event = create(:event)
      sign_in user
      get "/events/#{event.id}/edit"
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end
  end

  describe "/update" do
    before do
      event = create(:event)
      sign_in user
      put "/events/#{event.id}", params: { event: {location: "St Teresa's Catholic Parish, Karori"} }
    end

    it "redirect_to the index page" do
      expect(response.status).to eq(302)
    end
  end
end
