require 'rails_helper'

RSpec.describe "GET /api/v1/games.json", type: :request do
  context 'without games' do
    it 'returns an empty array' do
      get '/api/v1/games.json'
      json_response = JSON.parse(response.body)

      expect(json_response['data']).to eq([])
    end
  end

  context 'with games' do
    let!(:game) { game_with_moves }

    before(:each) do
      create_list(:game, 9)
    end

    it 'includes game info' do
      get '/api/v1/games.json'
      
      expect(response.body).to include(
        game.moves.first.name,
        game.moves.first.move,
        game.moves.second.name,
        game.moves.second.move,
        game.result,
        game.created_at.to_s,
      )
    end

    it 'includes total number of games' do
      get '/api/v1/games.json'
      json_response = JSON.parse(response.body)

      expect(json_response['meta']['total_games']).to eq(10)
    end
  end

  describe 'pagination' do
    %w(first_url prev_url page_url next_url last_url).each do |url|
      it "includes #{url}" do
        get '/api/v1/games.json'
        json_response = JSON.parse(response.body)

        expect(json_response['links']).to have_key(url)
      end
    end        
  end
end
