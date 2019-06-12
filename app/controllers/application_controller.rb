class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :redirect_unless_logged_in, :redirect_if_logged_in, :set_and_check_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_unless_logged_in
    redirect_to root_path unless logged_in?
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def set_and_check_user
    if params[:user_id]
      @user = User.find(params[:user_id])
      redirect_to root_path if @user != current_user
    end
  end

end
