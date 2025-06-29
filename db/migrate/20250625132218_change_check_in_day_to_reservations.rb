class ChangeCheckInDayToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :check_in_day, :date 
    change_column :reservations, :check_out_day, :date
  end
end
