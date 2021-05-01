class AddGameToMoves < ActiveRecord::Migration[6.1]
  def change
    add_reference :moves, :game, null: false, foreign_key: true
  end
end
