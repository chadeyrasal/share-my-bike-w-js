class BicyclesController < ApplicationController

  def index
    @bicycles = Bicycle.all
  end

  def new
  end

  def create
  end

  def show
    @bicycle = Bicycle.find_by(id: params[:id])
  end

end