module Authenticable

  # Devise methods overwrites
  def current_customer
    @current_customer ||= Customer.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_customer.present?
  end
end