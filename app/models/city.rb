class City < ApplicationRecord

  belongs_to :country
  has_many :neighborhoods
  has_many :bicycles, through: :neighborhoods

end
