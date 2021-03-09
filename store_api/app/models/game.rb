class Game < ApplicationRecord
    belongs_to :platform
    belongs_to :company
    
    validates_presence_of :name, :price
    validates_associated :platform, :company
    validates_length_of :description, maximum: 250

    after_create :new_game_mail

    scope :by_platform, (lambda do |platform| 
        joins(:platform).where(platform: {name: platform})
    end)

    scope :by_company_name, (lambda do |company| 
        joins(:company).where(company: {name: company})
    end)

    def new_game_mail
        GamesMailer.with(game: self).notify_new.deliver_now
    end
end
