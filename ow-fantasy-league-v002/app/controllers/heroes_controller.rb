class HeroesController < ApplicationController
  get '/heroes' do
    @all_heroes = Hero.all
    erb :'/heroes/index'
  end

  get '/heroes/:slug' do
    @hero = Hero.find_by_slug(params[:slug])
    erb :'/heroes/show'
    #show a specific hero
  end
end
