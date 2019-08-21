class CitySerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :country
  has_many :neighborhoods
  has_many :bicycles
  has_many :bicycles, through: :neighborhoods
end
