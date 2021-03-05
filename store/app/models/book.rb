class Book < ApplicationRecord
    validates_presence_of :name, :price

    validates :author, presence: true, length: { in: 3..30 }

    validates :description, length: { maximum: 250 }

    VALID_CATEGORIES = %w[adventure romance scifi horror]

    validates :category, inclusion: { in: VALID_CATEGORIES }
end
