class BicycleSerializer < ActiveModel::Serializer

  attributes :id, :bicycle_type, :size, :colour, :title, :description, :price, :neighborhood, :city, :country, :owner

  belongs_to :neighborhood
  belongs_to :city
  belongs_to :country
  belongs_to :owner, class_name: "User"

end
