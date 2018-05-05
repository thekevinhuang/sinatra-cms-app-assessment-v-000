class Hero <ActiveRecord::Base
  has_many :hero_players
  has_many :players, through: :hero_players
  self.table_name="heroes"

  def slug
    slug_name = self.name.gsub(' ', '-')
    slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
    slug_name = slug_name.downcase
    slug_name
  end

  def self.find_by_slug(slug)
    self.all.find do |hero|
      hero.slug == slug
    end
  end
end
