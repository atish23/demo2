class Api::RegistrationsController < Api::BaseController
  def create
    @user = Customer.new(params_user)
  
    respond_to do |wants|
      if @user.save
        flash[:notice] = 'Customer was successfully created.'
        # wants.html { redirect_to(@user) }
        wants.json  { render :json => @user, :status => :created }
      else
        # wants.html { render :action => "new" }
        wants.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @user = Customer.find(params[:id])
    if @user
      respond_to do |format|
        if @user.update_attributes(params_user) 
          format.json  { render :json => @user, :status => :created }
        else
          format.json  { render :json => @user.errors, :status => :unprocessable_entity }
        end 
      end
    else
     render json: { errors: "Invalid email or password" }, status: 422
    end
  end
  
  private
    def params_user
      params.require(:user).permit!
    end
end