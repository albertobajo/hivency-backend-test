json.data do
  json.array! @games, :created_at
end

json.meta do
  json.total_games @count
end

json.links @metadata