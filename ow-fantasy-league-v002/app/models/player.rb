class Player <ActiveRecord::Base
  belongs_to :team
  has_many :hero_players
  has_many :heroes, through: :hero_players
  has_many :roster_players
  has_many :rosters, through: :roster_players
end
