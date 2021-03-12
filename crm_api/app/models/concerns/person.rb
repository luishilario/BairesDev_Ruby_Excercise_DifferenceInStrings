module Person
    extend ActiveSupport::Concern

    included do
        validates_presence_of :name, :birthdate, :project, :country, :role
        after_create :new_person_mail
    end
    
    def new_person_mail
        PersonMailer.notify_new(self).deliver_now
    end
end