class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    Raise params.inspect
  end

  def destroy
  end

end
