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
    rost.save
    redirect "/rosters/#{rost.id}"
  end

  get '/rosters/:id' do #shows a specific roster with players
    erb :'/rosters/show'
  end

  get '/rosters/:id/edit' do #allows user to edit roster, if roster belongs to them

  end
end
