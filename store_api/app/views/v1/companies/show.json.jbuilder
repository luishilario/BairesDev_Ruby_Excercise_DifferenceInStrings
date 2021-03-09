json.company do 
    json.id @company.id
    json.name @company.name

    json.games @company.games, :id, :name, :price, :description, :platform
    json.books @company.books, :id, :name, :description, :author, :price, :category
end
