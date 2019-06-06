class TripsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      if @user != current_user
        redirect_to root_path
      end
      @trips = @user.reservations
    end
  end

  def new
    @bicycle = Bicycle.find(params[:bicycle_id])
    @trip = @bicycle.trips.new
  end

  def create
    @bicycle = Bicycle.find(params[:bicycle_id])
    @trip = @bicycle.trips.new(trip_params)
    @trip.renter_id = current_user.id
    if @trip.save
      redirect_to user_trip_path(@trip.renter, @trip)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
    @user = @trip.renter
    @bicycle = @trip.bicycle
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.rating = params[:trip][:rating]
    @trip.review = params[:trip][:review]
    if @trip.save
      redirect_to user_trip_path(@trip.renter, @trip)
    else
      render :edit
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :bicycle_id)
  end

end
