class Country < ApplicationRecord

  has_many :cities


  def self.alphabetically
    self.order("NAME ASC")
  end

end
