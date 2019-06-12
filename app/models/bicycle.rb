class Bicycle < ApplicationRecord

  belongs_to :neighborhood
  belongs_to :city
  belongs_to :country
  belongs_to :owner, class_name: "User"
  has_many :trips
  has_many :renters, class_name: "User", through: :trips

  validates :title, :description, :bicycle_type, :size, :colour, :price, presence: true


  def average
    total = 0
    array = self.trips.collect{|trip| total += trip.rating}
    total.to_f / array.size
  end
end
