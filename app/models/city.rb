class City < ApplicationRecord

  belongs_to :country
  has_many :neighborhoods
  has_many :bicycles
  has_many :bicycles, through: :neighborhoods


  def self.alphabetically
    self.order("NAME ASC")
  end

end
