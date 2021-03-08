json.company @company
json.games @company.games, :id, :name, :price, :description, :platform
json.books @company.books, :id, :name, :description, :author, :price, :category