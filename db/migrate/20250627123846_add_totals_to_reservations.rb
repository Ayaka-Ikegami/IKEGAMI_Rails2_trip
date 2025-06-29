class AddTotalsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_night, :integer
    add_column :reservations, :total_days, :integer
    add_column :reservations, :total_charge, :integer
  end
end
