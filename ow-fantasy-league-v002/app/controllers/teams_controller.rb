class TeamsController < ApplicationController
  get '/teams' do #view list of all teams
    if logged_in?
      @teams = Team.all
      erb :'/teams/index'
    else
      redirect "/login"
    end
  end

  get '/teams/:slug' do #view specific team with list of players
    if logged_in?
      @team = Team.find_by_slug(params[:slug])
      erb :'/teams/show'
    else
      redirect "/login"
    end
  end
end
