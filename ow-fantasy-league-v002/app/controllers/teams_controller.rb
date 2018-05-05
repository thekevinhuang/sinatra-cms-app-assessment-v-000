class TeamsController < ApplicationController
  get '/teams' do #view list of all teams
    @teams = Team.all
    erb :'/teams/index'
  end

  get '/teams/:slug' do #view specific team with list of players
    @team = Team.find_by_slug(params[:slug])
    erb :'/teams/show'
  end
end
