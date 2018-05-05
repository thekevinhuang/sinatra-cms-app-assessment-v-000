class Player <ActiveRecord::Base
  belongs_to :team
  has_many :hero_players
  has_many :heroes, through: :hero_players
  has_many :roster_players
  has_many :rosters, through: :roster_players

  def slug
    slug_name = self.name.gsub(' ', '-')
    slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
    slug_name = slug_name.downcase
    slug_name
  end

  def self.find_by_slug(slug)
    self.all.find do |player|
      player.slug == slug
    end
  end
end
