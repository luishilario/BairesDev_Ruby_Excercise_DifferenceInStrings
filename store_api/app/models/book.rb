class Book < ApplicationRecord
    belongs_to :company

    validates_presence_of :name, :price

    validates_associated :company

    validates :author, presence: true, length: { in: 3..30 }

    validates :description, length: { maximum: 250 }

    VALID_CATEGORIES = %w[adventure romance scifi horror]

    validates :category, inclusion: { in: VALID_CATEGORIES }
end
