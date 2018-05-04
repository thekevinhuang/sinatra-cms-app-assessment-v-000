class League <ActiveRecord::Base
  has_many :rosters
  has_many :user_leagues
  her_many :users, through: :user_leagues
end
