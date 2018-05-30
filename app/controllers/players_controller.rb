class PlayersController < ApplicationController
    
    
    def index
    @players = Player.all

    render("players/templates/index.html.erb")
    end 
    
    def show
    @players = Player.find(params.fetch("id_to_display"))

    render("players/templates/show.html.erb")
    end
    
    

    
    
    
    
    
end