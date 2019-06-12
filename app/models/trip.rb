class Trip < ApplicationRecord

  belongs_to :bicycle
  belongs_to :renter, class_name: "User"

  validates :start_date, :end_date, presence: true

end
