class AddCurrentUserIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :current_user_id, :integer
  end
end
