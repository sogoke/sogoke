class HomeController < ApplicationController
  def index
    @buzz = current_user.buzzs.new
  end
end
