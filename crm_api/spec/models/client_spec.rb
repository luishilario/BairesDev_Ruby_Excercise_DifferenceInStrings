require 'rails_helper'

RSpec.describe Client, :type => :model do
  subject {
    described_class.new(name:"Test Name", birthdate: Date.today, project: "Test Project", country: "Test Country", role: "Test Role")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a birthdate" do
    subject.birthdate = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a project" do
    subject.project = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a country" do
    subject.country = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a role" do
    subject.role = nil
    expect(subject).to_not be_valid
  end
end