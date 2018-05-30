class CreateFields < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.integer :venue_id
      t.string :name
      t.float :price
      t.integer :capacity

      t.timestamps
    end
  end
end
