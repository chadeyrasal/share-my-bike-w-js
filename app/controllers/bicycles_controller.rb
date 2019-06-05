class BicyclesController < ApplicationController

  def index
    @bicycles = Bicycle.all
  end

  def new
    @user = User.find(params[:user_id])
    @bicycle = @user.bicycles.build
    @sizes = Bicycle::SIZE
    @types = Bicycle::TYPE
    @countries = Country.alphabetically
  end

  def create
    @user = User.find(params[:user_id])
    @user.bicycles.build(bicycle_params)
    if @user.save
      redirect_to bicycle_path(@user.bicycles.last)
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
    params.require(:bicycle).permit(:title, :description, :bicycle_type, :size, :colour, :price, :neighborhood, :city, :country)
  end

end
