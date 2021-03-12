require "rails_helper"

RSpec.describe PersonMailer, :type => :mailer do
    let(:person) { build(:employee)}
    describe "notify_new" do
        # person = Employee.new(name: "Test Name", birthdate: Date.today, project: "Test Project", country: "Test Country", role: "Test Role")
        let(:mail) { PersonMailer.with(person: person).notify_new }
        
        it "renders the headers" do
            expect(mail.subject).to eq "Person Mailer"
            expect(mail.to).to include "luis.hilario@bairesdev.com"
        end
        
        it "renders the body" do
            expect(mail.body.encoded).to match("New person has been registered!")
        end

        it {expect(mail.body.encoded).to match(person.name)}
    end
end