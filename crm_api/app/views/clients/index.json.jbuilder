json.clients do
    json.partial! 'shared/person', collection: @clients, as: :person
end
if params[:page]
    json.partial! "shared/pagination", collection: @clients
end

