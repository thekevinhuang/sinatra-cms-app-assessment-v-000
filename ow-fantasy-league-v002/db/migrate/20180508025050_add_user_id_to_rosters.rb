class AddUserIdToRosters < ActiveRecord::Migration[5.2]
  def change
    add_column :rosters, :user_id, :integer
  end
end
