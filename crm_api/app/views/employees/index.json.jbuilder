json.employees do
    json.array! @employees, partial: 'shared/person', as: :person
end

if params[:page]
    json.partial! "shared/pagination", collection: @employees
end