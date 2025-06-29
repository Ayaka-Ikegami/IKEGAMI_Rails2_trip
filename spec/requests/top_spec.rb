require 'rails_helper'

RSpec.describe "Tops", type: :request do
  describe "GET /hello" do
    it "returns http success" do
      get "/top/hello"
      expect(response).to have_http_status(:success)
    end
  end

end
