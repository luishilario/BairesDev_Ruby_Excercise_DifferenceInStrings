class Company < ApplicationRecord
    has_many :games
    has_many :books
    
    validates_presence_of :name
end
