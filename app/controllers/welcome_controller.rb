class WelcomeController < ApplicationController

  def home
    @latest = Bicycle.latest
    @most_popu = Bicycle.popular
  end

end
