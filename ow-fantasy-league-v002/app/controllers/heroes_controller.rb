class HeroesController < ApplicationController
  get '/heroes' do
    if logged_in?
      @all_heroes = Hero.all
      erb :'/heroes/index'
    else
      redirect "/login"
    end
  end

  get '/heroes/:slug' do
    if logged_in?
      @hero = Hero.find_by_slug(params[:slug])
      erb :'/heroes/show'
      #show a specific hero
    else
      redirect "/login"
    end
  end
end
