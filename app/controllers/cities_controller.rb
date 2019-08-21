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
    set_city
    respond_to do |f|
      f.html
      f.json { render json: @city }
    end
  end

  def next
    render json: set_city.next
  end

  def previous
    render json: set_city.previous
  end


  private

  def set_city
    @city = City.find_by(id: params[:id])
  end

end
