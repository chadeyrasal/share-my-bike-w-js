class User < ApplicationRecord

  has_many :bicycles, foreign_key: :owner_id
  has_many :trips, through: :bicycles
  has_many :reservations, foreign_key: :renter_id, class_name: "Trip"

end
