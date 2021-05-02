class Game < ApplicationRecord
  # Constants
  RULES = {
    'paper' => 'rock',
    'rock' => 'scissors',
    'scissors' => 'paper'
  }

  # Associations
  has_many :moves
  accepts_nested_attributes_for :moves

  # Methods

  def play
    self.result = if moves.first.move == moves.second.move
      'There is a tie'
    elsif RULES[moves.first.move] == moves.second.move
      "#{moves.first.name} wins"
    else
      "#{moves.second.name} wins"
    end
  end
end
