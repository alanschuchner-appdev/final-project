class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.integer :field_id
      t.integer :timeslot_id
      t.integer :team_id

      t.timestamps
    end
  end
end
