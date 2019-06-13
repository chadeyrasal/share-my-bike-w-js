class WelcomeController < ApplicationController

  def home
    @latest = Bicycle.latest
    @most_popu = Bicycle.joins(:trips).group(:bicycle_id).count.sort_by{|_key, value| value}.reverse
  end

end
