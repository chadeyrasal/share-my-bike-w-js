class TripsController < ApplicationController

  before_action :redirect_unless_logged_in, only: [:index, :new, :crete, :show, :edit]
  before_action :set_and_check_user, only: [:index, :show, :edit, :update]
  before_action :set_trip, only: [:show, :edit, :update]

  def index
    @trips = @user.reservations
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
      flash[:success] = "You're all booked!"
      redirect_to user_trip_path(@trip.renter, @trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if @trip.renter != @user
    @bicycle = @trip.bicycle
  end

  def update
    @trip.rating = params[:trip][:rating]
    @trip.review = params[:trip][:review]
    if @trip.save
      flash[:success] = "Thank you for the review!"
      redirect_to user_trip_path(@user, @trip)
    else
      render :edit
    end
  end


  private

  def trip_params
    params.require(:trip).permit(:start_date, :end_date, :bicycle_id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
