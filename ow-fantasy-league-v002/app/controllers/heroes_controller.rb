class HeroesController < ApplicationController
  get '/heroes' do
    if logged_in?
      @all_heroes = Hero.all
      erb :'/heroes/index'
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end

  get '/heroes/:slug' do
    if logged_in?
      @hero = Hero.find_by_slug(params[:slug])
      erb :'/heroes/show'
      #show a specific hero
    else
      flash[:message] = "You need to be logged in to visit that page"
      redirect "/login"
    end
  end
end
