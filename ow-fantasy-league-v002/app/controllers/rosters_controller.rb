class RostersController < ApplicationController

  get '/leagues/:id/rosters/new' do
    if logged_in?
      @league = League.find_by(id: params[:id])

      if current_user.leagues.include?(@league)
        #check if current user is in this league
        @roster = @league.rosters & current_user.rosters
        if !@roster.empty? #checks the intersection of the rosters in the league and the user's rosters
          redirect "/rosters/#{@roster.first.id}"
        else
          erb :'/rosters/create'
        end
      else
        flash[:message] = "You are not a part of this league."
        redirect "/leagues/#{@league.id}"
      end
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
    #allows user to create a new roster in a league they have joined

    #checks if current_user is a member of the current league & does not have a roster belonging to the league

  end

  post '/leagues/:id/rosters/new' do
    @league = League.find_by(id: params[:id])
    rost = Roster.new(name: params[:roster_name])
    rost.league = @league
    rost.user = current_user
    rost.save
    redirect "/rosters/#{rost.id}"
  end

  get '/rosters/:id/player_add' do
    @rost = Roster.find_by(id: params[:id])
    @all_team = Team.all
    if @rost.players.size >=6
      flash[:message] = "You already have a full roster"
      redirect "/rosters/#{@rost.id}"
    else
      erb :'/rosters/add'
    end
  end

  get '/rosters/:id' do #shows a specific roster with players
    @rost = Roster.find_by(id: params[:id])
    erb :'/rosters/show'
  end

  post '/rosters/:id/player_add' do
    @rost = Roster.find_by(id: params[:id])
    player = Player.find_by_slug(params[:player])
    if @rost.players.size <6
      if player
        @rost.players << player
        @rost.save
        flash[:message] = "#{player.name} added to roster"
      else
        flash[:message] = "The player you are trying to add doesn't exist"
      end
    else
      flash[:message] = "You have a full roster already."
    end
    redirect "/rosters/#{@rost.id}"
  end

  get '/rosters/:id/player/:slug/edit' do #allows user to edit roster, if roster belongs to them
    @rost = Roster.find_by(id: params[:id])
    @player = Player.find_by_slug(params[:slug])
    @all_team = Team.all
    erb :'/rosters/edit'
  end

  post '/rosters/:id/player/:slug/edit' do
    @rost = Roster.find_by(id: params[:id])
    new_player = Player.find_by_slug(params[:player])
    if new_player
      old_player = Player.find_by_slug(params[:slug])
      @rost.players.delete(old_player)
      @rost.players << new_player
      @rost.save
      flash[:message] = "#{old_player.name} replaced with #{new_player.name} in roster"
    end
    redirect "/rosters/#{@rost.id}"
  end

  get '/rosters/:id/player/:slug/delete' do
    @rost = Roster.find_by(id: params[:id])
    player = Player.find_by_slug(params[:slug])

    @rost.players.delete(player)

    flash[:message] = "#{player.name} removed from the roster"
    redirect "/rosters/#{@rost.id}"
  end
end
