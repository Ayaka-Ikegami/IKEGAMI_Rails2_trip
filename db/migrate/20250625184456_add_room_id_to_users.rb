class AddRoomIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :room_id, :integer
  end
end
