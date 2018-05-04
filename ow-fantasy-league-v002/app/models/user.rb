class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true
    validates :email, presence:true
    has_many :user_leagues
    has_many :leagues, through: :user_leagues
    has_many :rosters, through: :leagues
end
