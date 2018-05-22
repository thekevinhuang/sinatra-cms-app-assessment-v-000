class LeaguesController < ApplicationController

  get '/leagues' do
    #shows a current list of all the existing leagues
    if logged_in?
      @all_leagues = League.all
      erb :'/leagues/index'
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  get '/leagues/new' do
    #allows a user to create a new league
    if logged_in?
      erb :'/leagues/create'
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  post '/leagues/new' do
    new_league = League.new(name: params[:league_name])

    new_league.creator_user_id = current_user.id

    if params[:join_league]=="join"
      new_league.users << current_user
    end

    new_league.save
    redirect "/leagues/#{new_league.id}"
  end

  get '/leagues/:id' do
    #shows a specific league with all the rosters
    if logged_in?
      @league = League.find_by(id: params[:id])
      erb :'/leagues/show'
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  get '/leagues/:id/join' do
    #adds current user to league
    if logged_in?
      join_league = League.find_by(id: params[:id])
      if !join_league.users.include?(current_user)
        join_league.users << current_user
        join_league.save
      end
      redirect "/leagues/#{join_league.id}"
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  get '/leagues/:id/edit' do
    if logged_in?
      @league = League.find_by(id: params[:id])
      if @league.users.include?(current_user)
        if @league.creator_user_id == current_user.id
          erb :'/leagues/edit'
        else
          flash[:message] = "You aren't the creator of the league so you cannot edit"
          redirect "/leagues/#{@league.id}"
        end
      else
        redirect "/leagues/#{@league.id}"
      end
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  patch '/leagues/:id/edit' do
    league = League.find_by(id: params[:id])
    if logged_in?
      if league.creator_user_id == current_user.id
        if !params[:league_name].empty?
          league.update(name: params[:league_name])
          league.save
          redirect "/leagues/#{league.id}"
        end
        redirect "/leagues/#{league.id}/edit"
      else
        flash[:message] = "You aren't the creator of the league so you cannot edit"
        redirect "/leagues/#{league.id}"
      end
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  delete '/leagues/:id' do
    league = League.find_by(id: params[:id])

    if logged_in?
      if league.creator_user_id == current_user.id
        league.delete
      else
        flash[:message] = "You didn't create the league and cannot delete it"
      end
        redirect "/leagues"
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

end
