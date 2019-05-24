class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"] # auth via omniauth
      oauth_email = auth_hash["info"]["email"]
      oauth_name = auth_hash["info"]["name"]
      if @user = User.find_by(email: oauth_email)
        session[:user_id] = @user.id
        redirect_to root_path
      else
        @user = User.new(full_name: oauth_name, email: oauth_email, password: SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          redirect_to root_path
        else
          redirect_to login_path
        end
      end
    else # auth via classic login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
