class PlayersController < ApplicationController
  get '/players' do
    if logged_in?
      #shows a list of all players with link to team
      @players = Player.all
      erb :'/players/index'
    else
      redirect "/login"
    end
  end

  get '/players/:slug' do
    if logged_in?
      #shows a specific player with heroes played
      @player = Player.find_by_slug(params[:slug])
      erb :'/players/show'
    else
      redirect "/login"
    end
  end
end
