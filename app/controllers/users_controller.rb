class UsersController < ApplicationController
	before_filter :authenticate_customer!
	def index
		
	end

	def show
		 @customer = Customer.new
		 @customers = Customer.find(params[:id])
		 @orders = @customers.orders.last(10).reverse
	end

end
