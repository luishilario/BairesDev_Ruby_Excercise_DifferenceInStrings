class Platform < ApplicationRecord
    has_many :games
    validates_presence_of :name
end
