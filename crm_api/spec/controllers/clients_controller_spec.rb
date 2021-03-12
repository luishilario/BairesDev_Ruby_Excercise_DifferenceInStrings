require 'rails_helper'

describe "Client POST #create", type: :request do
    let(:client) { attributes_for(:client)}
    before do
        post '/clients', params: {client: client}
    end
    # it "returns the client's name" do
    #     expect(json['name']).to eq(client[:name])
    # end
    # it "returns the client's birthdate" do
    #     expect(json['birthdate']).to eq(client[:birthdate].to_s)
    # end
    # it "returns the client's project" do
    #     expect(json['project']).to eq(client[:project])
    # end
    # it "returns the client's country" do
    #     expect(json['country']).to eq(client[:country])
    # end
    # it "returns the client's role" do
    #     expect(json['role']).to eq(client[:role])
    # end
    it { expect(response).to have_http_status(:created)}
    it { expect(Client.find_by!(name: client[:name])).not_to be_nil}
    it { expect(Client.find_by!(name: client[:name])).to_not be_nil}
end


describe "Client GET #show", type: :request do
    let!(:client) { create(:client) }
    before do
        # get '/clients/' << client.id.to_s, as: :json
        get "/clients/#{client.id}", as: :json
        # get ['/clients', client.id].join('/'), as: :json
        # get :show, params: {id: client.id}, as: :json
    end 
    
    it "returns the information for one client" do
        expect(json).to have_key('client')
    end
    
    it "returns the client's name" do
        expect(json['client']['name']).to eq(client.name)
    end
    it "returns the client's birthdate" do
        expect(json['client']['birthdate']).to eq(client.birthdate.to_s)
    end
    it "returns the client's project" do
        expect(json['client']['project']).to eq(client.project)
    end
    it "returns the client's country" do
        expect(json['client']['country']).to eq(client.country)
    end
    it "returns the client's role" do
        expect(json['client']['role']).to eq(client.role)
    end
    
    it { expect(response).to have_http_status(:ok) }
end

describe "Client GET #index", :type => :request do
    let!(:clients) {create_list(:client, 20)}
    before {get '/clients', as: :json}
    it 'returns all clients' do
        expect(json['clients'].size).to eq(20)
    end
    it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
    end
end

describe "Client PUT #update", type: :request do
    let!(:client) {create(:client)}
    let!(:new_country) {Faker::Address.country}
    let!(:new_role) {Faker::Company.profession}
    before do
        put '/clients/' << client.id.to_s, params: {country: new_country, role: new_role}, as: :json
        # client.reload
    end
    it 'updates a client' do
        expect(response).to have_http_status(:ok)
        expect(Client.find(client.id).country).to eq(new_country)
        expect(Client.find(client.id).role).to eq(new_role)
    end
    it {expect(json['country']).to eq(new_country)}
    it {expect(json['role']).to_not eq(client.role)}
end

describe "Client DELETE #destroy", type: :request do
    before(:each) do
        @client_one = create(:client)
        @client_two = create(:client)
    end
    context 'should delete the first client' do
        before(:each) { delete "/clients/#{@client_one.id}" }
        it {expect(response.status).to eq(200)}
        it {expect(json).to eq([YAML.load(@client_two.to_json)])}
    end

    context 'should delete the second client' do
        before(:each) {delete "/clients/#{@client_two.id}"}
        it {expect(response.status).to eq(200)}
        it {expect(json).to_not eq([YAML.load(@client_two.to_json)])}
    end
end