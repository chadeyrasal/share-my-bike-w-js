class CitiesController < ApplicationController

  def index
    @cities = City.all
    @countries = Country.alphabetically
    respond_to do |f|
      f.html
      f.json { render json: @cities }
    end
  end

  def show
    @city = City.find_by(id: params[:id])
    respond_to do |f|
      f.html
      f.json { render json: @city }
    end
  end

  def next
  end

end
