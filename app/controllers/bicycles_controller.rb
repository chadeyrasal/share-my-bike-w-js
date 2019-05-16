class BicyclesController < ApplicationController

  def index
    @bicycles = Bicycle.all
  end

  def new
    @bicycle = Bicycle.new
    @sizes = Bicycle::SIZE
  end

  def create
    @bicycle = Bicycle.new(bicycle_params)
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
    params.require(:bicycle).permit(:title, :description, :bicycle_type, :size, :colour, :price, :neighborhood_id)
  end

end
