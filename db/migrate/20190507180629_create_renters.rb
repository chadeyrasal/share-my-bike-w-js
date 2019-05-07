class CreateRenters < ActiveRecord::Migration[5.2]
  def change
    create_table :renters do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
