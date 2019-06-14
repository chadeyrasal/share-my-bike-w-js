class SessionsController < ApplicationController

    before_action :redirect_if_logged_in, only: [:new]

  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"] # auth via omniauth
      @user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = @user.id
      flash[:success] = "You have been logged in successfully"
      redirect_to root_path
    else # auth via classic login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = "You have been logged in successfully"
        redirect_to root_path
      else
        flash[:error] = "Incorrect email address or password"
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = "You have been logged out successfully"
    redirect_to root_path
  end

end
