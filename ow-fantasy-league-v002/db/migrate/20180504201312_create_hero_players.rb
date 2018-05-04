class CreateHeroPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :hero_players do |t|
      t.integer :hero_id
      t.integer :player_id
    end
  end
end
