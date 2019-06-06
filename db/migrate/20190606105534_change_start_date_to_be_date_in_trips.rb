class ChangeStartDateToBeDateInTrips < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :start_date, :date
  end
end
