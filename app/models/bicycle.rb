class Bicycle < ApplicationRecord

  belongs_to :neighborhood
  belongs_to :city
  belongs_to :country
  belongs_to :owner, class_name: "User"
  has_many :trips
  has_many :renters, class_name: "User", through: :trips

  validates :title, :description, :bicycle_type, :size, :colour, :price, presence: true


  def average
    sum = 0
    array = self.trips.collect{|trip| sum += trip.rating}
    total = sum.to_f / array.size
    total.round(2)
  end

  def self.latest
    order(created_at: :desc).limit(5)
  end

  def self.popular
    joins(:trips).group(:bicycle_id).count.sort_by{|_key, value| value}.reverse.first(5)
  end

end
