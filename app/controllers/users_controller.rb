class UsersController < ApplicationController
	before_filter :authenticate_customer!
	def index
		
	end

	def show
		 @customers = Customer.find(params[:id])	
	end

	def orders
		@customers = Customer.find(params[:id])
		@orders = @customers.orders
		#raise @orders.inspect
	end

end
