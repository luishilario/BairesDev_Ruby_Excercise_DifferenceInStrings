module Person
    extend ActiveSupport::Concern

    included do
        validates_presence_of :name, :birthdate, :project, :country, :role
        after_create :new_person_mail
    end
    
    def new_person_mail
        PersonMailer.with(person: self).notify_new.deliver_now
    end
end