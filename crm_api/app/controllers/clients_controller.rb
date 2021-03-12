class ClientsController < ApplicationController
    def index
        @clients = Client.page params[:page] if params[:page]
        @clients = Client.all.except(:limit, :offset) unless params[:page]
        render status: :ok
    end
    
    def show
        @client = Client.find(params[:id])
        render status: :ok
    end
    
    def create
        @client = Client.create!(client_params)
        render json: @client, status: :created
    end
    
    def update
        @client = Client.find(params[:id])
        
        @client.update(client_params)
        render json: @client, status: :ok
    end
    
    def destroy
        @client = Client.find(params[:id])
        @client.destroy
        
        @clients = Client.all
        render json: @clients, status: :ok
    end
    
    private
    def client_params
        params.require(:client).permit(:name, :birthdate, :project, :country, :role)
    end
end
