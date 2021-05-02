require 'rails_helper'

RSpec.describe "POST /api/v1/games.json", type: :request do
  context 'with valid data' do
    let(:valid_data) { { name: "Ponky", move: "rock" } }

    it 'creates a new game' do
      expect {
        post '/api/v1/games.json', params: valid_data
      }.to change(Game, :count).by(1)
    end

    it 'shows game result'
  end

  context 'with invalid data' do
    it 'shows an error message'
  end
end
