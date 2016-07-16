class Api::PricingsController < Api::BaseController
	def index
		@pricings = Pricing.all
		respond_to do |format|
      format.json { render :json => @pricings }
    end
	end
end