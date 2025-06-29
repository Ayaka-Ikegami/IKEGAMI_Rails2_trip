class RenameTotalNightsColumnToReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :total_night, :total_nights
  end
end
