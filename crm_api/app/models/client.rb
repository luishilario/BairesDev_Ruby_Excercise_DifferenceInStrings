class Client < ApplicationRecord
    include Person
    acts_as_paranoid

    paginates_per 2
end
