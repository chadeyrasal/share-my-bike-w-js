class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.string :category
      t.string :size
      t.string :colour
      t.string :description
      t.string :country
      t.string :city
      t.integer :owner_id

      t.timestamps
    end
  end
end
