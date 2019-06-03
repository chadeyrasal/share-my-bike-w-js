class User < ApplicationRecord

  has_secure_password

  has_many :bicycles, foreign_key: :owner_id
  has_many :trips, through: :bicycles
  has_many :reservations, foreign_key: :renter_id, class_name: "Trip"


  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash["info"]["email"], full_name: auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
#    oauth_email =
#    oauth_name =
#    if @user = User.find_by(email: oauth_email)
#      session[:user_id] = @user.id
#      redirect_to root_path
#    else
#      @user = User.new(full_name: oauth_name, email: oauth_email, password: SecureRandom.hex)
#      if @user.save
#        session[:user_id] = @user.id
#        redirect_to root_path
#      else
#        redirect_to login_path
#      end
#    end
  end

end
