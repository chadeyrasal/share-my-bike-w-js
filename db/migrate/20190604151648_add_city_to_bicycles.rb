class AddCityToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :city_id, :integer
  end
end
