class NeighborhoodsController < ApplicationController

  def index
    @city = City.find(params[:city_id])
    @neighborhoods = @city.neighborhoods
  end

  def show
    @city = City.find(params[:city_id])
    @neighborhood = Neighborhood.find_by(id: params[:id])
  end

end
