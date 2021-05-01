FactoryBot.define do
  factory :game do
    result { 'There is a tie.' }
  end
end

def game_with_moves
  FactoryBot.create(:game) do |game|
    FactoryBot.create_list(:move, 2, game: game)
  end
end
