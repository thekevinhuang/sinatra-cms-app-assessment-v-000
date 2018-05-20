class AddLeagueCreator < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :creator_user_id, :integer
  end
end
