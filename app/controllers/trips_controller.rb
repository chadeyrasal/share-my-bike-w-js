class TripsController < ApplicationController

  before_action :redirect_unless_logged_in, only: [:index, :new, :show, :edit]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      redirect_to root_path if @user != current_user
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
    redirect_to root_path if @user != current_user
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
    @user = @trip.renter
    redirect_to root_path if @user != current_user
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
