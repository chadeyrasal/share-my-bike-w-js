class City < ApplicationRecord

  has_many :neighborhoods
  has_many :bicycles, through: :neighborhoods
  
end
