class CitiesController < ApplicationController

  def index
    @cities = City.all
    @countries = Country.alphabetically
  end

  def show
    @city = City.find_by(id: params[:id])
  end

end
