class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.datetime :slot_time

      t.timestamps
    end
  end
end
