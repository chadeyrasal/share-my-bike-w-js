class AddCountryToBicycles < ActiveRecord::Migration[5.2]
  def change
    add_column :bicycles, :country_id, :integer
  end
end
