class Api::SearchController < Api::BaseController
    def show
      @area = Area.where(:zip_code => params[:id]).present?
      respond_to do |format|
        format.json { render :json => @area }
      end
    end
end
