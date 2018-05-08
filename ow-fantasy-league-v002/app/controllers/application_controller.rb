require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  configure do
      set :public_folder, 'public'
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "ameizing"
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end

end
