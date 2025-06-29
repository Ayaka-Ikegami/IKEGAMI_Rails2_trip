require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  describe "GET /hello" do
    it "returns http success" do
      get "/reservations/hello"
      expect(response).to have_http_status(:success)
    end
  end

end
