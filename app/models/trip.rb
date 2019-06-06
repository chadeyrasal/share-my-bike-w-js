class Trip < ApplicationRecord

  belongs_to :bicycle
  belongs_to :renter, class_name: "User"


  RATING = [1, 2, 3, 4, 5]

end
