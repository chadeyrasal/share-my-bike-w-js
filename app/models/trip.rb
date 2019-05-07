class Trip < ApplicationRecord

  belongs_to :bicycle
  belongs_to :renter
  
end
