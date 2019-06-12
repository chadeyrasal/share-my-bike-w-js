class WelcomeController < ApplicationController

  def home
    @latest = Bicycle.latest
  end

end
