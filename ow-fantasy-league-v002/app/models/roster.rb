class Roster <ActiveRecord::Base
  belongs_to :league
  has_many :roster_players
  has_many :players, through: :roster_players

  def contain_player?(player)
    !!self.players.find(player) #returns truthy value if the player was found in the roster
  end
end
