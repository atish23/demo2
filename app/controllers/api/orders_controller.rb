class Api::OrdersController < Api::BaseController
	def index
		@orders = Order.all
		respond_to do |format|
			format.json { render json: @orders}
		end
	end
	def create
		@order = Order.new(order_params)
		respond_to do |format|
			if @order.save
				format.json { render json: true, status: :created}
			else
				format.json { render json: false, status: :false}
			end
		end
	end
private 
	def order_params
		params.require(:order).permit!
	end
end



 