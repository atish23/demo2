class Api::AddressesController < Api::BaseController

	def update
		@user = Customer.find(params[:id])
		@address =  @user.orders.last.address
		if @user
			respond_to do |format|
				if @address.update_attributes(params_address)
					format.json  { render :json => @address, :status => :created }
				else
					format.json  { render :json => @address.errors, :status => :unprocessable_entity }
				end
			end
		else
			render json: { errors: "Invalid Address Field" }, status: 422
		end	

	end

	private
		def params_address
			params.require(:address).permit!
		end
end