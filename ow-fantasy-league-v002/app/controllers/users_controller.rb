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
      flash[:message] = "Login failed, please re-enter your credentials"
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
      flash[:message] = "Please ensure that you filled out all fields."
      redirect "/signup"
    end
  end

  get '/users/:slug' do #shows user page WIP
    if logged_in?
      erb :'/users/show'
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end

  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "Log out successful"
    end

    redirect "/login"
  end

end
