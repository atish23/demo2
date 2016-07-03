class HomeController < ApplicationController
  
  def index
    @pricing = Pricing.all

  end

end
