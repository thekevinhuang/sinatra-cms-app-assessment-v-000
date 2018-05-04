class Roster <ActiveRecord::Base
  belongs_to :league
  has_many :roster_players
  has_many :players, through: :roster_players
end
