class AddCurrentUserIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :current_user_id, :integer
  end
end