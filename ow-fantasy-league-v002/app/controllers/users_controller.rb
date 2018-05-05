class UsersController < ApplicationController

  get '/' do #main page with a welcome
    erb :main
  end

  get '/login' do #login page
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/"
    end
  end

  post '/login' do #logs in user
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/:slug"
    else
      redirect "/login"
    end
  end

  get '/signup' do #signs new user up/creates user
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect "/"
    end
  end

  post '/signup' do #actually posts new user
    user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if user.save
      session[:user_id] = user.id
      redirect "/users/#{current_user.slug}"
    else
      redirect "/signup"
    end
  end

  get '/users/:slug' do #shows user page WIP
    erb :'/users/show'
  end

end
