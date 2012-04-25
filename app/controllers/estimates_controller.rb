class EstimatesController < CowController
	inherit_resources

	def index
	  @estimates = Estimate.search(params, current_user.account_id).paginate(:page => params[:page])

	  respond_to do |format|
        format.html # index.html.erb
        format.xml { render :xml => @dentists}
      end
	end

	def new
      @estimate  = Estimate.new
      4.times { @estimate.estimateprocedures.build }
    end

end
