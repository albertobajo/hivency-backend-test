class Move < ApplicationRecord
  enum move: { rock: 0, paper: 1, scissors: 2 }

  # Associations
  belongs_to :game
end
