class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :check_in_day
      t.integer :check_out_day
      t.integer :people

      t.timestamps
    end
  end
end
