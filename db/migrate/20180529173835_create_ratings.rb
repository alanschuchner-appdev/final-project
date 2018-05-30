class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :rating
      t.integer :player_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
