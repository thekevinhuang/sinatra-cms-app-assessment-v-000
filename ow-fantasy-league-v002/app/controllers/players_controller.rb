class PlayersController < ApplicationController
  get '/players' do
    #shows a list of all players with link to team
    @players = Player.all
    erb :'/players/index'
  end

  get '/players/:slug' do
    #shows a specific player with heroes played
    @player = Player.find_by_slug(params[:slug])
    erb :'/players/show'
  end
end
