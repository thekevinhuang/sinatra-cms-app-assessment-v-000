class League <ActiveRecord::Base
  has_many :rosters
  has_many :user_leagues
  has_many :users, through: :user_leagues
  has_many :players, through: :rosters
end
