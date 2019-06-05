class TripsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      if @user != current_user
        redirect_to root_path
      end
      @trips = @user.trips
    end
  end

  def new
  end

  def create
  end

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

end
