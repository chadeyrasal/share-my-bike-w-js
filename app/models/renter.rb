class Renter < ApplicationRecord

  has_many :trips
  has_many :bicycles, through: :trips
  
end
