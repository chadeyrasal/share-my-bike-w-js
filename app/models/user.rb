class User < ApplicationRecord

  has_secure_password

  has_many :bicycles, foreign_key: :owner_id
  has_many :trips, through: :bicycles
  has_many :reservations, foreign_key: :renter_id, class_name: "Trip"

  validates :email, uniqueness: true


  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash["info"]["email"], full_name: auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

end
