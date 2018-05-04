class Hero <ActiveRecord::Base
  has_many :hero_players
  has_many :players, through: :hero_players
end
