class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.string :bicycle_type
      t.string :size
      t.string :colour
      t.string :title
      t.string :description
      t.string :price
      t.integer :neighborhood_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
