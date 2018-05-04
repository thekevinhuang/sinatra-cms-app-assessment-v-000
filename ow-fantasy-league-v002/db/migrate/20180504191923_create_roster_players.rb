class CreateRosterPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :roster_players do |t|
      t.integer :roster_id
      t.integer :player_id
    end
  end
end
