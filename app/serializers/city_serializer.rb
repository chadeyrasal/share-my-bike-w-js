class CitySerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :country
end
