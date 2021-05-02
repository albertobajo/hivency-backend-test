require 'rails_helper'

RULES = {
  'paper' => 'rock',
  'rock' => 'scissors',
  'scissors' => 'paper'
}

RSpec.describe Game, type: :model do
  subject(:game) { create(:game) }

  describe '#moves' do
    it { is_expected.to respond_to(:moves) }
    it 'is expected to have two movements'
  end

  describe '#result' do
    it { is_expected.to respond_to(:result) }
  end

  describe '#play' do
    it { is_expected.to respond_to(:play) }

    it 'returns tie if both moves are equal' do
      game.moves << build(:move, move: 'rock')
      game.moves << build(:move, move: 'rock')
      
      expect(game.play).to eq('There is a tie')
    end

    RULES.each do |winner, loser|
      it "who played #{winner} wins to who played #{loser}" do        
        game.moves << build(:move, name: 'Ponky', move: winner)
        game.moves << build(:move, name: 'Bot', move: loser)
        
        expect(game.play).to eq('Ponky wins')
      end  
    end
  end
end
