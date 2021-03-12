require 'rails_helper'

describe "Employee POST #create", type: :request do
    let(:employee) { attributes_for(:employee)}
    before do
        post '/employees', params: {employee: employee}
    end
    it "returns the employee's name" do
        expect(json['name']).to eq(employee[:name])
    end
    it "returns the employee's birthdate" do
        expect(json['birthdate']).to eq(employee[:birthdate].to_s)
    end
    it "returns the employee's project" do
        expect(json['project']).to eq(employee[:project])
    end
    it "returns the employee's country" do
        expect(json['country']).to eq(employee[:country])
    end
    it "returns the employee's role" do
        expect(json['role']).to eq(employee[:role])
    end
    it { expect(response).to have_http_status(:created)}
end


describe "Employee GET #show", type: :request do
    let!(:employee) { create(:employee) }
    before do
        get '/employees/' << employee.id.to_s, as: :json
    end 
    
    it "returns the information for one employee" do
        expect(json).to have_key('employee')
    end
    
    it "returns the employee's name" do
        expect(json['employee']['name']).to eq(employee.name)
    end
    it "returns the employee's birthdate" do
        expect(json['employee']['birthdate']).to eq(employee.birthdate.to_s)
    end
    it "returns the employee's project" do
        expect(json['employee']['project']).to eq(employee.project)
    end
    it "returns the employee's country" do
        expect(json['employee']['country']).to eq(employee.country)
    end
    it "returns the employee's role" do
        expect(json['employee']['role']).to eq(employee.role)
    end
    
    it { expect(response).to have_http_status(:ok) }
end

describe "Employee GET #index", :type => :request do
    let!(:employees) {create_list(:employee, 20)}
    before {get '/employees', as: :json}
    it 'returns all employees' do
        expect(json['employees'].size).to eq(20)
    end
    it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
    end
end

describe "Employee PUT #update", type: :request do
    let(:employee) {create(:employee)}
    before do
        @new_country = Faker::Address.country
        @new_role = Faker::Company.profession
        put '/employees/' << employee.id.to_s, params: {country: @new_country, role: @new_role}, as: :json
    end
    it 'updates a employee' do
        expect(response).to have_http_status(:ok)
        expect(Employee.find(employee.id).country).to eq(@new_country)
        expect(Employee.find(employee.id).role).to eq(@new_role)
    end
    it {expect(json['country']).to eq(@new_country)}
    it {expect(json['role']).to_not eq(employee.role)}
end

describe "Employee DELETE #destroy", type: :request do
    before(:each) do
        @employee_one = create(:employee)
        @employee_two = create(:employee)
    end
    it 'should delete the first employee' do
        delete "/employees/#{@employee_one.id}"
        expect(response.status).to eq(200)
        expect(json).to eq([YAML.load(@employee_two.to_json)])
    end

    it 'should delete the second employee' do
        delete "/employees/#{@employee_two.id}"
        expect(response.status).to eq(200)
        expect(json).to_not eq([YAML.load(@employee_two.to_json)])
    end
end