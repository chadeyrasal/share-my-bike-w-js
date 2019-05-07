class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :rating
      t.string :review
      t.integer :bicycle_id
      t.integer :renter_id

      t.timestamps
    end
  end
end
