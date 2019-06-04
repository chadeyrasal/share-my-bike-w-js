class Bicycle < ApplicationRecord

  belongs_to :neighborhood
  belongs_to :country
  belongs_to :owner, class_name: "User"
  has_many :trips
  has_many :renters, class_name: "User", through: :trips

  validates :title, :description, presence: true

  SIZE = ["Small", "Medium", "Large"]

end
