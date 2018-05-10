class RostersController < ApplicationController

  get '/leagues/:id/rosters/new' do
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
    #allows user to create a new roster in a league they have joined
    #roster belongs to league
    #roster has many players
    #league has many rosters
    #league has many users
    #user has many rosters
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
    erb :'/rosters/add'
  end

  get '/rosters/:id' do #shows a specific roster with players
    @rost = Roster.find_by(id: params[:id])
    erb :'/rosters/show'
  end



  post '/rosters/:id/player_add' do
    @rost = Roster.find_by(id: params[:id])
    player = Player.find_by_slug(params[:player])
    if player
      @rost.players << player
      @rost.save
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
    player = Player.find_by_slug(params[:player])
    if player
      @rost.players.delete(Player.find_by_slug(params[:slug]))
      @rost.players << player
      @rost.save
    end
    redirect "/rosters/#{@rost.id}"
  end
end
