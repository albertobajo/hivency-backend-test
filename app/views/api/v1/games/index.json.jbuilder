json.data do
  json.array! @games, :created_at
end

json.meta do
  json.totalGames @count
end

json.links do
end