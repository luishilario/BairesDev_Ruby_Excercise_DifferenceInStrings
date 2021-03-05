class Game < ApplicationRecord
    belongs_to :platform
    
    validates_presence_of :name, :price
    validates_associated :platform
    validates_length_of :description, maximum: 250

    around_create :notify_users
    # default_scope {joins(:platform).where(platform: {name: "PC"})}

    scope :by_name, -> (name) {where name: name}
    scope :by_platform, (lambda do |platform| 
        joins(:platform).where(platform: {name: platform})
    end)
    scope :by_platform2, (lambda do |platform|
        temp = Platform.find_by(name: platform)
        where(platform: temp)
    end)
    scope :by_platform3, (lambda do |platform|
        where(platform: Platform.find_by(name: platform))
    end)

    def notify_users
        puts "Creating game"
        yield
        puts "Notifing users"
    end

    
end
