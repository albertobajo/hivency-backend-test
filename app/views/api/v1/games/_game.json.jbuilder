json.moves game.moves, partial: 'api/v1/moves/move', as: :move
json.result game.result
json.created_at game.created_at.to_s