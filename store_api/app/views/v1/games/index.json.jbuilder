json.array! @games do |game|
    json.id game.id
    json.name game.name
    json.price game.price
    json.platform game.platform
end
