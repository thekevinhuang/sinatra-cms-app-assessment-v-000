class LeaguesController < ApplicationController
  get '/leagues' do
    #shows a current list of all the existing leagues
    @all_leagues = League.all
    erb :'/leagues/index'
  end

  get '/leagues/new' do
    #allows a user to create a new league
    erb :'/leagues/create'
  end

  post '/leagues/new' do
    new_league = League.new(name: params[:league_name])

    if params[:join_league]=="join"
      new_league.users << current_user
    end

    new_league.save
    redirect "/leagues/#{new_league.id}"
  end

  get '/leagues/:id' do
    #shows a specific league with all the rosters
    @league = League.find_by(id: params[:id])

    erb :'/leagues/show'
  end

  get '/leagues/:id/join' do
    #adds current user to league
    join_league = League.find_by(id: params[:id])
    if !join_league.users.include?(current_user)
      join_league.users << current_user
      join_league.save
    end
    redirect "/leagues/#{join_league.id}"
  end

  get '/leagues/:id/edit' do
    @league = League.find_by(id: params[:id])

    erb :'/leagues/edit'
  end

  patch '/leagues/:id/edit' do
    league = League.find_by(id: params[:id])

    if !params[:league_name].empty?
      league.update(name: params[:league_name])
      league.save
      redirect "/leagues/#{league.id}"
    end
    redirect "/leagues/#{league.id}/edit"
  end

  delete '/leagues/:id' do
    league = League.find_by(id: params[:id])

    if logged_in?
      if league.users.include?(current_user)
        league.delete
      end
        redirect "/leagues"
    else
      redirect "/login"
    end
  end

end
