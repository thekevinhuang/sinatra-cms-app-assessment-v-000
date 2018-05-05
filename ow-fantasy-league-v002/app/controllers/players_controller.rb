class PlayersController < ApplicationController
  get '/players' do
    #shows a list of all players with link to team
  end

  get '/players/:slug' do
    #shows a specific player with heroes played
  end
end
