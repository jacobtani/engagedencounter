require 'rails_helper'

RSpec.describe "/events", type: :request do
  include RSpecHtmlMatchers
  let(:user){ create(:user) }

  describe '/index' do
    before do
      create(:event)
      get '/events'
    end

    it "is a success" do
      expect(response.status).to eq(200)
    end

    it "includes event" do
      expect(response.body).to include "Pa Maria, Thorndon"
    end
  end

  describe '/create' do
    before do
      sign_in user
      post '/events', params: { event: { event_date: "11-12 November 2016", location: "Pa Maria, Thorndon", start_date: "2016-11-12".to_date }}
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

  describe "/delete" do
    before do
      @event = create(:event)
      sign_in user
      delete "/events/#{@event.id}"
    end

    it "redirect_to the index page" do
      expect(response.status).to eq(302)
    end
  end
end
