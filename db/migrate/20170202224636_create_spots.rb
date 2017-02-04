class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :picture
      t.integer :price
      t.boolean :availability
      t.time :end_time
      t.integer :owner_id

      t.timestamps
    end
  end
end
