class BicyclesController < ApplicationController

  before_action :redirect_unless_logged_in, only: [:new, :edit]
  before_action :set_and_check_user, only: [:new, :create, :show, :edit]
  before_action :set_bicycle, only: [:show, :edit, :update]

  def index
    if params[:city_id]
      @city = City.find(params[:city_id])
      @bicycles = @city.bicycles
    elsif params[:user_id]
      redirect_unless_logged_in
      set_and_check_user
      @bicycles = @user.bicycles
    end
  end

  def new
    @bicycle = Bicycle.new
    @countries = Country.alphabetically
  end

  def create
    @bicycle = @user.bicycles.new(bicycle_params)
    @bicycle.country = Country.find_or_create_by(name: params[:bicycle][:country]) unless params[:bicycle][:country] == ""
    @bicycle.city = @bicycle.country.cities.find_or_create_by(name: params[:bicycle][:city]) unless params[:bicycle][:city] == ""
    @bicycle.neighborhood = @bicycle.city.neighborhoods.find_or_create_by(name: params[:bicycle][:neighborhood]) unless params[:bicycle][:neighborhood] == ""
    if @bicycle.save
      flash[:success] = "Your new bicycle was successfully created"
      redirect_to bicycle_path(@bicycle)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @countries = Country.alphabetically
    redirect_to root_path if @user != current_user
  end

  def update
    @bicycle.update(bicycle_params)
    @bicycle.country = Country.find_or_create_by(name: params[:bicycle][:country])
    @bicycle.city = @bicycle.country.cities.find_or_create_by(name: params[:bicycle][:city])
    @bicycle.neighborhood = @bicycle.city.neighborhoods.find_or_create_by(name: params[:bicycle][:neighborhood])
    if @bicycle.save
      flash[:success] = "Your bicycle has been updated successfully"
      redirect_to user_bicycle_path(@bicycle.owner, @bicycle)
    else
      render :edit
    end
  end

  def luxurious
    @bicycles = Bicycle.luxurious
  end


  private

  def bicycle_params
    params.require(:bicycle).permit(:title, :description, :bicycle_type, :size, :colour, :price)
  end

  def set_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

end
