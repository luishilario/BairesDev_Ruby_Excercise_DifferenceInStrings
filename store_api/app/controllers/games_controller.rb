class GamesController < ApplicationController
    def index
        @games = Game.all
        render json: @games
    end
    
    def show
        @game = Game.find(params[:id])
        render json: @game
    end
      
    def create
        @game = Game.new(game_params)
        
        if @game.save
            render json: @game
        else
            render json: {error: "Could not create game"}
        end
    end
    
    def update
        @game = Game.find(params[:id])
        
        if @game.update(game_params)
            render json: @game
        else
            render json: {error: "Could not update game"}
        end
    end
    
    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        
        @games = Game.all
        render json: @games
    end

    private
    def game_params
        params.require(:game).permit(:name, :price, :description, :platform_id, :company_id)
    end
end
