class HomeController < ApplicationController
  def index
    @buzz = current_user.buzzs.new if current_user
  end
end
