class BicyclesController < ApplicationController

  def index
    if params[:city_id]
      @city = City.find(params[:city_id])
      @bicycles = @city.bicycles
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @bicycles = @user.bicycles
    end
  end

  def new
    @user = current_user
    @bicycle = @user.bicycles.new
    @sizes = Bicycle::SIZE
    @types = Bicycle::TYPE
    @countries = Country.alphabetically
  end

  def create
    @user = User.find(params[:user_id])
    @bicycle = @user.bicycles.new(bicycle_params)
    @country = Country.find(params[:bicycle][:country_id])
    @bicycle.city = @country.cities.find_or_create_by(name: params[:bicycle][:city])
    @bicycle.neighborhood = @bicycle.city.neighborhoods.find_or_create_by(name: params[:bicycle][:neighborhood])
    if @bicycle.save
      redirect_to bicycle_path(@bicycle)
    else
      render :new
    end
  end

  def show
    @bicycle = Bicycle.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def bicycle_params
    params.require(:bicycle).permit(:title, :description, :bicycle_type, :size, :colour, :price, :country_id)
  end

end
