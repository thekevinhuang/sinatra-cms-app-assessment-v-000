class RostersController < ApplicationController
  get '/roster/:id' do #shows a specific roster with players

  end

  get '/roster/:id/edit' do #allows user to edit roster, if roster belongs to them

  end

  get '/roster/new' do
    #allows user to create a new roster in a league they have joined
  end

end
