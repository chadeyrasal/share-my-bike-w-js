class UsersController < ApplicationController

  def new
    redirect_to root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to cities_path
    else
      render :new
    end
  end

  def show
    redirect_unless_logged_in
    @user = User.find_by(id: params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:full_name, :username, :email, :password)
  end

end
