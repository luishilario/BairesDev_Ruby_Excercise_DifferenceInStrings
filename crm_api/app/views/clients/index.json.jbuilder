json.clients do
    json.partial! 'shared/person', collection: @clients, as: :person
end

json.partial! "shared/pagination", collection: @clients

