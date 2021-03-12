require 'rails_helper'

RSpec.describe Employee, :type => :model do
    let (:employee) { described_class.new(name:"Test Name", birthdate: Date.today, project: "Test Project", country: "Test Country", role: "Test Role") }
    subject { employee }
    context "person with all the required attributes" do
        it { should be_valid }  
    end
    context "person without all the required attributes" do
        before do
            employee.name = nil
        end
        it "is not valid when it doesn't have a name" do 
            should_not be_valid
        end
    end
    describe "Validations " do
        it { should validate_presence_of :name }
        it { should validate_presence_of :birthdate }
        it { should validate_presence_of :project }
        it { should validate_presence_of :country }
        it { should validate_presence_of :role }  
        it { employee.name.should eq "Test Name"}
    end
end