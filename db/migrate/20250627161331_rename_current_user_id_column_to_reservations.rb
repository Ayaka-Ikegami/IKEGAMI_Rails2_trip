class RenameCurrentUserIdColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :current_user_id, :user_id
  end
end
