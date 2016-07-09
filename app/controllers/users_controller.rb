class UsersController < ApplicationController
	before_filter :authenticate_customer!
	def index
		
	end

	def show
		 @customer = Customer.new
		 @customers = Customer.find(params[:id])
		 @orders = @customers.orders.last(10).reverse
		 @order= current_customer.orders.last
		if @order
			@address = current_customer.orders.last.address

		end
	end

end
