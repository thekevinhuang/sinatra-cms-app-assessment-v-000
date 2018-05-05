class LeaguesController < ApplicationController
  get '/leagues' do
    #shows a current list of all the existing leagues
  end

  get 'leagues/new' do
    #allows a user to create a new league
  end

  get '/leagues/:id' do
    #shows a specific league with all the rosters
  end

  get '/leagues/:id/join' do
    #adds current user to league
  end
end
