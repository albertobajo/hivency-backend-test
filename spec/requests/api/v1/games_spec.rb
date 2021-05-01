require 'rails_helper'

RSpec.describe "Api::V1::Games", type: :request do
  # History
  describe '/api/v1/games.json' do
    it "responds" do
      get "/api/v1/games.json"
      expect(response).to have_http_status(:success)
    end

    it 'matches schema'

    it 'returns games info'


    it 'returns games timestamps'

    it 'has pagination'
  end
end
