class NeighborhoodsController < ApplicationController

  def show
    @neighborhood = Neighborhood.find_by(id: params[:id])
  end

end
