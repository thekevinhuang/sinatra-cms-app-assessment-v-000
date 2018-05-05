class UsersController < ApplicationController

  get '/' do
    erb :main
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/:slug"
    else
      redirect "/login"
    end
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect "/"
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      session[:user_id] = user.id
      redirect "/users/:slug"
    else
      redirect "/signup"
    end
  end

  get '/users/:slug' do

  end

end
