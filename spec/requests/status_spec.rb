require 'rails_helper'

RSpec.describe "Statuses", type: :request do
  describe "GET /index" do
    it "returns http success", :vcr do
      get "/status/index"
      expect(response).to have_http_status(:success)
    end
  end

end
