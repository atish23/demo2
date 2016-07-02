class OrdersController < ApplicationController
	before_filter :authenticate_customer!
	def new
		
	end
end
