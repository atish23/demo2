class OrdersController < ApplicationController
	before_filter :authenticate_customer!
	def new
		@order= current_customer.orders.last
		if @order
			@address = current_customer.orders.last.address

		end
	end
end
