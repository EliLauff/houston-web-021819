class PlayersController < ApplicationController
    before_action :define_current_player
    
    def create
        player = Player.create(player_params)
        render json: player
    end
    
    def index
        render json: Player.all
    end
    
    def show
        render json: current_player
    end
    
    def update
        current_player.update(player_params)
        render json: current_player
    end
    
    def destroy
        current_player.destroy
        render json: current_player
    end
    
    def player_params
        params.permit(:name, :x, :y, :fast_mode)
    end
    
    def define_current_player
        if params[:id]
            @current_player = Player.find(params[:id])
        else
            @current_player = Player.new
        end
    end
    
    def current_player
        @current_player
    end
end