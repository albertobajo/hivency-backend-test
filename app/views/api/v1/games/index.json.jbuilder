json.data do
  json.partial! 'api/v1/games/game', collection: @games, as: :game
end

json.meta do
  json.total_games @count
end

json.links @metadata