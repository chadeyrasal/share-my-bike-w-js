class City < ApplicationRecord

  belongs_to :country
  has_many :neighborhoods
  has_many :bicycles
  has_many :bicycles, through: :neighborhoods

  def next
    City.where("id > ?", id).first || City.first
  end

  def previous
    City.where("id < ?", id).last || City.last
  end

end
