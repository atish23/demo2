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
				flash[:success] = "Order successfully submitted"
				format.json { render json: @order, status: :created}
			end
		end
	end
private 
	def order_params
		params.require(:order).permit!
	end
end



 