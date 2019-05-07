class Bicycle < ApplicationRecord

  belongs_to :owner
  has_many :trips
  has_many :renters, through: :trips

end
