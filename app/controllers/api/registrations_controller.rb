class Api::RegistrationController < Api::BaseController
  def create
    @user = Customer.new(params[:user])
  
    respond_to do |wants|
      if @user.save
        flash[:notice] = 'Customer was successfully created.'
        # wants.html { redirect_to(@user) }
        wants.xml  { render :json => @user, :status => :created }
      else
        # wants.html { render :action => "new" }
        wants.json  { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end