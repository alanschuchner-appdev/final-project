class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :home_score
      t.integer :visitor_score
      t.integer :booking_id

      t.timestamps
    end
  end
end
