class Country < ApplicationRecord

  has_many :cities
  has_many :bicycles


  def self.alphabetically
    self.order("NAME ASC")
  end

end
