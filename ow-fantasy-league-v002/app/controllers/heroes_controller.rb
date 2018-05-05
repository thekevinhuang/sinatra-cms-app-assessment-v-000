class HeroesController < ApplicationController
  get '/heroes' do
    #list heroes
  end

  get '/heroes/:slug' do
    #show a specific hero
  end
end
