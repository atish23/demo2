class Api::SessionsController < Api::BaseController
	def create
		user_password = params[:password]
		user_email = params[:email]
		
		user = user_email.present? && Customer.find_by(email: user_email)
		if user
			if user.valid_password? user_password
			  sign_in user, store: false
			  user.generate_authentication_token!
			  user.save
			  render json: user, status: 200
			else
			  render json: { errors: "Invalid email or password" }, status: 422
			end
		else
			render json: { errors: "Invalid email or password" }, status: 422
		end
	end

	def destroy
	    user = Customer.find_by(auth_token: params[:id])
			if user
				user.generate_authentication_token!
				user.save
				render json: {success: "success"}, status: 200
			else
				render json: {failure: "failure"}, status: 422
			end
	end
end
