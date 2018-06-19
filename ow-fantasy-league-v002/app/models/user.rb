class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :email, presence:true
    has_many :user_leagues
    has_many :leagues, through: :user_leagues
    has_many :rosters, through: :leagues

    has_many :user_rosters, class_name: "Roster", foreign_key: "user_id"

    def slug
      slug_name = self.username.gsub(' ', '-')
      slug_name = slug_name.gsub(/[^-a-zA-Z0-9$_.+!*()]/, "")
      slug_name = slug_name.downcase
      slug_name
    end

    def self.find_by_slug(slug)
      self.all.find do |user|
        user.slug == slug
      end
    end
end
