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
  private
    def params_user
      params.require(:user).permit!
    end
end